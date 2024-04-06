import 'package:flutter/material.dart';
import 'package:resume_builder/common_widgets/app_bar.dart';
import 'package:resume_builder/common_widgets/text_widget.dart';
import 'package:resume_builder/utils/global_variables.dart';

class CarrierObjectives extends StatefulWidget {
  const CarrierObjectives({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarrierObjectives();
  }
}

class _CarrierObjectives extends State<CarrierObjectives> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(
        context: context,
        titleText: 'Carrier Objective',
        isPop: true,
        fontSizee: 18.0,
        customWidget: null,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomeContainer(
              CustomWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    title: 'Career Objective',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: TextWidget(
                        title: 'Description',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black26,
                      ),
                      hintText: 'Description your goal and career objectives.',
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black26,
                      ),
                      alignLabelWithHint: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                    ),
                    maxLines: 7,
                  ),
                ],
              ),
            ),
            CustomeContainer(
              CustomWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    title: 'Current Designation (Experienced Candidate)',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: TextWidget(
                        title: 'Software Engineer',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black26,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                    ),
                    // maxLines: 7,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomeContainer extends StatelessWidget {
  Widget CustomWidget;
  CustomeContainer({
    super.key,
    required this.CustomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(0, 0),
            blurRadius: 20,
            spreadRadius: 10,
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: CustomWidget,
    );
  }
}
