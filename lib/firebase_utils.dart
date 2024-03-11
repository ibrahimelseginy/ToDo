import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/model/task_model.dart';

class FirebaseUtils {
  static CollectionReference<TaskModel> getTasksCollection() =>
      FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (taskModel, _) => taskModel.toJosn());
  // operation  dataBase (crud operation)

  // 1- create_dataBase
  static Future<void> addTaskToFireStore(TaskModel task) {
    final tasksCollection = getTasksCollection();
    final doc = tasksCollection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  //2- read_dataBase
  static Future<List<TaskModel>> getAllTasksFromFireStore() async {
    final tasksCollection = getTasksCollection();
    final querySnapshot = await tasksCollection.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  //3- delete_dataBase
  /*static Future<void> deleteTaskToFireStore(String taskId) async {
    final tasksCollection = getTasksCollection();
    await tasksCollection.doc(taskId).delete();
  }*/
  static Future<void> deleteTaskToFireStore(String taskId) {
    final tasksCollection = getTasksCollection();
    return tasksCollection.doc(taskId).delete();
  }
}
