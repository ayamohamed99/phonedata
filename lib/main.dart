import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emaxapp/WebScreen/formview.dart';
import 'package:emaxapp/WebScreen/listview_screen.dart';
import 'package:emaxapp/utilities/providers.dart';
import 'package:emaxapp/utilities/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyBHRHGuRvuwf1SSDitqY7tyTLSJb7LcD",
      appId: "1:534677952686:web:a2a733a5d051feed15753f",
      messagingSenderId: "534677952686",
      projectId: "phonedata-f8bcc",
    ),
  );
  runApp(MyApp()); // run app
} // void main

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HistoryScreen(),
        routes: routes,
        initialRoute: FormView.route,
      ),
    );
  }
}
