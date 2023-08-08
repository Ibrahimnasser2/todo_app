
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:review/modules/todo_app/cubit/cubit.dart';
import 'package:review/modules/todo_app/cubit/states.dart';
import 'package:review/shared/components/components.dart';
import 'package:review/shared/components/constant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:review/modules/todo_app/archived.dart';
import 'package:review/modules/todo_app/done_tasks.dart';
import 'package:review/modules/todo_app/new_tasks.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';




class todo_layout extends StatelessWidget {


  var scafolfkey =GlobalKey<ScaffoldState>();
  var title_controller= TextEditingController();
  var time_controller= TextEditingController();
  var data_controller= TextEditingController();
  var formkey = GlobalKey<FormState>();











  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> app_cubit()..createdatabase(),
      child: BlocConsumer<app_cubit,app_states>(
        listener:(context, state){
          if(state is insert_in_DB_state){

            Navigator.pop(context);
          }

        } ,
        builder: (context, state){
          app_cubit app_nav= app_cubit.get(context);
         return Scaffold(

          key: scafolfkey,
          appBar: AppBar(
            title: Text(app_nav.title[app_nav.c_index]) ,
          ),
          body: app_nav.task_type[app_nav.c_index],
          floatingActionButton: FloatingActionButton(onPressed: ()async{

            if(app_nav.isadd){
              app_nav.change_app_bar_states(is_add: false,icon: Icon(Icons.edit));
              scafolfkey.currentState!.showBottomSheet((context) =>Container(
                width: double.infinity,


                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisSize:MainAxisSize.min ,
                      children: [
                        TextFormField(

                      controller: title_controller ,
                      keyboardType: TextInputType.text,


                      onFieldSubmitted: (String value){
                        print(value);
                      },
                      validator: (value){
                        if(!(value!.isEmpty)){
                          return null;
                        }
                        return("not valid");
                      } ,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        labelText: "task title" ,
                        prefixIcon: Icon( Icons.menu),


                      ) ,



                    ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: time_controller ,
                          keyboardType: TextInputType.text,
                          onTap: (){showTimePicker(context: context, initialTime: TimeOfDay.now()).
                          then((value) {
                            time_controller.text=value!.format(context).toString();

                          } );},
                          onFieldSubmitted: (String value){
                            print(value);
                          },
                          validator: (value){
                            if(!(value!.isEmpty)){
                              return null;
                            }
                            return("not valid");
                          } ,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),

                            labelText: "task time" ,
                            prefixIcon: Icon( Icons.watch_later_outlined),


                          ) ,



                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: data_controller ,
                          keyboardType: TextInputType.text,
                          onTap:(){
                            showDatePicker(context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse("2030-08-27"))
                                .then((value) {data_controller.text=DateFormat.yMMMd().format(value!);});
                          },
                          onFieldSubmitted: (String value){
                            print(value);
                          },
                          validator: (value){
                            if(!(value!.isEmpty)){
                              return null;
                            }
                            return("not valid");
                          } ,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),

                            labelText: "task date" ,
                            prefixIcon: Icon( Icons.calendar_today_outlined),


                          ) ,



                        ),


                      ],),
                  ),
                ),
              ) ).
              closed.then((value) {



                app_nav.change_app_bar_states(is_add: true,icon: Icon(Icons.add));

              });




            }
            else{
              if(formkey.currentState!.validate()){
                app_nav.insertdatabase(
                  date: data_controller.text,
                  time: time_controller.text,
                  title:title_controller.text ,
                );

                app_nav.getfromdatabase(app_nav.database);
                app_nav.change_app_bar_states(is_add: true, icon: Icon(Icons.add));
                 /* app_nav.getfromdatabase(app_nav.database).
                  then((value) {
                    app_nav.tasks=value;
                    app_nav.change_app_bar_states(is_add: true, icon: Icon(Icons.add));

                  });*/




              }


            }







          },child: app_nav.action_button),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.menu),label: "tasks"),
              BottomNavigationBarItem(icon: Icon(Icons.cloud_done_outlined),label: "done"),
              BottomNavigationBarItem(icon: Icon(Icons.archive_sharp),label: "archived"),],
            onTap: (index){
              app_nav.change_nav_bar(index);

            },
            currentIndex: app_nav.c_index,


          ),
        );}
      ),
    );
  }

















}






