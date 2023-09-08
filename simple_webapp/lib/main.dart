import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:simple_webapp/app/app.dart';
import 'package:simple_webapp/app/core/providers/services_providers.dart';
import 'package:simple_webapp/app/core/services/secure_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  // SecureStorageService 초기화
  final secureStorageService = await SecureStorageService().init();

  runApp(
    ProviderScope(
      overrides: [
        // SecureStorageService 오버라이드
        ...overridesProvider(secureStorageService),
      ],
      child: const App(),
    ),
  );
}