import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/app/app.dart';
import 'package:flutter_riverpod_todo_app/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    SharedPrefs.init(),
  ]);

  runApp(
    const ProviderScope(
      child: FlutterRiverpodTodoApp(),
    ),
  );
}
