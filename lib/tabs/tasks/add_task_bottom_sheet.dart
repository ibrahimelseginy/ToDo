import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/apptheme.dart';
import 'package:todoapp/firebase_utils.dart';
import 'package:todoapp/model/task_model.dart';
import 'package:todoapp/tabs/tasks/default_elevated_button.dart';
import 'package:todoapp/tabs/tasks/default_text_form_field.dart';
import 'package:todoapp/tabs/tasks/tasks_provider.dart';

class AddTaskButtomSheet extends StatefulWidget {
  const AddTaskButtomSheet({super.key});

  @override
  State<AddTaskButtomSheet> createState() => _AddTaskButtomSheetState();
}

class _AddTaskButtomSheetState extends State<AddTaskButtomSheet> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  var selectedDate = DateTime.now();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final dateformate = DateFormat('dd/MM/yyyy');
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            key: formkey,
            children: [
              Text(
                'Add new Task',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppTheme.balckColor),
              ),
              DefaultTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title can\'t be empty';
                  }
                  return null;
                },
                controller: titleController,
                hintText: 'Enter task title',
                maxlines: 2,
              ),
              const SizedBox(
                height: 16,
              ),
              DefaultTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description can\'t be empty';
                  }
                  return null;
                },
                controller: descriptionController,
                hintText: 'Enter  task description',
                maxlines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Selected date',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              InkWell(
                onTap: () async {
                  //dont reasign the same var (date not reasign)
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 356)),
                      initialDate: selectedDate,
                      initialEntryMode: DatePickerEntryMode.calendarOnly);
                  //new var (date)
                  if (date != null) selectedDate = date;
                  setState(() {});
                },
                child: Text(
                  // DateTime.now().toString().substring(0, 10)
                  dateformate.format(selectedDate),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              DefaultElevatedButton(
                onpressed: addtask,
                child: Text(
                  'Add',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppTheme.whiteColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addtask() {
    if (formkey.currentState?.validate() == true) {
      FirebaseUtils.addTaskToFireStore(TaskModel(
              title: titleController.text,
              description: descriptionController.text,
              dateTime: selectedDate))
          //success in Remote
          /*
        .then((_) {
      print('success');})
      */
          //success in Local
          .timeout(const Duration(milliseconds: 100), onTimeout: () {
        Provider.of<TasksProvider>(context, listen: false).getTasks();
        Navigator.of(context).pop();
        Fluttertoast.showToast(
          msg: "Task added Successfully",
          toastLength: Toast.LENGTH_SHORT,
        );
      }).catchError(
        (_) {
          Navigator.of(context).pop();
          Fluttertoast.showToast(
            msg: "Somthing Went Wrong!",
            toastLength: Toast.LENGTH_SHORT,
          );
        },
      );
    }
  }
}
