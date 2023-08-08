import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review/shared/components/components.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class done_tasks extends StatefulWidget {
  const done_tasks({Key? key}) : super(key: key);

  @override
  State<done_tasks> createState() => _done_tasks();
}

class _done_tasks extends State<done_tasks> {
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<app_cubit,app_states>(

        listener: (context, state) {},
        builder:(context, state) {
          var tasks = app_cubit.get(context).done_ttasks;
          return app_tasks_bulider(tasks: tasks); } ,




      );

  }
}
