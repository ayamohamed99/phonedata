import 'package:emaxapp/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatTextField extends StatefulWidget {
  final String label;
  final Function onnChanged , validator;
  final TextEditingController controller;

  @override
  CreatTextField({
    Key key,
    this.label,
    this.onnChanged,
    this.controller, this.validator,
  });

  @override
  State<CreatTextField> createState() => _CreatTextFieldState();
}

class _CreatTextFieldState extends State<CreatTextField> {
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      child: TextFormField(
        onChanged: widget.onnChanged,
        controller: widget.controller,
        validator: widget.validator,
        style: Textfiled.display5(context),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          filled: true,
          fillColor: Colors.white,
          hintText: "Phone Number",
          hintStyle: Textfiledhint.display5(context),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
      ),
    );
  }
}
