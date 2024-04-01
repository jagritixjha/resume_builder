import 'dart:io';

import 'package:flutter/material.dart';

class GlobalVars {
  String?
      name = '',
      email = '',
      phone = '',
      addressOne = '',
      addressTwo = '',
      addressThree = '';

  File?
      image;

  GlobalVars._();

  static final GlobalVars
      globals =
      GlobalVars._();

  void
      reset() {
    name =
        email = phone = addressOne = addressTwo = addressThree = null;
  }
}

Color primaryColor = Colors
    .blue
    .shade800;
