import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/data/data.dart';
import 'package:flutter_riverpod_todo_app/providers/providers.dart';
import 'package:intl/intl.dart';

@immutable
class Helpers {
  const Helpers._();
  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final date = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
      final formatType = DateFormat.jm();
      return formatType.format(date);
    } catch (e) {
      return '12:00';
    }
  }

  static void selectDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(dateProvider);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2060),
    );

    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }

  static bool isTaskFromSelectedDate(Task task, DateTime selectedDate) {
    final DateTime taskDate = _stringToDateTime(task.date);
    if (taskDate.month == selectedDate.month &&
        taskDate.year == selectedDate.year &&
        taskDate.day == selectedDate.day) {
      return true;
    }
    return false;
  }

  static DateTime _stringToDateTime(String dateString) {
    try {
      DateFormat format = DateFormat.yMMMd();
      return format.parse(dateString);
    } catch (e) {
      return DateTime.now();
    }
  }

  static String dateFormatter(DateTime date) {
    try {
      return DateFormat.yMMMd().format(date);
    } catch (e) {
      return DateFormat.yMMMd().format(
        DateTime.now(),
      );
    }
  }
}
