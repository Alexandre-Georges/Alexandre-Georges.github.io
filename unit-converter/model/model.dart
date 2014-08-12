library my_model_model;

import 'unit.dart';
import 'reference_unit.dart';
import 'regular_unit.dart';

class Model {

  String name;
  ReferenceUnit referenceUnit;
  List<RegularUnit> units;

  Model(this.name, this.referenceUnit) {
    units = [];
  }

  void addUnit(RegularUnit regularUnit) {
    this.units.add(regularUnit);
  }

  void updateUnitValues(Unit originUnit) {
    this.updateUnitValue(originUnit, this.referenceUnit);
    this.units.forEach((Unit unit) {
      this.updateUnitValue(originUnit, unit);
    });
  }

  void updateUnitValue(Unit originUnit, Unit destinationUnit) {
    if(originUnit != destinationUnit) {
      destinationUnit.setValueFromReference(originUnit.getUnitToReference());
    }
  }

}