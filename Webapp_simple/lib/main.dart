import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
// import 'package:simple_webapp/app/app.dart';

void main() async {
  runApp(
    ProviderScope(
      child: const App(),
    ),
  );
}
