// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filter _$FilterFromJson(Map json) => Filter(
      parentGender: $enumDecodeNullable(
          _$SelectParentGenderEnumMap, json['parentGender']),
      parentMinAge: json['parentMinAge'] as int?,
      parentMaxAge: json['parentMaxAge'] as int?,
      childrenGender: $enumDecodeNullable(
          _$SelectChildGenderEnumMap, json['childrenGender']),
      childrenMinAge: json['childrenMinAge'] as int?,
      childrenMaxAge: json['childrenMaxAge'] as int?,
      distance: json['distance'] as int?,
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'parentGender': _$SelectParentGenderEnumMap[instance.parentGender],
      'parentMinAge': instance.parentMinAge,
      'parentMaxAge': instance.parentMaxAge,
      'childrenGender': _$SelectChildGenderEnumMap[instance.childrenGender],
      'childrenMinAge': instance.childrenMinAge,
      'childrenMaxAge': instance.childrenMaxAge,
      'distance': instance.distance,
    };

const _$SelectParentGenderEnumMap = {
  SelectParentGender.man: 'man',
  SelectParentGender.woman: 'woman',
  SelectParentGender.any: 'any',
};

const _$SelectChildGenderEnumMap = {
  SelectChildGender.boy: 'boy',
  SelectChildGender.girl: 'girl',
  SelectChildGender.any: 'any',
};
