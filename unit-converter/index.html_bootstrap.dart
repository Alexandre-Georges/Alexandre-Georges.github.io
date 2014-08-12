library app_bootstrap;

import 'package:polymer/polymer.dart';

import 'polymer/my_unit_element.dart' as i0;
import 'polymer/my_model_element.dart' as i1;
import 'polymer/my_converter_element.dart' as i2;
import 'index.html.0.dart' as i3;
import 'package:smoke/smoke.dart' show Declaration, PROPERTY, METHOD;
import 'package:smoke/static.dart' show useGeneratedCode, StaticConfiguration;
import 'polymer/my_unit_element.dart' as smoke_0;
import 'polymer/main_element.dart' as smoke_1;
import 'package:polymer/polymer.dart' as smoke_2;
import 'package:observe/src/metadata.dart' as smoke_3;
import 'model/unit.dart' as smoke_4;
import 'polymer/my_model_element.dart' as smoke_5;
import 'model/model.dart' as smoke_6;
import 'polymer/my_converter_element.dart' as smoke_7;
abstract class _M0 {} // MainElement & ChangeNotifier

void main() {
  useGeneratedCode(new StaticConfiguration(
      checkedMode: false,
      getters: {
        #color: (o) => o.color,
        #enumerate: (o) => o.enumerate,
        #getColor: (o) => o.getColor,
        #index: (o) => o.index,
        #model: (o) => o.model,
        #models: (o) => o.models,
        #name: (o) => o.name,
        #onMyChange: (o) => o.onMyChange,
        #referenceUnit: (o) => o.referenceUnit,
        #unit: (o) => o.unit,
        #units: (o) => o.units,
        #value: (o) => o.value,
      },
      setters: {
        #color: (o, v) { o.color = v; },
        #model: (o, v) { o.model = v; },
        #models: (o, v) { o.models = v; },
        #referenceUnit: (o, v) { o.referenceUnit = v; },
        #unit: (o, v) { o.unit = v; },
        #value: (o, v) { o.value = v; },
      },
      parents: {
        smoke_1.MainElement: smoke_2.PolymerElement,
        smoke_7.MyConverterElement: _M0,
        smoke_5.MyModelElement: _M0,
        smoke_0.MyUnitElement: _M0,
        _M0: smoke_1.MainElement,
      },
      declarations: {
        smoke_7.MyConverterElement: {
          #models: const Declaration(#models, List, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_3.observable]),
        },
        smoke_5.MyModelElement: {
          #color: const Declaration(#color, String, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_2.published]),
          #model: const Declaration(#model, smoke_6.Model, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_2.published]),
        },
        smoke_0.MyUnitElement: {
          #unit: const Declaration(#unit, smoke_4.Unit, kind: PROPERTY, annotations: const [smoke_3.reflectable, smoke_2.published]),
        },
      },
      names: {
        #color: r'color',
        #enumerate: r'enumerate',
        #getColor: r'getColor',
        #index: r'index',
        #model: r'model',
        #models: r'models',
        #name: r'name',
        #onMyChange: r'onMyChange',
        #referenceUnit: r'referenceUnit',
        #unit: r'unit',
        #units: r'units',
        #value: r'value',
      }));
  configureForDeployment([
      () => Polymer.register('my-unit', i0.MyUnitElement),
      () => Polymer.register('my-model', i1.MyModelElement),
      () => Polymer.register('my-converter', i2.MyConverterElement),
    ]);
  i3.main();
}
