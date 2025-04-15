import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_theme.dart';
import 'package:todoapp/auth/user_provider.dart';
import 'package:todoapp/firebase_utils.dart';
import 'package:todoapp/generated/l10n.dart';
import 'package:todoapp/model/task_model.dart';
import 'package:todoapp/tabs/tasks/default_elevated_button.dart';
import 'package:todoapp/tabs/tasks/task_tab.dart';

// ignore: must_be_immutable
class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});
  static const String routeName = '/edit-task-screen';

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  var selecetdDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as TaskModel;
    final userId =
        Provider.of<UserProvider>(context, listen: false).currentUser!.id;

    TextTheme textTheme = Theme.of(context).textTheme;
    final dateFormat = DateFormat('dd/MM/yyyy');
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).toDoList),
      ),
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                S.of(context).editTask,
                style: TextStyle(
                    color: AppTheme.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 1,
              ),
              TextFormField(
                  initialValue: arg.title,
                  onChanged: (val) => arg.title = val,
                  // controller: titleController..text = arg.title,
                  decoration: const InputDecoration(hintText: 'This is title')),
              const Spacer(
                flex: 1,
              ),
              TextFormField(
                  initialValue: arg.description,
                  onChanged: (val) => arg.description = val,
                  // controller: titleController..text = arg.description,
                  decoration: const InputDecoration(hintText: 'Task details')),
              const Spacer(
                flex: 1,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  S.of(context).selectTime,
                  style: TextStyle(
                      color: AppTheme.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              InkWell(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    initialDate: selecetdDate,
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                  );
                  if (date != null) {
                    selecetdDate = date;
                    setState(() {});
                  }
                },
                child: Text(
                  dateFormat.format(selecetdDate),
                  // DateTime.now().toString().substring(0, 10),
                  style: textTheme.bodySmall,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                width: double.infinity,
                child: DefaultElevatedButton(
                    child: Text(
                      S.of(context).save,
                    ),
                    onPressed: () async {
                      Navigator.of(context).pushNamed(TaskTab.routeName);
                      await FirebaseUtils.editTask(arg, userId);
                    }),
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
