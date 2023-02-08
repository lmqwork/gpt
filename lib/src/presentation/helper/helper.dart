import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class Helper {
  static bool isDesktop(BuildContext context) {
    final isDesktop = ResponsiveWrapper.of(context).isLargerThan(TABLET);
    return isDesktop;
  }
}
