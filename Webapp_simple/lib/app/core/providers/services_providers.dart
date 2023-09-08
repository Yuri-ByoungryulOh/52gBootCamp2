import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webapp_simple/app/routes/app_router.dart';
import 'package:flutter_webapp_simple/app/services/app_service.dart';

final appServiceProvider = Provider<AppService>((ref) {
  final appRouter = ref.read(AppRouter.provider);
  return AppService(
    appRouter,
  );
});
