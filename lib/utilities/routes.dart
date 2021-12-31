import 'package:emaxapp/WebScreen/formview.dart';
import 'package:emaxapp/WebScreen/viewdata.dart';
import 'package:flutter/material.dart';

 

Map<String, WidgetBuilder> routes = {
  
  
  ViewData.route: (context) => const ViewData(),
  FormView.route: (context) => const FormView(),
};
