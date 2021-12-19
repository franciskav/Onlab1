import 'package:onlab1/enums/child_gender.dart';
import 'package:json_annotation/json_annotation.dart';

part 'child.g.dart';

@JsonSerializable()
class Child {
  final String? name;
  final DateTime? birthDate;
  final ChildGender? gender;
  final String? introduction;

  Child(
      {this.name, this.birthDate, this.gender, this.introduction});

  dynamic toJson() => _$ChildToJson(this);
  factory Child.fromJson(Map<String, dynamic> obj) => _$ChildFromJson(obj);
}
