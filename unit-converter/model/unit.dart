library my_model_unit;

import 'package:observe/observe.dart';

class Unit extends Object with ChangeNotifier {

  @reflectable @observable
  double get value => __$value; double __$value = null; @reflectable set value(double value) { __$value = notifyPropertyChange(#value, __$value, value); }

  String name = null;
  Function unitToReference = null;
  Function referenceToUnit = null;
  
  Unit(this.name, this.unitToReference, this.referenceToUnit);

  double getUnitToReference() {
    return this.unitToReference(this.value);
  }
  
  double setValueFromReference(double referenceValue) {
    this.value = this.referenceToUnit(referenceValue);
  }

  String toString() {
    return 'Unit with name: ' + this.name;
  }

}