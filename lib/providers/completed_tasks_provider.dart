import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/data/data.dart';
import 'package:flutter_riverpod_todo_app/utils/helpers.dart';
import 'date_provider.dart';

final completedTasksProvider = FutureProvider.autoDispose(
  (ref) async {
    final repository = ref.watch(taskRepositoryProvider);
    final date = ref.watch(dateProvider);
    final allTasks = await repository.getAllTasks();
    final List<Task> filteredTask = [];
    for (var task in allTasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
      if (isTaskDay) {
        filteredTask.add(task);
      }
    }

    return filteredTask;
  },
);
