library my_observers_object_change_record;

class ObjectChangeRecord<O, V> {

  final O object;
  final V oldValue;
  final V newValue;

  ObjectChangeRecord(this.object, this.oldValue, this.newValue);

  String toString() => '#<ObjectChangeRecord $object from: $oldValue to: $newValue>';
}