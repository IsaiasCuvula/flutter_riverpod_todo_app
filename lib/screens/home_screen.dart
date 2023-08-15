import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/config/config.dart';
import 'package:flutter_riverpod_todo_app/data/data.dart';
import 'package:flutter_riverpod_todo_app/providers/providers.dart';
import 'package:flutter_riverpod_todo_app/utils/utils.dart';
import 'package:flutter_riverpod_todo_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final date = ref.watch(dateProvider);
    final taskState = ref.watch(tasksProvider);
    final inCompletedTasks = _incompltedTask(taskState.tasks, ref);
    final completedTasks = _compltedTask(taskState.tasks, ref);

    return Scaffold(
      body: Stack(
        children: [
          AppBackground(
            headerHeight: deviceSize.height * 0.3,
            header: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Helpers.selectDate(context, ref),
                    child: DisplayWhiteText(
                      text: Helpers.dateFormatter(date),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const DisplayWhiteText(text: 'My Todo List', size: 40),
                ],
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTasks(
                      tasks: inCompletedTasks,
                    ),
                    const Gap(20),
                    Text(
                      'Completed',
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(20),
                    DisplayListOfTasks(
                      isCompletedTasks: true,
                      tasks: completedTasks,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () => context.push(RouteLocation.createTask),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(
                          text: 'Add New Task',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Task> _incompltedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (!task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }

  List<Task> _compltedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }
}
