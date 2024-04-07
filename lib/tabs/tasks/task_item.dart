import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/apptheme.dart';
import 'package:todoapp/auth/user_provider.dart';
import 'package:todoapp/firebase_utils.dart';
import 'package:todoapp/model/task_model.dart';
import 'package:todoapp/tabs/tasks/edit_task_screen.dart';
import 'package:todoapp/tabs/tasks/tasks_provider.dart';

class TaskItem extends StatefulWidget {
  final TaskModel task;
  const TaskItem(this.task, {super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Slidable(
        key: UniqueKey(),
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          // A pane can dismiss the Slidable.
          // dismissible: DismissiblePane(onDismissed: () {}),
          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (_) {
                Navigator.pushNamed(_, EditTaskScreen.routeName,
                    arguments: widget.task);
                final userId = Provider.of<UserProvider>(context, listen: false)
                    .currentUser!
                    .id;
                FirebaseUtils.deleteTaskToFireStore(userId, widget.task.id)
                    .then(
                      (_) => Provider.of<TasksProvider>(context, listen: false)
                          .getTasks(userId),
                    )
                    .catchError(
                      (_) => Fluttertoast.showToast(
                        msg: "Somthing Went Wrong!",
                        toastLength: Toast.LENGTH_SHORT,
                      ),
                    );
              },
              backgroundColor: AppTheme.redColor,
              foregroundColor: AppTheme.whiteColor,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 62,
                color: Theme.of(context).primaryColor,
                margin: const EdgeInsetsDirectional.only(
                  end: 8,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: widget.task.isDone == true
                              ? AppTheme.greenColor
                              : AppTheme.balckColor,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.task.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  widget.task.isDone = !widget.task.isDone;

                  setState(() {});
                },
                child: widget.task.isDone == true
                    ? Text(
                        'Done..!',
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 12),
                        decoration: BoxDecoration(
                          color: widget.task.isDone
                              ? AppTheme.greenColor
                              : AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Icon(
                          Icons.done,
                          color: AppTheme.whiteColor,
                          size: 30,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
