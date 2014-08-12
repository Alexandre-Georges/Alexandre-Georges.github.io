library my_polymer_main_element;

import 'package:polymer/polymer.dart';
import 'package:template_binding/template_binding.dart';

import 'my_polymer_expressions.dart';

class MainElement extends PolymerElement {

  MainElement.created() : super.created();

  @override
  BindingDelegate syntax = MyPolymerExpressions.INSTANCE;

}
