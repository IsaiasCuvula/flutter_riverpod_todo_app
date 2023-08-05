import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/data/data.dart';
import 'date_provider.dart';

final completedTasksProvider = FutureProvider(
  (ref) async {
    final repository = ref.watch(taskRepositoryProvider);
    final date = ref.watch(dateProvider);
    return await repository.getAllTasks();
  },
);
