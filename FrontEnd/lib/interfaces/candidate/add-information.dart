import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/widgets/card-horizontal.dart';
import 'package:hireme/widgets/navbar.dart';
import 'package:hireme/widgets/candidate-drawer.dart';

class AddInformation extends StatefulWidget {
  @override
  _AddInformationState createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
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
        appBar: Navbar(title: "Add Information", searchBar: true),
        backgroundColor: AllColors.bgColorScreen,
        drawer: CandidateDrawer(currentPage: "AddInformation"),
        body: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 12.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardHorizontal(
                        title: 'Manage Education',
                        img: 'assets/photos/photo1.png',
                        tap: () {
                          Navigator.pushNamed(context, '/manage-education');
                        }),
                    SizedBox(height: 6.0),
                    CardHorizontal(
                        title: 'Manage Experiences',
                        img: 'assets/photos/photo2.png',
                        tap: () {
                          Navigator.pushNamed(context, '/pro');
                        }),
                    SizedBox(height: 6.0),
                    CardHorizontal(
                        title: 'Manage Projects',
                        img: 'assets/photos/photo2.png',
                        tap: () {
                          Navigator.pushNamed(context, '/pro');
                        }),
                    SizedBox(height: 6.0),
                    CardHorizontal(
                        title: 'Manage Hobbies',
                        img: 'assets/photos/photo2.png',
                        tap: () {
                          Navigator.pushNamed(context, '/pro');
                        }),
                    SizedBox(height: 6.0),
                    CardHorizontal(
                        title: 'Manage Volunteering',
                        img: 'assets/photos/photo2.png',
                        tap: () {
                          Navigator.pushNamed(context, '/pro');
                        }),
                    SizedBox(height: 6.0),
                    CardHorizontal(
                        title: 'Manage Awards',
                        img: 'assets/photos/photo2.png',
                        tap: () {
                          Navigator.pushNamed(context, '/pro');
                        }),
                    SizedBox(height: 6.0),
                    CardHorizontal(
                        title: 'Manage Certificates',
                        img: 'assets/photos/photo2.png',
                        tap: () {
                          Navigator.pushNamed(context, '/pro');
                        })
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
