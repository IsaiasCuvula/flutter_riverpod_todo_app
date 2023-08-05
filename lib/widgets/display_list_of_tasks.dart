import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/data/data.dart';
import 'package:flutter_riverpod_todo_app/utils/utils.dart';
import 'package:flutter_riverpod_todo_app/widgets/widgets.dart';

class DisplayListOfTasks extends StatelessWidget {
  const DisplayListOfTasks({
    super.key,
    this.isCompletedTasks = false,
    required this.tasks,
  });
  final bool isCompletedTasks;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksAlert = isCompletedTasks
        ? 'There is no completed task yet'
        : 'There is no tasks yet';

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: DisplayWhiteText(text: emptyTasksAlert),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (ctx, index) {
                final task = tasks[index];

                return TaskTile(
                  category: TaskCategory.others,
                  title: task.title,
                  time: task.time,
                  isCompleted: task.isCompleted,
                );
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 1.5,
              ),
            ),
    );
  }
}
