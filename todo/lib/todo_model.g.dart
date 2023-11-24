// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      title: json['title'] as String,
      status: $enumDecode(_$ToDoStatusEnumMap, json['status']),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'title': instance.title,
      'status': _$ToDoStatusEnumMap[instance.status]!,
      'date': instance.date.toIso8601String(),
    };

const _$ToDoStatusEnumMap = {
  ToDoStatus.completed: 'completed',
  ToDoStatus.pending: 'pending',
};
