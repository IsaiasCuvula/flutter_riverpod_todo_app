import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/data/data.dart';

final deleteTaskProvider = FutureProvider.autoDispose.family(
  (ref, Task task) async {
    final repository = ref.read(taskRepositoryProvider);
    return await repository.deleteTask(task);
  },
);
