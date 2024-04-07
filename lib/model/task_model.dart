import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  TaskModel(
      {this.id = '',
      required this.title,
      required this.description,
      this.isDone = false,
      required this.dateTime});

  // Transformation from json=> to dart

/*
  // first way
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        isDone: json['isDone'],
        dateTime: json['dateTime']
        
        );
  }*/

  // second way
  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            description: json['description'],
            isDone: json['isDone'],
            dateTime: (json['dateTime'] as Timestamp).toDate());

  //Transformation from dart => to json
  Map<String, dynamic> toJosn() => {
        'id': id,
        'title': title,
        'description': description,
        'isDone': isDone,
        'dateTime': Timestamp.fromDate(dateTime),
      };
}
