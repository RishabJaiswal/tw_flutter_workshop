import 'package:json_annotation/json_annotation.dart';
part 'todo_model.g.dart';
@JsonSerializable()

class TodoModel{
  String title;
  ToDoStatus status;
  DateTime date;

  TodoModel({required this.title,required this.status, required this.date});
  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}


enum ToDoStatus{
  completed,
  pending,
}