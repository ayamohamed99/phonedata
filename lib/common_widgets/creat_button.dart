
import 'package:flutter/material.dart';

class CreatButton extends StatefulWidget {
  final double height, width, topMargin;
  final Function onPress, onHover;
  final String label, title, buttonType;
  final Color color, dotColor;

  final TextStyle labelStyle, titleStyle;

  CreatButton({
    Key key,
    this.height,
    this.width,
    this.onPress,
    this.label,
    this.color,
    this.topMargin,
    this.onHover,
    this.buttonType,
    this.dotColor,
    this.labelStyle,
    this.title,
    this.titleStyle,
  }) : super(key: key);

  @override
  _CreatButtonState createState() => _CreatButtonState();
}

class _CreatButtonState extends State<CreatButton> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      onHover: widget.onHover,
      child: Container(
                margin: EdgeInsets.symmetric(
                 vertical: widget.topMargin == null ? 10 : widget.topMargin),
                height: widget.height,
                width: widget.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[
                                Color(0xff764B0C),
                                Color(0xffE7C475),
                                Color(0xffBB8B3F),
                                Color(0xffC9994C),
                                Color(0xff9D6D22)
                              ]),
                    borderRadius: widget.buttonType == "smallbutton"
                        ? BorderRadius.circular(5)
                        : BorderRadius.circular(10)),
                child: Text(
                  widget.label,
                  style: widget.labelStyle,
                ),
              ),
            
    );
  }
}