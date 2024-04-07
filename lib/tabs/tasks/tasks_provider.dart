import 'package:flutter/material.dart';
import 'package:todoapp/firebase_utils.dart';
import 'package:todoapp/model/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime selectedDate = DateTime.now();
  Future<void> getTasks(String userId) async {
    final allTasks = await FirebaseUtils.getAllTasksFromFireStore(userId);
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

  void changeSelectedDate(DateTime dateTime, String userId) {
    selectedDate = dateTime;
    notifyListeners();
    getTasks(userId);
  }

  void clear() {
    tasks = [];
    selectedDate = DateTime.now();
  }
}
