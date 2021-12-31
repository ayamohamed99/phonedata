import 'package:emaxapp/WebScreen/formview.dart';
import 'package:emaxapp/WebScreen/listview_screen.dart';
import 'package:emaxapp/WebScreen/viewdata.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  // ListViewScreen.route: (context) => const ListViewScreen(),
  ViewData.route: (context) => ViewData(),
  FormView.route: (context) => FormView(),
  HistoryScreen.route: (context) => HistoryScreen(),
};
