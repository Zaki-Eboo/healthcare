import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:medical/Screens/Login-Signup/login.dart';
import 'package:medical/Screens/Views/Homepage.dart';
import 'package:medical/Screens/Views/Screen1.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Medics());
}

class Medics extends StatefulWidget {
  Medics({super.key});

  @override
  State<Medics> createState() => _MedicsState();
}

class _MedicsState extends State<Medics> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            FirebaseAuth.instance.currentUser == null ? Screen1() : Homepage(),

        routes: {
          // '/': (context) => Screen1(),
          '/s1': (context) => login(),
          '/home': (context) => Homepage(),
        },
        // getPages: [
        //   GetPage(name: "/", page:()=> Screen1()),
        //   GetPage(name: "/s1", page:()=> login()),

        // ],
      );
    });
  }
}
