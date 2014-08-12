library my_polymer_my_polymer_expressions;

import 'package:polymer_expressions/polymer_expressions.dart';

import '../transformers/import.dart';

class MyPolymerExpressions extends PolymerExpressions {

  static MyPolymerExpressions INSTANCE = new MyPolymerExpressions();

  static Map<String, Function> GLOBALS = {
      'roundTwoDigit': roundTwoDigit
  }..addAll(PolymerExpressions.DEFAULT_GLOBALS);

  MyPolymerExpressions(): super(globals: GLOBALS) {
    INSTANCE = this;
  }

  prepareBinding(String path, name, node) => super.prepareBinding(path, name, node);
}