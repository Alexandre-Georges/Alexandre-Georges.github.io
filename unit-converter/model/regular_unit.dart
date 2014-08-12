library my_model_regular_unit;

import 'unit.dart';

class RegularUnit extends Unit {

  RegularUnit(String name, Function unitToReference, Function referenceToUnit, Unit referenceUnit) : super(name, unitToReference, referenceToUnit) {
    this.setValueFromReference(referenceUnit.value);
  }

  String toString() {
    return 'RegularUnit with name: ' + this.name;
  }
}