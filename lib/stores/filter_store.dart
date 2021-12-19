import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';
import 'package:onlab1/enums/select_child_gender.dart';
import 'package:onlab1/enums/select_parent_gender.dart';
import 'package:onlab1/models/filter.dart';

part 'filter_store.g.dart';

class FilterStore = _FilterStore with _$FilterStore;

abstract class _FilterStore with Store {
  int parentMinAgeConst = 18;
  int parentMaxAgeConst = 100;
  int childMinAgeConst = 0;
  int childMaxAgeConst = 14;
  int maxDistanceConst = 100;

  @observable
  Filter filter = Filter();

  @computed
  SelectParentGender? get parentGender {
    return filter.parentGender;
  }

  @computed
  double get parentMinAge {
    if (filter.parentMinAge == null) {
      return parentMinAgeConst.toDouble();
    }
    return filter.parentMinAge!.toDouble();
  }

  @computed
  double get parentMaxAge {
    if (filter.parentMaxAge == null) {
      return parentMaxAgeConst.toDouble();
    }
    return filter.parentMaxAge!.toDouble();
  }

  @computed
  SelectChildGender? get childrenGender {
    return filter.childrenGender;
  }

  @computed
  double get childrenMinAge {
    if (filter.childrenMinAge == null) {
      return childMinAgeConst.toDouble();
    }
    return filter.childrenMinAge!.toDouble();
  }

  @computed
  double get childrenMaxAge {
    if (filter.childrenMaxAge == null) {
      return childMaxAgeConst.toDouble();
    }
    return filter.childrenMaxAge!.toDouble();
  }

  @action
  void initFilter(String uid) {
    filter = Filter(
        parentGender: SelectParentGender.any,
        parentMinAge: parentMinAgeConst,
        parentMaxAge: parentMaxAgeConst,
        childrenGender: SelectChildGender.any,
        childrenMinAge: childMinAgeConst,
        childrenMaxAge: childMaxAgeConst,
        distance: maxDistanceConst);
    updateFilter(uid, () {}, (error) {});
  }

  @action
  void setFilter(
      {SelectParentGender? parentGender,
      int? parentMinAge,
      int? parentMaxAge,
      SelectChildGender? childrenGender,
      int? childrenMinAge,
      int? childrenMaxAge,
      int? distance}) {
    filter = Filter(
        parentGender: parentGender ?? filter.parentGender,
        parentMinAge: parentMinAge ?? filter.parentMinAge,
        parentMaxAge: parentMaxAge ?? filter.parentMaxAge,
        childrenGender: childrenGender ?? filter.childrenGender,
        childrenMinAge: childrenMinAge ?? filter.childrenMinAge,
        childrenMaxAge: childrenMaxAge ?? filter.childrenMaxAge,
        distance: distance ?? filter.distance);
  }

  @action
  Future<void> updateFilter(String uid, void Function() onSuccess,
      void Function(String) onError) async {
    try {
      await FirebaseDatabase.instance
          .ref('users/$uid/filter')
          .set(filter.toJson());
      onSuccess();
    } catch (e) {
      print(e);
      onError('Nem sikerült frissíteni a filterek beállításait');
      getFilter(uid);
    }
  }

  @action
  Future<void> getFilter(String uid) async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref('users/$uid/filter').get();
    Map<String, dynamic> mappedValue =
        Map<String, dynamic>.from(snapshot.value as Map);
    filter = Filter.fromJson(mappedValue);
  }
}
