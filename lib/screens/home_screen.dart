import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/config/config.dart';
import 'package:flutter_riverpod_todo_app/utils/utils.dart';
import 'package:flutter_riverpod_todo_app/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    return Scaffold(
      body: Stack(
        children: [
          AppBackground(
            headerHeight: deviceSize.height * 0.3,
            header: const Column(
              children: [
                Gap(60),
                DisplayWhiteText(
                  text: 'July 26, 2023',
                  fontWeight: FontWeight.normal,
                ),
                DisplayWhiteText(text: 'My Todo List', size: 40),
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
                  const DisplayListOfTasks(
                    tasks: [],
                  ),
                  const Gap(20),
                  Text(
                    'Completed',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),
                  const DisplayListOfTasks(
                    isCompletedTasks: true,
                    tasks: [],
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
