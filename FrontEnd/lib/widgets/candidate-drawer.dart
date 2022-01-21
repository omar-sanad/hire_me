import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hireme/constants/all-colors.dart';
import 'package:hireme/widgets/drawer-tile.dart';

class CandidateDrawer extends StatelessWidget {
  final String currentPage;

  CandidateDrawer({this.currentPage});

  Future<bool> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('role', '');
    return prefs.setBool('loggedIn', value);
  }

  Future<void> _showLogOutDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log out'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure that you want to log out ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                setLoggedIn(false);
                Navigator.pushReplacementNamed(context, '/common-login');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: AllColors.primary,
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.85,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Center(
                        child:Padding(
                            padding: EdgeInsets.only(
                                left: 2.0, right: 2.0, top: 2, bottom: 2),
                            child: Text('Hire Me',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20.0, color: AllColors.white,)))
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: IconButton(
                          icon: Icon(Icons.menu,
                              color: AllColors.white.withOpacity(0.82),
                              size: 24.0),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  ],
                ),
              ),
            )),
        Expanded(
          flex: 5,
          child: ListView(
            padding: EdgeInsets.only(top: 36, left: 8, right: 16),
            children: [
              DrawerTile(
                  icon: FontAwesomeIcons.home,
                  onTap: () {
                    if (currentPage != "CandidateDashboard")
                      Navigator.pushReplacementNamed(context, '/candidate-dashboard');
                  },
                  iconColor: AllColors.primary,
                  title: "Dashboard",
                  isSelected: currentPage == "CandidateDashboard" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.user,
                  onTap: () {
                    if (currentPage != "AddInformation")
                      Navigator.pushReplacementNamed(context, '/add-information');
                  },
                  iconColor: AllColors.primary,
                  title: "Add information",
                  isSelected: currentPage == "AddInformation" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.newspaper,
                  onTap: () {
                    if (currentPage != "GenerateResume")
                      Navigator.pushReplacementNamed(context, '/generate-resume');
                  },
                  iconColor: AllColors.primary,
                  title: "Generate Resume",
                  isSelected: currentPage == "GenerateResume" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.database,
                  onTap: () {
                    if (currentPage != "JobOpportunities")
                      Navigator.pushReplacementNamed(context, '/job-opportunities');
                  },
                  iconColor: AllColors.warning,
                  title: "Job Opportunities",
                  isSelected: currentPage == "JobOpportunities" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.calendar,
                  onTap: () {
                    if (currentPage != "MyConnections")
                      Navigator.pushReplacementNamed(context, '/my-connections');
                  },
                  iconColor: AllColors.info,
                  title: "My Connections",
                  isSelected: currentPage == "MyConnections" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.share,
                  onTap: () {
                    if (currentPage != "CandidateNotifications")
                      Navigator.pushReplacementNamed(context, '/candidate-notifications');
                  },
                  iconColor: AllColors.success,
                  title: "Notifications",
                  isSelected: currentPage == "CandidateNotifications" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.adversal,
                  onTap: () {
                    if (currentPage != "MyProfile")
                      Navigator.pushReplacementNamed(context, '/candidate-profile');
                  },
                  iconColor: AllColors.success,
                  title: "My Profile",
                  isSelected: currentPage == "MyProfile" ? true : false)
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
              padding: EdgeInsets.only(left: 8, right: 16),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                      height: 4,
                      thickness: 0,
                      color: AllColors.white.withOpacity(0.8)),
                  DrawerTile(
                      icon: FontAwesomeIcons.userLock,
                      onTap: (){
                       _showLogOutDialog(context);
                      },
                      iconColor: AllColors.muted,
                      title: "Log out",
                      isSelected: currentPage == "LogOut" ? true : false),
                ],
              )),
        ),
      ]),
    ));
  }
}
