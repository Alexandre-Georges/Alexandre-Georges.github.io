library my_builder_model_builder;

import '../converter/import.dart';
import '../model/import.dart';

ReferenceUnit METER = new ReferenceUnit('Meters');
RegularUnit KILOMETER = new RegularUnit('Kilometers', IDENTITY_POWER(3), IDENTITY_POWER(-3), METER);
RegularUnit MILE = new RegularUnit('Miles', MILES_TO_METERS, METERS_TO_MILES, METER);
RegularUnit YARD = new RegularUnit('Yards', YARDS_TO_METERS, METERS_TO_YARDS, METER);

Model DISTANCE = new Model('Distance', METER)
  ..addUnit(KILOMETER)
  ..addUnit(MILE)
  ..addUnit(YARD);


ReferenceUnit CELSIUS = new ReferenceUnit('Celsius');
RegularUnit FAHRENHEIT = new RegularUnit('Fahrenheit', FAHRENHEITS_TO_CELSIUS, CELSIUS_TO_FAHRENHEITS, CELSIUS);

Model TEMPERATURE = new Model('Temperature', CELSIUS)
  ..addUnit(FAHRENHEIT);


ReferenceUnit KILOGRAM = new ReferenceUnit('Kilograms');
RegularUnit POUND = new RegularUnit('Pounds', POUNDS_TO_KILOGRAMS, KILOGRAMS_TO_POUNDS, KILOGRAM);

Model WEIGHT = new Model('Weight', KILOGRAM)
  ..addUnit(POUND);