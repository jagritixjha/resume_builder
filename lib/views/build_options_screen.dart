import 'package:flutter/material.dart';
import 'package:resume_builder/common_widgets/app_bar.dart';
import 'package:resume_builder/common_widgets/text_widget.dart';

class BuildOptionsScreen extends StatefulWidget {
  const BuildOptionsScreen({super.key});

  @override
  State<BuildOptionsScreen> createState() => _BuildOptionsScreenState();
}

class _BuildOptionsScreenState extends State<BuildOptionsScreen> {
  List<Map<String, dynamic>> buildOptions = [
    {
      'icon': Icons.quick_contacts_dialer_outlined,
      'title': 'Contact Information'
    },
    {
      'icon': Icons.cases_outlined,
      'title': 'Career Objectives',
    },
    {
      'icon': Icons.person_outline_rounded,
      'title': 'Personal Details',
    },
    {
      'icon': Icons.school_outlined,
      'title': 'Education',
    },
    {
      'icon': Icons.military_tech_outlined,
      'title': 'Technical Skills',
    },
    {
      'icon': Icons.work_history_outlined,
      'title': 'Experiences',
    },
    {
      'icon': Icons.interests_outlined,
      'title': 'Interests/Hobbies',
    },
    {
      'icon': Icons.assessment_outlined,
      'title': 'Projects',
    },
    {
      'icon': Icons.workspace_premium_outlined,
      'title': 'Achievements',
    },
    {
      'icon': Icons.people_outline,
      'title': 'References',
    },
    {
      'icon': Icons.data_object_rounded,
      'title': 'Declarations',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(
        context: context,
        titleText: 'Resume Builder',
        isPop: true,
        customWidget: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: SizedBox(
            height: 50,
            child: TextWidget(
              title: "Build Options",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: buildOptions.length,
          itemBuilder: (context, index) {
            final option = buildOptions[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/resumeWorkspace');
              },
              child: Container(
                height: 80,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    color: Colors.grey.shade200,
                    blurRadius: 8,
                  ),
                ]),
                child: Row(
                  children: [
                    Icon(
                      option['icon'],
                      size: 34,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextWidget(
                        title: option['title'],
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
