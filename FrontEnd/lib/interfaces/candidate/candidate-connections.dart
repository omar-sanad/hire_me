import 'package:hireme/widgets/tiny-card-horizontal.dart';
import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/widgets/navbar.dart';
import 'package:hireme/widgets/candidate-drawer.dart';

class CandidateConnections extends StatefulWidget {
  @override
  _CandidateConnectionsState createState() => _CandidateConnectionsState();
}

class _CandidateConnectionsState extends State<CandidateConnections> {
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
        appBar: Navbar(title: "My Connections", searchBar: true),
        backgroundColor: AllColors.bgColorScreen,
        drawer: CandidateDrawer(currentPage: "CandidateConnections"),
        body: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
          ),
        ));
  }
}
