import 'package:json_annotation/json_annotation.dart';
import 'package:onlab1/enums/select_child_gender.dart';
import 'package:onlab1/enums/select_parent_gender.dart';

part 'filter.g.dart';

@JsonSerializable(anyMap: true)
class Filter {
  final SelectParentGender? parentGender;
  final int? parentMinAge;
  final int? parentMaxAge;
  final SelectChildGender? childrenGender;
  final int? childrenMinAge;
  final int? childrenMaxAge;
  final int? distance;

  Filter(
      {this.parentGender,
      this.parentMinAge,
      this.parentMaxAge,
      this.childrenGender,
      this.childrenMinAge,
      this.childrenMaxAge,
      this.distance});

  dynamic toJson() => _$FilterToJson(this);
  factory Filter.fromJson(Map<String, dynamic> obj) => _$FilterFromJson(obj);
}
