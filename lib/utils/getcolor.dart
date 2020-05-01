import 'package:flutter/material.dart';

Color getColor(number) {
  if (number > 0 && number < 11) return Colors.red;
  if (number > 10 && number < 21) return Colors.orange;
  if (number > 20 && number < 31) return Colors.yellow;
  if (number > 30 && number < 41) return Colors.green;
  if (number > 40 && number < 46) return Colors.blue;
}