import 'package:emaxapp/WebScreen/formview.dart';
import 'package:emaxapp/utilities/providers.dart';
import 'package:emaxapp/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp()); // run app
} // void main

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
