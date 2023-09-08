import 'package:go_router/go_router.dart';
import 'package:simple_webapp/app/core/data/models/user_model.dart';
import 'package:simple_webapp/app/core/services/secure_storage_service.dart';

class AppService {
  AppService(
      this.secureStorageService,
      this.appRouter,
      );

  final SecureStorageService secureStorageService;
  final GoRouter appRouter;

  UserModel loginUser = UserModel();
  bool get isLogin => (loginUser.email).isNotEmpty;
}