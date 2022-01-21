import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/widgets/list-item.dart';
import 'package:hireme/widgets/input.dart';
import 'package:hireme/widgets/navbar.dart';
import 'package:hireme/widgets/candidate-drawer.dart';
import 'package:hireme/widgets/part-title.dart';

class ManageEducation extends StatefulWidget {
  @override
  _ManageEducationState createState() => _ManageEducationState();
}

class _ManageEducationState extends State<ManageEducation> {
  bool switchValueOne;
  bool switchValueTwo;


  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(title: "Manage Education", searchBar: true),
      backgroundColor: AllColors.bgColorScreen,
      drawer: CandidateDrawer(currentPage: "Manage Education"),
      body: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            PartTitle(title: 'Add Education'),
            SizedBox(height: 6.0),
            Container(
                height: 240,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0, bottom: 0),
                        child: Input(
                            obscureText: false,
                            placeholder: "Please enter the title",
                            textColor: Color(0XFF1A9592),
                            prefixIcon: Icon(Icons.phone, size: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0, bottom: 0),
                        child: Input(
                            obscureText: false,
                            placeholder: "Please enter the description",
                            textColor: Color(0XFF1A9592),
                            prefixIcon: Icon(Icons.phone, size: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0, bottom: 0),
                        child: Input(
                            obscureText: false,
                            placeholder: "Please enter the start date",
                            textColor: Color(0XFF1A9592),
                            prefixIcon: Icon(Icons.phone, size: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0, bottom: 0),
                        child: Input(
                            obscureText: false,
                            placeholder: "Please enter the end date",
                            textColor: Color(0XFF1A9592),
                            prefixIcon: Icon(Icons.phone, size: 20)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0, bottom: 0),
                        child: Input(
                            obscureText: false,
                            placeholder: "Please enter the diploma",
                            textColor: Color(0XFF1A9592),
                            prefixIcon: Icon(Icons.phone, size: 20)),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 12.0),
            PartTitle(title: 'Educations List'),
            SizedBox(height: 6.0),
          ],
        ),
      ),
    );
  }
}
