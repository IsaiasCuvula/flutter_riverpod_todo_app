import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeProvider = StateProvider.autoDispose<TimeOfDay>((ref) {
  return TimeOfDay.now();
});
