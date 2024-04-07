import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp/model/task_model.dart';
import 'package:todoapp/model/user_model.dart';

class FirebaseUtils {
  static CollectionReference<UserModel> getUsersCollection() =>
      FirebaseFirestore.instance.collection('Users').withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (userModel, _) => userModel.toJosn(),
          );
  static CollectionReference<TaskModel> getTasksCollection(String userId) =>
      getUsersCollection()
          .doc(userId)
          .collection('tasks')
          .withConverter<TaskModel>(
            fromFirestore: (snapshot, _) =>
                TaskModel.fromJson(snapshot.data()!),
            toFirestore: (taskModel, _) => taskModel.toJosn(),
          );

  // operation  dataBase (crud operation)

  // 1- create_dataBase
  static Future<void> addTaskToFireStore(
    TaskModel task,
    userId,
  ) {
    final tasksCollection = getTasksCollection(userId);
    final doc = tasksCollection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  //2- read_dataBase
  static Future<List<TaskModel>> getAllTasksFromFireStore(
    userId,
  ) async {
    final tasksCollection = getTasksCollection(userId);
    final querySnapshot = await tasksCollection.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  //3- delete_dataBase
  /*static Future<void> deleteTaskToFireStore(String taskId) async {
    final tasksCollection = getTasksCollection();
    await tasksCollection.doc(taskId).delete();
  }*/
  static Future<void> deleteTaskToFireStore(
    String taskId,
    userId,
  ) {
    final tasksCollection = getTasksCollection(userId);
    return tasksCollection.doc(taskId).delete();
  }

  // 3- Update_dataBase
  static Future<void> editTask(
    TaskModel task,
    userId,
  ) {
    final tasksCollection = getTasksCollection(userId);
    final doc = tasksCollection.doc(task.id);
    return doc.update(
      task.toJosn(),
    );
  }

  static Future<UserModel> register({
    required String email,
    required String name,
    required String password,
  }) async {
    final credentials =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = UserModel(
      id: credentials.user!.uid,
      name: name,
      email: email,
    );
    final usersCollection = getUsersCollection();
    // يخلص  set  بعدما ال  user قبل ما يرجع  await لازم اعمل
    await usersCollection.doc(user.id).set(user);
    return user;
  }

  static Future<UserModel> login(
      {required String email, required String password}) async {
    final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final usersCollection = getUsersCollection();
    final docSnapshot = await usersCollection.doc(credentials.user!.uid).get();
    return docSnapshot.data()!;
  }

  static Future<void> logout() {
    return FirebaseAuth.instance.signOut();
  }
}
