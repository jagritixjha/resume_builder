// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:resume_builder/common_widgets/text_widget.dart';

class TabWidget extends StatelessWidget {
  static int index = 0;
  int funIndex;
  String title;
  void Function() onTapp;
  TabWidget({
    super.key,
    required this.funIndex,
    required this.title,
    required this.onTapp,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTapp,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: index == funIndex
                  ? BorderSide(color: Colors.lime.shade600, width: 3)
                  : BorderSide.none,
            ),
          ),
          child: TextWidget(
            title: title,
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
