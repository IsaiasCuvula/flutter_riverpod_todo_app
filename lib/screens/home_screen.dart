import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/utils/utils.dart';
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
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: deviceSize.height * 0.3,
        width: deviceSize.width,
        color: colors.primary,
        child: Column(
          children: [
            const Text('My Todo List'),
            Container(
              height: 20,
              width: 20,
              color: colors.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
