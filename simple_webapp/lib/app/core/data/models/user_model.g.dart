// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      scope: json['scope'] as String? ?? 'USER',
      address: json['address'] as String? ?? '',
      latitude: json['latitude'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
      profileImage: json['profile_image'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'mobile': instance.mobile,
      'scope': instance.scope,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'profile_image': instance.profileImage,
      'password': instance.password,
    };
