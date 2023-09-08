import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/services/app_service.dart';
import 'package:simple_webapp/app/core/services/dio_service.dart';
import 'package:simple_webapp/app/core/services/secure_storage_service.dart';
import 'package:simple_webapp/app/routes/app_router.dart';

final _secureStorageServiceProvider =
    Provider<SecureStorageService>((ref) => throw UnimplementedError());

final appServiceProvider = Provider<AppService>((ref) {
  final secureStorageService = ref.watch(_secureStorageServiceProvider);
  final appRouter = ref.read(AppRouter.provider);
  return AppService(
    secureStorageService,
    appRouter,
  );
});

final dioServiceProvider = Provider<DioService>((ref) {
  final appService = ref.watch(appServiceProvider);
  return DioService(appService);
});

// main 에서 provider 오버라이드시 사용
List<Override> overridesProvider(SecureStorageService secureStorageService) {
  return [
    _secureStorageServiceProvider.overrideWithValue(secureStorageService),
  ];
}
