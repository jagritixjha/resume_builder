// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:resume_builder/common_widgets/text_widget.dart';
import 'package:resume_builder/utils/global_variables.dart';

class CustomAppBar
    extends AppBar {
  String?
      titleText;
  bool?
      isPop;
  PreferredSizeWidget?
      customWidget;

  CustomAppBar(
      {super.key});

  static appBar({
    required BuildContext
        context,
    required titleText,
    required isPop,
    required customWidget,
  }) {
    return AppBar(
      title: TextWidget(
        title: titleText,
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
      backgroundColor: primaryColor,
      automaticallyImplyLeading: isPop,
      leading: isPop == true
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              color: Colors.white,
            )
          : null,
      bottom: customWidget,
    );
  }
}
