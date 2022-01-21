import 'package:hireme/widgets/recruiter-drawer.dart';
import 'package:hireme/widgets/tiny-card-horizontal.dart';
import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/widgets/navbar.dart';

class RecruiterNotifications extends StatefulWidget {
  @override
  _RecruiterNotificationsState createState() => _RecruiterNotificationsState();
}

class _RecruiterNotificationsState extends State<RecruiterNotifications> {
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
        appBar: Navbar(title: "Notifications", searchBar: true),
        backgroundColor: AllColors.bgColorScreen,
        drawer: RecruiterDrawer(currentPage: "RecruiterNotifications"),
        body: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
          ),
        ));
  }
}
