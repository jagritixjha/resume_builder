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
      'title': 'Contact Information',
      'routeTo': '/contactInfoScreen'
    },
    {
      'icon': Icons.cases_outlined,
      'title': 'Career Objectives',
      'routeTo': '/careerObjectivesScreen'
    },
    {
      'icon': Icons.person_outline_rounded,
      'title': 'Personal Details',
      'routeTo': '/personalDetailsScreen'
    },
    {
      'icon': Icons.school_outlined,
      'title': 'Education',
      'routeTo': '/eductionScreen'
    },
    {
      'icon': Icons.work_history_outlined,
      'title': 'Experiences',
      'routeTo': '/ExperiencesScreen'
    },
    {
      'icon': Icons.military_tech_outlined,
      'title': 'Technical Skills',
      'routeTo': '/technicalSkillsScreen'
    },
    {
      'icon': Icons.interests_outlined,
      'title': 'Interests/Hobbies',
      'routeTo': '/InterestsHobbiesScreen'
    },
    {
      'icon': Icons.assessment_outlined,
      'title': 'Projects',
      'routeTo': '/ProjectsScreen'
    },
    {
      'icon': Icons.workspace_premium_outlined,
      'title': 'Achievements',
      'routeTo': '/AchievementsScreen'
    },
    {
      'icon': Icons.people_outline,
      'title': 'References',
      'routeTo': '/ReferencesScreen'
    },
    {
      'icon': Icons.data_object_rounded,
      'title': 'Declarations',
      'routeTo': '/DeclarationsScreen'
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: buildOptions.length,
              itemBuilder: (context, index) {
                final option = buildOptions[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, option['routeTo']);
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
        ],
      ),
    );
  }
}
