// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterStore on _FilterStore, Store {
  Computed<SelectParentGender?>? _$parentGenderComputed;

  @override
  SelectParentGender? get parentGender => (_$parentGenderComputed ??=
          Computed<SelectParentGender?>(() => super.parentGender,
              name: '_FilterStore.parentGender'))
      .value;
  Computed<double>? _$parentMinAgeComputed;

  @override
  double get parentMinAge =>
      (_$parentMinAgeComputed ??= Computed<double>(() => super.parentMinAge,
              name: '_FilterStore.parentMinAge'))
          .value;
  Computed<double>? _$parentMaxAgeComputed;

  @override
  double get parentMaxAge =>
      (_$parentMaxAgeComputed ??= Computed<double>(() => super.parentMaxAge,
              name: '_FilterStore.parentMaxAge'))
          .value;
  Computed<SelectChildGender?>? _$childrenGenderComputed;

  @override
  SelectChildGender? get childrenGender => (_$childrenGenderComputed ??=
          Computed<SelectChildGender?>(() => super.childrenGender,
              name: '_FilterStore.childrenGender'))
      .value;
  Computed<double>? _$childrenMinAgeComputed;

  @override
  double get childrenMinAge =>
      (_$childrenMinAgeComputed ??= Computed<double>(() => super.childrenMinAge,
              name: '_FilterStore.childrenMinAge'))
          .value;
  Computed<double>? _$childrenMaxAgeComputed;

  @override
  double get childrenMaxAge =>
      (_$childrenMaxAgeComputed ??= Computed<double>(() => super.childrenMaxAge,
              name: '_FilterStore.childrenMaxAge'))
          .value;

  final _$filterAtom = Atom(name: '_FilterStore.filter');

  @override
  Filter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(Filter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$updateFilterAsyncAction = AsyncAction('_FilterStore.updateFilter');

  @override
  Future<void> updateFilter(
      String uid, void Function() onSuccess, void Function(String) onError) {
    return _$updateFilterAsyncAction
        .run(() => super.updateFilter(uid, onSuccess, onError));
  }

  final _$getFilterAsyncAction = AsyncAction('_FilterStore.getFilter');

  @override
  Future<void> getFilter(String uid) {
    return _$getFilterAsyncAction.run(() => super.getFilter(uid));
  }

  final _$_FilterStoreActionController = ActionController(name: '_FilterStore');

  @override
  void initFilter(String uid) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.initFilter');
    try {
      return super.initFilter(uid);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilter(
      {SelectParentGender? parentGender,
      int? parentMinAge,
      int? parentMaxAge,
      SelectChildGender? childrenGender,
      int? childrenMinAge,
      int? childrenMaxAge,
      int? distance}) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setFilter');
    try {
      return super.setFilter(
          parentGender: parentGender,
          parentMinAge: parentMinAge,
          parentMaxAge: parentMaxAge,
          childrenGender: childrenGender,
          childrenMinAge: childrenMinAge,
          childrenMaxAge: childrenMaxAge,
          distance: distance);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filter: ${filter},
parentGender: ${parentGender},
parentMinAge: ${parentMinAge},
parentMaxAge: ${parentMaxAge},
childrenGender: ${childrenGender},
childrenMinAge: ${childrenMinAge},
childrenMaxAge: ${childrenMaxAge}
    ''';
  }
}
