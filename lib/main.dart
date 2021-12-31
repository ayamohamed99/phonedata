import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emaxapp/WebScreen/formview.dart';
import 'package:emaxapp/utilities/providers.dart';
import 'package:emaxapp/utilities/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp()); // run app
} // void main

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    return MultiProvider(
      providers: providers,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: FormView.route,
      ),
    );
  }
}
