library my_polymer_my_model_element;

import 'package:polymer/polymer.dart';

import '../model/import.dart';
import '../observers/import.dart';

import 'main_element.dart';

@CustomTag('my-model')
class MyModelElement extends MainElement with ChangeNotifier  {

  @reflectable @published
  Model get model => __$model; Model __$model = null; @reflectable set model(Model value) { __$model = notifyPropertyChange(#model, __$model, value); }
  @reflectable @published
  String get color => __$color; String __$color = null; @reflectable set color(String value) { __$color = notifyPropertyChange(#color, __$color, value); }

  List<Unit> unitToIgnore = [];

  MyModelElement.created() : super.created();

  void attached() {

    ListObjectObserver<double> observer = new ListObjectObserver<double>(this.model.units, 'value');
    observer.changes.listen(this.updateUnit);

    ObjectObserver<double> referenceObserver = new ObjectObserver<double>(this.model.referenceUnit, 'value');
    referenceObserver.changes.listen(this.updateUnit);
  }

  void updateUnit(List<ObjectChangeRecord> changeRecords) {
    if (this.unitToIgnore.length > 0) {
      changeRecords.forEach((ObjectChangeRecord objectChangeRecord) {
        unitToIgnore.remove(objectChangeRecord.object);
      });
    } else {
      Unit currentUnit = changeRecords.last.object as Unit;

      this.unitToIgnore.add(this.model.referenceUnit);
      this.unitToIgnore.addAll(this.model.units);
      this.unitToIgnore.remove(currentUnit);

      this.model.updateUnitValues(currentUnit);
    }
  }
}