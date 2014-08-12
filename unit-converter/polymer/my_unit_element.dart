library my_polymer_my_unit_element;

import 'dart:html';

import 'package:polymer/polymer.dart';

import '../transformers/import.dart';
import '../model/import.dart';

import 'main_element.dart';

@CustomTag('my-unit')
class MyUnitElement extends MainElement with ChangeNotifier  {

  @reflectable @published
  Unit get unit => __$unit; Unit __$unit = null; @reflectable set unit(Unit value) { __$unit = notifyPropertyChange(#unit, __$unit, value); }

  String displayValue = null;
  bool editing = false;

  /**
   * Getter and setter for the UI
   */
  String get value {
    return this.displayValue;
  }

  void set value(String value) {
    try {
      this.editing = true;
      this.unit.value = double.parse(value);
      this.displayValue = notifyPropertyChange(#value, displayValue, value);
    } on FormatException {}
  }

  MyUnitElement.created() : super.created();

  void attached() {

    this.displayValue = notifyPropertyChange(#value, this.displayValue, this.unit.value.toString());
    
    PathObserver observer = new PathObserver(this.unit, 'value');
    observer.open((_) {
      if (!this.editing) {
        this.displayValue = notifyPropertyChange(#value, this.displayValue, roundTwoDigit(this.unit.value));
      } else {
        this.editing = false;
      }
    });
  }

  void onMyChange(Event e, var detail, Node target) {
    this.editing = false;
    this.displayValue = notifyPropertyChange(#value, this.displayValue, roundTwoDigit(this.unit.value));
  }

}
