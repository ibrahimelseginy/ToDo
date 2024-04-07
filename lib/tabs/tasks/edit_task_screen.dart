import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/apptheme.dart';
import 'package:todoapp/firebase_utils.dart';
import 'package:todoapp/model/task_model.dart';

class EditTaskScreen extends StatefulWidget {
  static const String routeName = 'editTaskScreen';

  const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TaskModel task;

  TextEditingController titleController = TextEditingController();

  var selectedDate = DateTime.now();

  TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dateformate = DateFormat('dd/MM/yyyy');
    var arg = ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Task',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.balckColor,
              ),
        ),
      ),
      body: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        margin: const EdgeInsets.all(25),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Spacer(),
              Text(
                'Edit Task',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.balckColor,
                    ),
              ),
              const Spacer(),
              TextField(
                controller: titleController..text = task.title,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const Spacer(),
              TextField(
                controller: desController..text = task.description,
                decoration: const InputDecoration(labelText: 'Details'),
              ),
              const Spacer(),
              Text(
                'Selected date',
                style: Theme.of(context).textTheme.bodyLarge,
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
              const Spacer(),
              InkWell(
                onTap: () {
                  FirebaseUtils.editTask(task, task.id);
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Save Changes',
                      style: TextStyle(
                        fontSize: 17,
                        color: AppTheme.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
