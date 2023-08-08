import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review/shared/components/components.dart';
import 'package:review/shared/components/constant.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';


class new_tasks extends StatefulWidget {
  const new_tasks({Key? key}) : super(key: key);

  @override
  State<new_tasks> createState() => _new_tasksState();
}

class _new_tasksState extends State<new_tasks> {
  @override
  Widget build(BuildContext context) {
    return
       BlocConsumer<app_cubit,app_states>(

         listener: (context, state) {},
         builder:(context, state) {
           var tasks = app_cubit.get(context).tasks;
           return app_tasks_bulider(tasks: tasks); } ,




       );

  }
}
