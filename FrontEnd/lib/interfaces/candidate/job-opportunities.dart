import 'package:hireme/widgets/tiny-card-horizontal.dart';
import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/widgets/navbar.dart';
import 'package:hireme/widgets/candidate-drawer.dart';

class JobOpportunities extends StatefulWidget {
  @override
  _JobOpportunitiesState createState() => _JobOpportunitiesState();
}

class _JobOpportunitiesState extends State<JobOpportunities> {
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
        appBar: Navbar(title: "Job Opportunities", searchBar: true),
        backgroundColor: AllColors.bgColorScreen,
        drawer: CandidateDrawer(currentPage: "JobOpportunities"),
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
