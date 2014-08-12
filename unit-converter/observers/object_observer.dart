library my_observers_object_observer;

import 'dart:async';
import 'dart:collection' show UnmodifiableListView;
import 'dart:mirrors';

import 'package:observe/observe.dart';
import 'object_change_record.dart';

class ObjectObserver<V> {

  Observable _object;
  V _currentValue;
  Symbol _valueSymbol;

  StreamController _changes;
  List<ObjectChangeRecord> _records;

  ObjectObserver(this._object, propertyName) {
    _valueSymbol = new Symbol(propertyName);
  }

  V _getCurrentValue() {
    return reflect(this._object).getField(this._valueSymbol).reflectee;
  }

  void _setCurrentValue(V newValue) {
    this._currentValue = newValue;
  }

  /**
   * Called by observers
   */
  void observed() {
    this._setCurrentValue(this._getCurrentValue());
    this._object.changes.listen((List<ChangeRecord> records) {
      for (var record in records) {
        if ((record as PropertyChangeRecord).name == _valueSymbol) {
          _updateObservedValue();
          return;
        }
      }
    });
  }

  void unobserved() {
    _changes = null;
  }

  void _updateObservedValue() {
    V objectValue = this._getCurrentValue();
    if (this.hasObservers && this._currentValue != objectValue) {
      this.notifyChange(new ObjectChangeRecord(this._object, this._currentValue, objectValue));
    }
    this._setCurrentValue(objectValue);
  }

  Stream<List<ObjectChangeRecord>> get changes {
    if (_changes == null) {
      _changes = new StreamController.broadcast(sync: true, onListen: observed, onCancel: unobserved);
    }
    return _changes.stream;
  }

  bool deliverChanges() {
    var records = _records;
    _records = null;
    if (hasObservers && records != null) {
      _changes.add(new UnmodifiableListView<ObjectChangeRecord>(records));
      return true;
    }
    return false;
  }

  bool get hasObservers => _changes != null && _changes.hasListener;

  void notifyChange(ObjectChangeRecord record) {
    if (!hasObservers) return;

    if (_records == null) {
      _records = [];
      scheduleMicrotask(deliverChanges);
    }
    _records.add(record);
  }

}
