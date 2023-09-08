import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/api/user/user_api.dart';
import 'package:simple_webapp/app/core/constants/app_route_constants.dart';
import 'package:simple_webapp/app/core/data/models/user_model.dart';
import 'package:simple_webapp/app/core/providers/services_providers.dart';
import 'package:simple_webapp/app/core/services/app_service.dart';
import 'package:simple_webapp/app/routes/app_router.dart';

class ItemListController extends ChangeNotifier {
  // 생성자에서 getUserList 함수를 호출하여 userList를 초기화한다.
  ItemListController(this.ref, this._userApi, this.appService) {
    getUserList();
  }

  // provider를 생성한다.
  static final provider = ChangeNotifierProvider.autoDispose(
        (ref) {
      final userApi = ref.watch(UserApi.provider);
      final appService = ref.read(appServiceProvider);
      return ItemListController(ref, userApi, appService);
    },
  );

  final Ref ref;
  final UserApi _userApi;
  final AppService appService;

  // 사용자 목록을 담는다
  List<UserModel> userList = [];
  // 현재 선택된 사용자를 담는다
  UserModel selectedUser = UserModel();

  // 백앤드에서 사용자 목록을 가져온다
  Future<void> getUserList() async {
    userList = await _userApi.getUsers();
    notifyListeners();
  }

  // 로그아웃을 수행한다
  void logout() {
    appService.secureStorageService.deleteAll();
    ref.read(AppRouter.provider).go(AppRouteConstants.login);
  }
}