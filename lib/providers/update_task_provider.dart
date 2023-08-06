import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/data/data.dart';

final updateTaskProvider = FutureProvider.autoDispose.family(
  (ref, Task task) async {
    final repository = ref.read(taskRepositoryProvider);
    final isCompleted = !task.isCompleted;
    final updatedTask = task.copyWith(isCompleted: isCompleted);

    return await repository.updateTask(updatedTask);
  },
);
