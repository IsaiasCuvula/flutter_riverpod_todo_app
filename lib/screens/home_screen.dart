import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/config/config.dart';
import 'package:flutter_riverpod_todo_app/providers/providers.dart';
import 'package:flutter_riverpod_todo_app/utils/utils.dart';
import 'package:flutter_riverpod_todo_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

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
    final tasks = ref.watch(tasksProvider);
    final date = ref.watch(dateProvider);
    final completedTasks = ref.watch(completedTasksProvider);

    return Scaffold(
      body: Stack(
        children: [
          AppBackground(
            headerHeight: deviceSize.height * 0.3,
            header: Column(
              children: [
                const Gap(60),
                InkWell(
                  onTap: () => Helpers.selectDate(context, ref),
                  child: DisplayWhiteText(
                    text: DateFormat.yMMMd().format(date),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const DisplayWhiteText(text: 'My Todo List', size: 40),
              ],
            ),
          ),
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  tasks.when(
                    data: (tasks) {
                      return DisplayListOfTasks(
                        tasks: tasks,
                      );
                    },
                    error: (error, _) => const DisplayErrorMessage(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'Completed',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),
                  completedTasks.when(
                    data: (completedTasks) {
                      return DisplayListOfTasks(
                        isCompletedTasks: true,
                        tasks: completedTasks,
                      );
                    },
                    error: (error, _) => const DisplayErrorMessage(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
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
        ],
      ),
    );
  }
}
