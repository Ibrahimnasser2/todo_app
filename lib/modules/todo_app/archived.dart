import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review/shared/components/components.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class archived extends StatefulWidget {
  const archived({Key? key}) : super(key: key);

  @override
  State<archived> createState() => _archived();
}

class _archived extends State<archived> {
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<app_cubit,app_states>(

        listener: (context, state) {},
        builder:(context, state) {
          var tasks = app_cubit.get(context).arch_tasks;
          return app_tasks_bulider(tasks: tasks); } ,




      );

  }
}
