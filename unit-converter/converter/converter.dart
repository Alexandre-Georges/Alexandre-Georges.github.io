library my_converter_converter;

import 'dart:math';

const double METERS_IN_ONE_MILE = 1609.344;
const double METERS_IN_ONE_YARD = 1.09361;

const double DEGREES_BOILING_WATER_GAP = 32.0;
const double DEGREES_FACTOR_1 = 5.0;
const double DEGREES_FACTOR_2 = 9.0;

const double KILOGRAMS_IN_ONE_POUND = 0.453592;

double IDENTITY(value) => value;

Function IDENTITY_POWER(int power) {
  double closure (double value) {
    return value * pow(10, power);
  }
  return closure;
}

double MILES_TO_METERS(double value) => METERS_IN_ONE_MILE * value;
double METERS_TO_MILES(double value) => value / METERS_IN_ONE_MILE;

double YARDS_TO_METERS(double value) => METERS_IN_ONE_YARD * value;
double METERS_TO_YARDS(double value) => value / METERS_IN_ONE_YARD;

double FAHRENHEITS_TO_CELSIUS(double value) => (value - DEGREES_BOILING_WATER_GAP) * DEGREES_FACTOR_1 / DEGREES_FACTOR_2;
double CELSIUS_TO_FAHRENHEITS(double value) => value * DEGREES_FACTOR_2 / DEGREES_FACTOR_1 + DEGREES_BOILING_WATER_GAP;

double POUNDS_TO_KILOGRAMS(double value) => KILOGRAMS_IN_ONE_POUND * value;
double KILOGRAMS_TO_POUNDS(double value) => value / KILOGRAMS_IN_ONE_POUND;
