import 'package:flutter/material.dart';
import 'package:resume_builder/common_widgets/app_bar.dart';
import 'package:resume_builder/common_widgets/tab_widget.dart';
import 'package:resume_builder/common_widgets/text_field_widget.dart';
import 'package:resume_builder/common_widgets/text_widget.dart';
import 'package:resume_builder/utils/global_variables.dart';

class ResumeWorkspace extends StatefulWidget {
  const ResumeWorkspace({super.key});

  @override
  State<ResumeWorkspace> createState() => _ResumeWorkspaceState();
}

class _ResumeWorkspaceState extends State<ResumeWorkspace> {
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.appBar(
        context: context,
        titleText: 'Resume Workspace',
        isPop: true,
        customWidget: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
          child: Row(
            children: [
              TabWidget(
                title: 'Contact Info',
                funIndex: 0,
                onTapp: () {
                  setState(() {
                    TabWidget.index = 0;
                    print(TabWidget.index);
                  });
                },
              ),
              TabWidget(
                title: 'Profile Pic',
                funIndex: 1,
                onTapp: () {
                  setState(() {
                    TabWidget.index = 1;
                    print(TabWidget.index);
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IndexedStack(
              index: TabWidget.index,
              children: [
                Column(
                  children: [
                    Container(
                      height: 460,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: const Offset(0, 0),
                            blurRadius: 20,
                            spreadRadius: 10,
                          )
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: TextFieldWidget(
                              icon: Icons.person_outline_rounded,
                              hint: 'Enter your name',
                              labelText: 'Name',
                              validatorVariable: GlobalVars.globals.name,
                              validatorFunc: (val) {
                                return val!.isEmpty ? 'enter name' : null;
                              },
                              saveData: (val) {
                                GlobalVars.globals.name = val;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          TextFieldWidget(
                            icon: Icons.email_outlined,
                            hint: 'Enter your email',
                            labelText: 'Email',
                            validatorVariable: GlobalVars.globals.email,
                            validatorFunc: (val) {
                              return val!.isEmpty ? 'enter email' : null;
                            },
                            saveData: (val) {
                              GlobalVars.globals.email = val;
                            },
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          TextFieldWidget(
                            icon: Icons.phone,
                            hint: 'Enter your phone number',
                            labelText: 'Phone',
                            validatorVariable: GlobalVars.globals.phone,
                            validatorFunc: (val) {
                              return val!.isEmpty ? 'enter phone number' : null;
                            },
                            saveData: (val) {
                              GlobalVars.globals.phone = val;
                            },
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          TextFieldWidget(
                            icon: Icons.location_on_outlined,
                            hint: 'Enter your address',
                            labelText: 'Address',
                            validatorVariable: GlobalVars.globals.addressOne,
                            validatorFunc: (val) {
                              return val!.isEmpty ? 'enter address' : null;
                            },
                            saveData: (val) {
                              GlobalVars.globals.addressOne = val;
                            },
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          TextFieldWidget(
                            hint: 'Enter your address',
                            labelText: 'Address 1',
                            validatorVariable: GlobalVars.globals.addressTwo,
                            validatorFunc: (val) {
                              return val!.isEmpty ? 'enter address' : null;
                            },
                            saveData: (val) {
                              GlobalVars.globals.addressTwo = val;
                            },
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          TextFieldWidget(
                            hint: 'Enter your address',
                            labelText: 'Address 2',
                            validatorVariable: GlobalVars.globals.addressThree,
                            validatorFunc: (val) {
                              return val!.isEmpty ? 'enter address' : null;
                            },
                            saveData: (val) {
                              GlobalVars.globals.addressThree = val;
                            },
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        bool validation = _formKey.currentState!.validate();
                        if (validation) {
                          _formKey.currentState!.save();
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              validation
                                  ? 'Form saved'
                                  : 'Please enter the required field.',
                            ),
                          ),
                        );
                        print(GlobalVars.globals.name);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: primaryColor,
                        fixedSize: const Size(342, 50),
                        shadowColor: Colors.blue.shade50,
                        elevation: 6,
                      ),
                      child: TextWidget(
                        title: 'Next',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 500,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(0, 0),
                        blurRadius: 20,
                        spreadRadius: 10,
                      )
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text('hello'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}