import 'package:hireme/widgets/input.dart';
import 'package:hireme/widgets/recruiter-drawer.dart';
import 'package:hireme/widgets/text-area.dart';
import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/widgets/navbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostJob extends StatefulWidget {
  @override
  _PostJobState createState() => _PostJobState();
}

class _PostJobState extends State<PostJob> {
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
        appBar: Navbar(title: "Post a job", searchBar: true),
        backgroundColor: AllColors.bgColorScreen,
        drawer: RecruiterDrawer(currentPage: "PostJob"),
        body: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 12.0),
              ],
            ),
          ),
        ));
  }
}
