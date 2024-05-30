import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quick_foodie/admin/add_food.dart';
import 'package:quick_foodie/admin/admin_login.dart';
import 'package:quick_foodie/admin/home_admin.dart';
import 'package:quick_foodie/pages/bottomnav.dart';
import 'package:quick_foodie/pages/details.dart';
import 'package:quick_foodie/pages/home.dart';
import 'package:quick_foodie/pages/login.dart';
import 'package:quick_foodie/pages/onboard.dart';
import 'package:quick_foodie/pages/order.dart';
import 'package:quick_foodie/pages/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDdNzM7dYNIm5My7VPIi4ejUj9VX0VOQr8",
      appId: "1:864861662029:android:a27e9a0cd19416ae67a504",
      messagingSenderId: "864861662029",
      projectId: "quickfoodie-3a18c",
      storageBucket: "gs://quickfoodie-3a18c.appspot.com",
    ),
  )
     : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AdminLogin());
  }
}

