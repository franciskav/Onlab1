import 'package:flutter/foundation.dart';

enum SelectChildGender {
  boy,
  girl,
  any,
}

extension SelectedGenderExtension on SelectChildGender {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case SelectChildGender.boy:
        return 'Kisfiú';
      case SelectChildGender.girl:
        return 'Kislány';
      case SelectChildGender.any:
        return 'Mindegy';
    }
  }
}
