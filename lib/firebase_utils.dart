import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/model/task_model.dart';

class FirebaseUtils {
  static CollectionReference<TaskModel> getTasksCollection() =>
      FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (taskModel, _) => taskModel.toJosn());

  // operation  dataBase (crad operation)
  // create_dataBase
  static Future<void> addTaskToFireStore(TaskModel task) {
    final tasksCollection = getTasksCollection();
    final doc = tasksCollection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  // read_dataBase
  static Future<List<TaskModel>> getAllTasksFromFireStore() async {
    final tasksCollection = getTasksCollection();
    final querySnapshot = await tasksCollection.get();

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  //delete_dataBase
  static void deleteTaskToFireStore(String taskId) {}
}
