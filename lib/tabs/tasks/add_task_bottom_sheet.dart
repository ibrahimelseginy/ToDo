import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/apptheme.dart';
import 'package:todoapp/tabs/tasks/default_elevated_button.dart';
import 'package:todoapp/tabs/tasks/default_text_form_field.dart';

class AddTaskButtomSheet extends StatefulWidget {
  const AddTaskButtomSheet({super.key});

  @override
  State<AddTaskButtomSheet> createState() => _AddTaskButtomSheetState();
}

class _AddTaskButtomSheetState extends State<AddTaskButtomSheet> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final dateformate = DateFormat('dd/MM/yyyy');
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Add new Task',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppTheme.balckColor),
            ),
            DefaultTextFormField(
              controller: titleController,
              hintText: 'Enter task title',
              maxlines: 2,
            ),
            const SizedBox(
              height: 16,
            ),
            DefaultTextFormField(
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
                    initialDate: DateTime.now(),
                    initialEntryMode: DatePickerEntryMode.calendarOnly);
                //new var (date)
                if (date != null) selectedDate = date;
              },
              child: Text(
                // DateTime.now().toString().substring(0, 10)
                dateformate.format(DateTime.now()),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            DefaultElevatedButton(
              onpressed: addtask,
              label: 'Add',
            )
          ],
        ),
      ),
    );
  }

  void addtask() {}
}
