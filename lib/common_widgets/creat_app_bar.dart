// import 'package:emaxapp/providers/language_provider.dart';
import 'package:emaxapp/WebScreen/formview.dart';
import 'package:emaxapp/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatAppBar extends StatefulWidget with PreferredSizeWidget {
  final String label;
  final Size preferredSize;

  CreatAppBar({
    Key key,
    this.label,
  })  : preferredSize = Size.fromHeight(90.0),
        super(key: key);

  @override
  State<CreatAppBar> createState() => _CreatAppBarState();
}

class _CreatAppBarState extends State<CreatAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      flexibleSpace:
          Container(decoration: BoxDecoration(color: Color(0xffE7C475))),
      title: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            widget.label,
            style: BarStyle.display5(context),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, FormView.route);
            },
            icon: Icon(Icons.home),
            iconSize: 40,
          )
        ]),
      ),
    );
  }
}
