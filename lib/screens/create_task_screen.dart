import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/utils/utils.dart';
import 'package:flutter_riverpod_todo_app/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: const DisplayWhiteText(
          text: 'Add New Task',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CommonTextField(
              hintText: 'Task Title',
              title: 'Task Title',
            ),
            const Gap(30),
            const Row(
              children: [Text('Category')],
            ),
            const Gap(30),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    hintText: 'Date',
                    title: 'Date',
                    readOnly: true,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.calendar),
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: CommonTextField(
                    hintText: 'Time',
                    title: 'Time',
                    readOnly: true,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.clock),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(30),
            const CommonTextField(
              hintText: 'Notes',
              title: 'Notes',
              maxLines: 6,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: DisplayWhiteText(
                  text: 'Save',
                ),
              ),
            ),
            const Gap(30)
          ],
        ),
      ),
    );
  }
}
