import 'package:flutter/material.dart';
import 'package:resume_builder/common_widgets/text_widget.dart';

import '../utils/global_variables.dart';

class TextFieldWidget
    extends StatelessWidget {
  IconData?
      icon;
  String?
      hint,
      labelText,
      validatorVariable;
  String? Function(String?)?
      validatorFunc;
  void Function(String?)?
      saveData;

  TextFieldWidget({
    super.key,
    this.icon,
    required this.hint,
    required this.labelText,
    required this.validatorVariable,
    required this.validatorFunc,
    required this.saveData,
  });

  @override
  Widget build(
      BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            icon,
            color: Colors.black54,
            size: 34,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: TextFormField(
              onSaved: saveData,
              validator: validatorFunc,
              initialValue: validatorVariable,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1.4),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.4),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.4),
                ),
                // errorText: 'required field',
                hintText: hint,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                  fontWeight: FontWeight.normal,
                ),
                label: TextWidget(
                  fontSize: 18,
                  title: labelText!,
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                ),
                contentPadding: const EdgeInsets.only(bottom: 6),
              ),
            ),
          )
        ],
      ),
    );
  }
}
