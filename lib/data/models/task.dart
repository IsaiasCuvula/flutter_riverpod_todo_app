// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_riverpod_todo_app/utils/utils.dart';

class Task extends Equatable {
  final int id;
  final String title;
  final TaskCategory category;
  final String time;
  final DateTime date;
  final bool isCompleted;
  const Task({
    required this.id,
    required this.title,
    required this.category,
    required this.time,
    required this.date,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TaskKeys.id: id,
      TaskKeys.title: title,
      TaskKeys.category: category.name,
      TaskKeys.time: time,
      TaskKeys.date: date.millisecondsSinceEpoch,
      TaskKeys.isCompleted: isCompleted ? 1 : 0,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map[TaskKeys.id] as int,
      title: map[TaskKeys.title] as String,
      category: TaskCategory.stringToTaskCategory(map[TaskKeys.category]),
      time: map[TaskKeys.time] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map[TaskKeys.date] as int),
      isCompleted: map[TaskKeys.isCompleted] == 1 ? true : false,
    );
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.category == category &&
        other.time == time &&
        other.date == date &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        category.hashCode ^
        time.hashCode ^
        date.hashCode ^
        isCompleted.hashCode;
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      category,
      time,
      date,
      isCompleted,
    ];
  }
}
