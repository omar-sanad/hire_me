import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/widgets/card-horizontal.dart';
import 'package:hireme/widgets/navbar.dart';
import 'package:hireme/widgets/candidate-drawer.dart';

class GenerateResume extends StatefulWidget {
  @override
  _GenerateResumeState createState() => _GenerateResumeState();
}

class _GenerateResumeState extends State<GenerateResume> {
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
        appBar: Navbar(title: "Generate Resume", searchBar: true),
        backgroundColor: AllColors.bgColorScreen,
        drawer: CandidateDrawer(currentPage: "GenerateResume"),
        body: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 12.0)
              ],
            ),
          ),
        ));
  }
}
