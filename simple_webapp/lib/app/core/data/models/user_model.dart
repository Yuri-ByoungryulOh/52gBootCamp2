import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false, explicitToJson: true)
  factory UserModel({
    @Default('') String email,
    @Default('') String name,
    @Default('') String mobile,
    @Default('USER') String scope,
    @Default('') String address,
    @Default('') String latitude,
    @Default('') String longitude,
    @Default('') String profileImage,
    @Default('') String password,
    @Default('') @JsonKey(ignore: true) String googleOauth2Token,
  }) = _UserModel;

  const UserModel._();
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}