import 'package:flutter/material.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/widgets/candidate-drawer.dart';
import 'package:hireme/widgets/navbar.dart';
import 'package:hireme/widgets/card-small.dart';

class RecruiterDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(title: "Recruiter Dashboard", searchBar: true),
        backgroundColor: AllColors.bgColorScreen,
        drawer: CandidateDrawer(currentPage: "RecruiterDashboard"),
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
                        title: 'Company Information',
                        img: 'assets/photos/photo1.png',
                        tap: () {
                          Navigator.pushNamed(context, '/company-information');
                        }),
                    CardSmall(
                        title: 'Search for candidates',
                        img: 'assets/photos/photo2.png',
                        tap: () {
                          Navigator.pushNamed(context, '/search-candidates');
                        })
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardSmall(
                        title: 'Post Job',
                        img: 'assets/photos/photo3.png',
                        tap: () {
                          Navigator.pushNamed(context, '/post-job');
                        }),
                    CardSmall(
                        title: 'My Connections',
                        img: 'assets/photos/photo4.png',
                        tap: () {
                          Navigator.pushNamed(context, '/recruiter-connections');
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
                              context, '/recruiter-notifications');
                        }),
                    CardSmall(
                        title: 'My Profile',
                        img: 'assets/photos/photo6.png',
                        tap: () {
                          Navigator.pushNamed(context, '/recruiter-profile');
                        })
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
