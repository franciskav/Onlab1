// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Child _$ChildFromJson(Map<String, dynamic> json) => Child(
      name: json['name'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: $enumDecodeNullable(_$ChildGenderEnumMap, json['gender']),
      introduction: json['introduction'] as String?,
    );

Map<String, dynamic> _$ChildToJson(Child instance) => <String, dynamic>{
      'name': instance.name,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': _$ChildGenderEnumMap[instance.gender],
      'introduction': instance.introduction,
    };

const _$ChildGenderEnumMap = {
  ChildGender.boy: 'boy',
  ChildGender.girl: 'girl',
};
