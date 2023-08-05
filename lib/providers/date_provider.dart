import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});
