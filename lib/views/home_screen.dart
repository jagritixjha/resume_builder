import 'package:flutter/material.dart';
import 'package:resume_builder/common_widgets/app_bar.dart';
import 'package:resume_builder/common_widgets/text_widget.dart';
import 'package:resume_builder/utils/global_variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(
        context: context,
        titleText: "Resume Builder",
        isPop: false,
        customWidget: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: SizedBox(
            height: 50,
            child: TextWidget(
              title: "RESUMES",
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/128/2989/2989545.png',
            ),
            TextWidget(
              title: 'No resumes + create new resume.',
              fontHeight: 4,
              fontSize: 18,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/buildOptionsScreen');
        },
        shape: const CircleBorder(),
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }
}
