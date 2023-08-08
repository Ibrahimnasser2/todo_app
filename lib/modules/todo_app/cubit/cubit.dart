import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review/modules/todo_app/cubit/states.dart';
import 'package:sqflite/sqflite.dart';
import '../archived.dart';
import '../done_tasks.dart';
import '../new_tasks.dart';

class app_cubit extends Cubit<app_states>{
  app_cubit() : super(app_init_states());
  static app_cubit get(context)=> BlocProvider.of(context);
  List <String> title =["new Tasks","done Tasks","archived Tasks"];
  List <Widget> task_type =[new_tasks(),done_tasks(),archived()];
  int c_index=0;
  List<Map>tasks=[];
  List<Map>done_ttasks=[];
  List<Map>arch_tasks=[];

  bool isadd=true;
  Icon action_button=Icon(Icons.add);


  Database? database;
  
  void change_nav_bar (int index){

    c_index=index;
    emit(change_nav_bar_state());
  }

  void getfromdatabase(database){
    tasks=[];
   done_ttasks=[];
    arch_tasks=[];
       database!.rawQuery("select * from tasks").
       then((value) {

         value.forEach((element) {
           if(element["status"]=="new"){
             tasks.add(element);
           }
           if(element["status"]=="done"){
             done_ttasks.add(element);
           }
           if(element["status"]=="arch"){
             arch_tasks.add(element);
           }});
         emit(get_from_DB_state());

       });

  }


   insertdatabase({
    required String title,
    required String date,
    required String time

  })async {
     database!.transaction((txn) async{
      txn
          .rawInsert(
          'insert into tasks(title,date,time,status) values( "$title","$date","$time","new"  ) ')
          .then((value) {
        print("$value is created");
        emit(insert_in_DB_state());
        getfromdatabase(value);
        emit(get_from_DB_state());


      })
          .catchError((error) {
        print("$error is created,when insert row");});

    }

    );
  }


  void update_database({
      required id,
      required status   }
      ) async {
      await database!.rawUpdate('update tasks set status = ? where id = ? ', ['$status', '$id'])
          .then((value){

          getfromdatabase(database);
          emit(update_DB_state());









      } );

  }


  void delete_from_database({
    required id,
      }
      ) async {
    database!.rawDelete('delete from tasks  where id = ? ',['$id'])
        .then((value){
      getfromdatabase(database);
      emit(delete_from_DB_state());









    } );

  }



  void createdatabase() {
     openDatabase("todo.db",
      version: 1,
      onCreate: (database,version){
        print("database is created");
        database.execute("create table tasks (id integer primary key, date text,title text, time text,status text) "
        ).then((value) => print("table is created")).catchError((error){print("error when table is created ${error.toString()}");});
      },
      onOpen:(database){
        print("database is opened");
        getfromdatabase(database);
        emit(get_from_DB_state());
      } ,
    ).then((value) {
   database=value;
   emit(create_DB_state());
      
     });

  }

  void change_app_bar_states({required bool is_add, required icon})
  {
    isadd=is_add;

    action_button=icon;
    emit(change_app_bar_state());

  }












}