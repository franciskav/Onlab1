// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: $enumDecodeNullable(_$ParentGenderEnumMap, json['gender']),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Child.fromJson(e as Map<String, dynamic>))
          .toList(),
      introduction: json['introduction'] as String?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': _$ParentGenderEnumMap[instance.gender],
      'children': instance.children?.map((e) => e.toJson()).toList(),
      'introduction': instance.introduction,
      'photo': instance.photo,
    };

const _$ParentGenderEnumMap = {
  ParentGender.man: 'man',
  ParentGender.woman: 'woman',
};
