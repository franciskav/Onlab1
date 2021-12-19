import 'package:flutter/foundation.dart';

enum ChildGender {
  boy,
  girl,
}

extension SelectedGenderExtension on ChildGender {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case ChildGender.boy:
        return 'Kisfiú';
      case ChildGender.girl:
        return 'Kislány';
    }
  }
}