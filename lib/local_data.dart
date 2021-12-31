import 'package:flutter/material.dart';

TextEditingController phoneController = TextEditingController();
String error = 'Invalid number \n please try to enter \n country_prefix before your number';

List<String> titleEN = ["Daily", "Weekly", "Monthly"];
List<String> images = [
  'assets/image/d.jpg',
  'assets/image/w.jpg',
  'assets/image/m.jpg'
];
List<Color> color = [Colors.yellow[600], Colors.orange[500], Colors.red[500]];
List<Color> titleColor = [
  Colors.red[500],
  Colors.yellow[600],
  Colors.orange[500]
];
