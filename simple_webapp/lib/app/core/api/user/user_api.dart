import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/constants/api_constants.dart';
import 'package:simple_webapp/app/core/constants/common_constants.dart';
import 'package:simple_webapp/app/core/data/models/user_model.dart';
import 'package:simple_webapp/app/core/providers/services_providers.dart';
import 'package:simple_webapp/app/core/services/app_service.dart';
import 'package:simple_webapp/app/core/services/dio_service.dart';

class UserApi {
  UserApi(this.ref, this._appService, this._dioService);

  final Ref ref;
  final AppService _appService;
  final DioService _dioService;

  // provider 선언
  static final provider = Provider.autoDispose<UserApi>(
        (ref) {
      final appService = ref.watch(appServiceProvider);
      final dioService = ref.watch(dioServiceProvider);
      return UserApi(ref, appService, dioService);
    },
  );

  // 로그인 API
  Future<UserModel> postSignin({
    required String email,
    String? password,
    String? googleOauth2Token,
  }) async {
    final response = await _dioService.dio.post(
      ApiConstant.postSignin,
      data: {
        'email': email,
        'password': password ?? '',
        'google_oauth2_token': googleOauth2Token ?? '',
      },
    );
    await setStorageUserInfo(response.data['data']['jwt_token'].toString(), email);
    _dioService.setAccessToken();
    return UserModel.fromJson(response.data['data']['user']);
  }

  // 회원가입 API
  Future<UserModel> postUser({required UserModel user}) async {
    final response = await _dioService.dio.post(
      ApiConstant.postUser,
      data: user.toJson(),
    );

    await setStorageUserInfo(response.data['data']['jwt_token'].toString(), user.email);
    _dioService.setAccessToken();
    return UserModel.fromJson(response.data['data']['user']);
  }

  // local storage 에 로그인 정보 저장
  Future<void> setStorageUserInfo(String token, String userId) async {
    await _appService.secureStorageService.write(
      key: CommonConstants.jwtTokenKey,
      value: token,
    );
    await _appService.secureStorageService.write(
      key: CommonConstants.loginedUserId,
      value: userId,
    );
  }

  // 회원 목록
  Future<List<UserModel>> getUsers() async {
    final response = await _dioService.dio.get(
      ApiConstant.getUsers,
    );
    return (response.data['data']['users'] as List).map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  // 회원
  Future<UserModel> getUser({required String email}) async {
    final response = await _dioService.dio.get(
      ApiConstant.getUser.replaceAll('{{email}}', email),
    );
    return UserModel.fromJson(response.data['data']);
  }

  // AWS S3 업로드를 위한 preSignedUrl 얻기
  Future<String> postUserS3PreSignedUrl({
    required String filename,
    required String method,
  }) async {
    final response = await _dioService.dio.post(
      ApiConstant.postUserS3PreSignedUrl,
      data: {
        'file_name': filename,
        'http_method': method,
      },
      options: Options(),
    );
    return response.data['data']['pre_signed_url'] as String;
  }

  // preSignedUrl로 S3에 업로드
  Future<String> uplaodS3PresignedUrl({
    required String url,
    required String fileName,
    required Uint8List file,
  }) async {
    final dio = Dio();
    var retUrl = '';

    await dio
        .put(
      url,
      data: Stream.fromIterable(file.toList().map((e) => [e])),
      options: Options(contentType: fileName.split('.').last),
    )
        .whenComplete(() => retUrl = CommonConstants.s3ImageUrl + fileName);

    return retUrl;
  }
}