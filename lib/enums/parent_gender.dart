import 'package:flutter/foundation.dart';

enum ParentGender {
  man,
  woman,
}

extension SelectedGenderExtension on ParentGender {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case ParentGender.man:
        return 'Férfi';
      case ParentGender.woman:
        return 'Nő';
    }
  }
}