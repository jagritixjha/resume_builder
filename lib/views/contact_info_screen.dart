import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart%20';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_builder/common_widgets/app_bar.dart';
import 'package:resume_builder/common_widgets/tab_widget.dart';
import 'package:resume_builder/common_widgets/text_field_widget.dart';
import 'package:resume_builder/common_widgets/text_widget.dart';
import 'package:resume_builder/utils/global_variables.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  Future<void> _pickImage() async {
    final ImageSource? source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(top: 16, left: 16),
                leading: const Icon(Icons.photo_library_outlined),
                title: TextWidget(
                  fontSize: 16,
                  title: 'Gallery',
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                onTap: () => Navigator.of(context).pop(ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.camera_outlined),
                title: TextWidget(
                  fontSize: 16,
                  title: 'Camera',
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                onTap: () => Navigator.of(context).pop(ImageSource.camera),
              )
            ],
          ),
        );
      },
    );

    if (source != null) {
      ImagePicker? image = ImagePicker();
      XFile? file = await image.pickImage(source: source);
      if (file != null) {
        GlobalVars.globals.image = File(file.path);
        setState(() {});
      }
    }
  }

  pdfCreation() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('Hello my self ${GlobalVars.globals.name}.'),
          );
        },
        pageFormat: PdfPageFormat.a4,
      ),
    );
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/resume.pdf');
    await file.writeAsBytes(await pdf.save());
    log(directory.path);
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
        child: IndexedStack(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFieldWidget(
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
                            TextFieldWidget(
                              icon: Icons.phone,
                              hint: 'Enter your phone number',
                              labelText: 'Phone',
                              validatorVariable: GlobalVars.globals.phone,
                              validatorFunc: (val) {
                                return val!.isEmpty
                                    ? 'enter phone number'
                                    : null;
                              },
                              saveData: (val) {
                                GlobalVars.globals.phone = val;
                              },
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
                            TextFieldWidget(
                              hint: 'Enter your address',
                              labelText: 'Address 2',
                              validatorVariable:
                                  GlobalVars.globals.addressThree,
                              validatorFunc: (val) {
                                return val!.isEmpty ? 'enter address' : null;
                              },
                              saveData: (val) {
                                GlobalVars.globals.addressThree = val;
                              },
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  GlobalVars.globals.reset();
                                  _formKey.currentState!.reset();
                                },
                                child: TextWidget(
                                  title: 'Reset',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    bool validation = _formKey.currentState!.validate();
                    if (validation) {
                      _formKey.currentState!.save();
                      TabWidget.index = 1;
                      setState(() {});
                    }
                    Fluttertoast.showToast(
                      msg: validation
                          ? 'Form saved'
                          : 'Please enter the required field.',
                      toastLength: Toast.LENGTH_LONG,
                      backgroundColor: Colors.red,
                      fontSize: 20,
                    );
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text(
                    //       validation ? 'Form saved' : 'Please enter the required field.',
                    //     ),
                    //   ),
                    // );
                    // print(GlobalVars.globals.name);
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
            Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                  child: Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey.shade300,
                          foregroundImage: GlobalVars.globals.image != null
                              ? FileImage(
                                  GlobalVars.globals.image!,
                                )
                              : null,
                          child: TextWidget(
                            title: 'Add',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: primaryColor,
                            child: IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: _pickImage,

                              /* () async {
                                ImagePicker image = ImagePicker();
                                XFile? file = await image.pickImage(source: ImageSource.gallery,);
                                if (file != null) {
                                  GlobalVars.globals.image = File(file.path);
                                  setState(() {});
                                } 
                              },*/
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    bool validation =
                        GlobalVars.globals.image == null ? false : true;
                    if (validation) {
                      _formKey.currentState!.save();
                      setState(() {});
                    }
                    Fluttertoast.showToast(
                      msg: validation
                          ? 'Form saved'
                          : 'Please upload a profile pic',
                      toastLength: Toast.LENGTH_LONG,
                      backgroundColor: Colors.red,
                      fontSize: 20,
                    );
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text(
                    //       validation ? 'Form saved' : 'Please enter the required field.',
                    //     ),
                    //   ),
                    // );
                    // print(GlobalVars.globals.name);
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
                    title: 'Submit',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    pdfCreation();
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
                    title: 'Download pdf',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
