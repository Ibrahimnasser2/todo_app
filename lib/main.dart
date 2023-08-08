import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:review/modules/todo_app/cubit/cubit.dart';
import 'package:review/shared/bloc_observer.dart';
import 'package:review/shared/network/local/cach_helper.dart';
import 'package:review/shared/network/remote/dio_helper.dart';
import 'layout/todo_layout/todo_app_layout.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  dio_helper.init();
  await cash_helper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
       return MaterialApp(
         debugShowCheckedModeBanner: false,
         // theme: ThemeData(
         //     scaffoldBackgroundColor: Colors.white,
         //
         //     primaryColor: Colors.deepOrange,
         //     appBarTheme: AppBarTheme(
         //       color: Colors.white,
         //       elevation: 0.0,
         //       actionsIconTheme: IconThemeData(
         //         color: Colors.black,
         //
         //       ),
         //       backwardsCompatibility: false,
         //
         //       titleTextStyle: TextStyle(
         //           color: Colors.black,
         //           fontSize: 20,
         //           fontWeight:FontWeight.bold
         //       ),
         //
         //     ),
         //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
         //       type: BottomNavigationBarType.fixed,
         //
         //       elevation: 20,
         //       selectedItemColor: Colors.deepOrange,
         //       unselectedItemColor: Colors.black45,
         //
         //     )
         //
         // ),
         // darkTheme: ThemeData(
         //
         //     scaffoldBackgroundColor: HexColor("333739"),
         //     primaryColorDark: Colors.deepOrange,
         //     primaryColorLight: Colors.deepOrange,
         //     iconTheme:IconThemeData(color: Colors.white) ,
         //
         //     textTheme: TextTheme(
         //         bodyText1: TextStyle(
         //           fontSize: 18,
         //           color: Colors.white,
         //         )
         //     ),
         //
         //     primaryColor: Colors.deepOrange,
         //     appBarTheme: AppBarTheme(
         //       textTheme: TextTheme(
         //           bodyText1: TextStyle(
         //             fontSize: 18,
         //             color: Colors.white,
         //           )
         //       ),
         //       color: HexColor("333739"),
         //       elevation: 0.0,
         //       actionsIconTheme: IconThemeData(
         //         color: Colors.white,
         //
         //       ),
         //       backwardsCompatibility: false,
         //
         //       titleTextStyle: TextStyle(
         //           color: Colors.black,
         //           fontSize: 20,
         //           fontWeight:FontWeight.bold
         //       ),
         //
         //     ),
         //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
         //       backgroundColor: HexColor("333739"),
         //       unselectedItemColor:  Colors.grey,
         //       type: BottomNavigationBarType.fixed,
         //
         //
         //       elevation: 20,
         //       selectedItemColor: Colors.deepOrange,
         //
         //
         //     )
         //
         // ),
         home: Directionality(
             textDirection:TextDirection.ltr ,
             child: todo_layout()),
       );



  }

}



