// import 'package:emaxapp/providers/language_provider.dart';
import 'package:emaxapp/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatAppBar extends StatefulWidget with PreferredSizeWidget {
  final String label;
  final Size preferredSize;

  CreatAppBar({
    Key key,
    this.label,
  })  : preferredSize = Size.fromHeight(80.0),
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
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Colors.yellow[600],
              Colors.orange[500],
              Colors.red[500]
            ],
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            widget.label,
            style: TitleStyle.display5(context),
          ),
        ]),
      ),
    );
  }
}
