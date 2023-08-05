import 'package:flutter/material.dart';

enum TaskCategory {
  personal(Icons.book, Colors.lightBlue),
  work(Icons.emoji_events, Colors.amber),
  others(Icons.calendar_month_rounded, Colors.purple);

  static TaskCategory stringToTaskCategory(String name) {
    try {
      return TaskCategory.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return TaskCategory.others;
    }
  }

  final IconData icon;
  final Color color;
  const TaskCategory(this.icon, this.color);
}
