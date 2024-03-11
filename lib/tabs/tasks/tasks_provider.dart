import 'package:flutter/material.dart';
import 'package:todoapp/firebase_utils.dart';
import 'package:todoapp/model/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime selectedDate = DateTime.now();
  Future<void> getTasks() async {
    final allTasks = await FirebaseUtils.getAllTasksFromFireStore();
    tasks = allTasks
        .where((task) =>
            // filter list
            task.dateTime.day == selectedDate.day &&
            task.dateTime.month == selectedDate.month &&
            task.dateTime.year == selectedDate.year)
        .toList();
    tasks.sort((task, nextTask) => task.dateTime.compareTo(nextTask.dateTime));
    notifyListeners();
  }

  void changeSelectedDate(DateTime dateTime) {
    selectedDate = dateTime;
    notifyListeners();
    getTasks();
  }
}
