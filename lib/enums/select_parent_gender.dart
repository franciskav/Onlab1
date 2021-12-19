import 'package:flutter/foundation.dart';

enum SelectParentGender {
  man,
  woman,
  any,
}

extension SelectedGenderExtension on SelectParentGender {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case SelectParentGender.man:
        return 'Férfi';
      case SelectParentGender.woman:
        return 'Nő';
      case SelectParentGender.any:
        return 'Mindegy';
    }
  }
}