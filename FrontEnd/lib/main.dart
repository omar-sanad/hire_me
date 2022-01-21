import 'package:hireme/interfaces/candidate/add-information.dart';
import 'package:hireme/interfaces/candidate/candidate-profile.dart';
import 'package:hireme/interfaces/common-login.dart';
import 'package:hireme/interfaces/candidate/manage-education.dart';
import 'package:flutter/material.dart';
import 'package:hireme/interfaces/splash-screen.dart';
import 'package:hireme/interfaces/candidate/candidate-dashboard.dart';
import 'package:hireme/interfaces/candidate/candidate-register.dart';
import 'interfaces/candidate/candidate-notifications.dart';
import 'interfaces/candidate/job-opportunities.dart';
import 'interfaces/recruiter/company-information.dart';
import 'interfaces/candidate/generate-resume.dart';
import 'interfaces/candidate/candidate-connections.dart';
import 'interfaces/recruiter/post-job.dart';
import 'interfaces/recruiter/recruiter-connections.dart';
import 'interfaces/recruiter/recruiter-dashboard.dart';
import 'interfaces/recruiter/recruiter-notifications.dart';
import 'interfaces/recruiter/recruiter-profile.dart';
import 'interfaces/recruiter/recruiter-register.dart';
import 'interfaces/recruiter/search-candidates.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hire Me',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Fredoka'),
        initialRoute: '/splash-screen',
        routes: <String, WidgetBuilder>{
          "/splash-screen": (BuildContext context) => new SplashScreen(),
          "/common-login": (BuildContext context) => new CommonLogin(),

          '/candidate-dashboard': (BuildContext context) => new CandidateDashboard(),
          "/candidate-profile": (BuildContext context) => new CandidateProfile(),
          "/generate-resume": (BuildContext context) => new GenerateResume(),
          "/candidate-register": (BuildContext context) => new CandidateRegister(),
          "/add-information": (BuildContext context) => new AddInformation(),
          "/manage-education": (BuildContext context) => new ManageEducation(),
          "/candidate-notifications": (BuildContext context) => new CandidateNotifications(),
          "/job-opportunities": (BuildContext context) => new JobOpportunities(),
          "/candidate-connections": (BuildContext context) => new CandidateConnections(),

          "/recruiter-register": (BuildContext context) => new RecruiterRegister(),
          "/recruiter-dashboard": (BuildContext context) => new RecruiterDashboard(),
          "/company-information": (BuildContext context) => new CompanyInformation(),
          "/search-candidates": (BuildContext context) => new SearchCandidates(),
          "/post-job": (BuildContext context) => new PostJob(),
          "/recruiter-connections": (BuildContext context) => new RecruiterConnections(),
          "/recruiter-notifications": (BuildContext context) => new RecruiterNotifications(),
          "/recruiter-profile": (BuildContext context) => new RecruiterProfile(),
        });
  }
}
