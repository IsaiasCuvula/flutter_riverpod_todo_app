import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/utils/extensions.dart';
import 'common_container.dart';

class DisplayErrorMessage extends StatelessWidget {
  const DisplayErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    return CommonContainer(
      width: deviceSize.width,
      height: deviceSize.height * 0.3,
      child: const Center(
        child: Text('Something went wrong'),
      ),
    );
  }
}
