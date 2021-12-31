import 'package:flutter/material.dart';

class TitleStyle {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
          fontSize: 25,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        );
  }
}

class Maintext {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
          fontSize: 20,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        );
  }
}

class Textfiled {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
          fontSize: 12,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.normal,
          color: Colors.black,
        );
  }
}



class Bodytask {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
          fontSize: 20,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.normal,
          color: Colors.black,
           
        );
  }
}


class Textfiledhint {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
          fontSize: 12,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.normal,
          color: Color(0xffE7C475),
        );
  }
}

