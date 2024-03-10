import 'package:flutter/material.dart';
import 'package:todoapp/apptheme.dart';
import 'package:todoapp/model/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  const TaskItem(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: AppTheme.whiteColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 62,
            color: Theme.of(context).primaryColor,
            margin: const EdgeInsetsDirectional.only(end: 8),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                task.description,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            height: 34,
            width: 69,
            child: Image.asset('assets/images/icon_check.png'),
          )
        ],
      ),
    );
  }
}
