import 'package:emaxapp/utilities/text_style.dart';
import 'package:flutter/material.dart';

class ShowFormData extends StatelessWidget {
  final String title, info;

  const ShowFormData({Key key, this.title, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Textfiled.display5(context),
        ),
        Text(
          info,
          style: Textfiled.display5(context),
        ),
      ],
    );
  }
}

