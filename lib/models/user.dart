import 'package:onlab1/enums/parent_gender.dart';
import 'package:onlab1/models/child.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final String? id;
  final String? email;
  final String? name;
  final DateTime? birthDate;
  final ParentGender? gender;
  final List<Child>? children;
  final String? introduction;
  final String? photo;

  User(
      {this.id,
      this.email,
      this.name,
      this.birthDate,
      this.gender,
      this.children,
      this.introduction,
      this.photo});

  dynamic toJson() => _$UserToJson(this);
  factory User.fromJson(Map<String, dynamic> obj) => _$UserFromJson(obj);
}
