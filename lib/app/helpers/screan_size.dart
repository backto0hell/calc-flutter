import 'package:flutter/material.dart';

bool isPhone(context) {
  var shortestSide = MediaQuery.of(context).size.shortestSide;

  final bool isPhone = shortestSide < 600;
  return isPhone;
}
