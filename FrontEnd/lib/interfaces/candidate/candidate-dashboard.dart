import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/widgets/navbar.dart';
import 'package:hireme/widgets/card-small.dart';
import 'package:hireme/widgets/candidate-drawer.dart';

class CandidateDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(title: "Candidate Dashboard", searchBar: true),
        backgroundColor: AllColors.bgColorScreen,
        drawer: CandidateDrawer(currentPage: "CandidateDashboard"),
        body: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardSmall(
                        title: 'Add Information',
                        img: 'assets/photos/photo1.png',
                        tap: () {
                          Navigator.pushNamed(context, '/add-information');
                        }),
                    CardSmall(
                        title: 'Generate Resume',
                        img: 'assets/photos/photo2.png',
                        tap: () {
                          Navigator.pushNamed(context, '/generate-resume');
                        })
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardSmall(
                        title: 'Job Opportunities',
                        img: 'assets/photos/photo3.png',
                        tap: () {
                          Navigator.pushNamed(context, '/job-opportunities');
                        }),
                    CardSmall(
                        title: 'My Connections',
                        img: 'assets/photos/photo4.png',
                        tap: () {
                          Navigator.pushNamed(context, '/my-connections');
                        })
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardSmall(
                        title: 'Notifications',
                        img: 'assets/photos/photo5.png',
                        tap: () {
                          Navigator.pushNamed(
                              context, '/candidate-notifications');
                        }),
                    CardSmall(
                        title: 'My Profile',
                        img: 'assets/photos/photo6.png',
                        tap: () {
                          Navigator.pushNamed(context, '/candidate-profile');
                        })
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
