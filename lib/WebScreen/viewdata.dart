import 'package:emaxapp/WebScreen/listview_screen.dart';
import 'package:emaxapp/common_widgets/creat_button.dart';
import 'package:emaxapp/common_widgets/create_dataform.dart';
import 'package:emaxapp/providers/getdata_provider.dart';
import 'package:emaxapp/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewData extends StatefulWidget {
  static const route = "ViewData";
  const ViewData({Key key}) : super(key: key);

  @override
  _ViewDataState createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  GetDataProvider getDataProvider;

  @override
  void initState() {
    super.initState();
    getDataProvider = Provider.of<GetDataProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    getDataProvider = Provider.of<GetDataProvider>(context, listen: true);

    return Scaffold(body: _body());
  }

  Widget _body() {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        _formBody(size),
        _background(size),
      ],
    );
  }

  Widget _background(Size size) {
    return Expanded(
      flex: 1,
      child: Container(
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/image/BK1.jpg"),
          fit: BoxFit.fill,
        )),
      ),
    );
  }

  Widget _formBody(Size size) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Color(0xffE7C475),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_title(), _form(size), _button(size), _buttonSearch(size)],
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      'Details behind every phone number',
      style: TitleStyle.display5(context),
    );
  }

  Widget _button(Size size) {
    return CreatButton(
      label: 'Back',
      width: size.width * 0.2,
      labelStyle: Textfiled.display5(context),
      height: size.height * 0.05,
      onPress: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buttonSearch(Size size) {
    return CreatButton(
      label: 'History',
      width: size.width * 0.2,
      labelStyle: Textfiled.display5(context),
      height: size.height * 0.05,
      onPress: () {
        Navigator.pushNamed(context, HistoryScreen.route);
      },
    );
  }

  Widget _form(Size size) {
    return Column(
      children: [
        ShowFormData(
          title: 'Number : ',
          info: getDataProvider.phoneData.number,
        ),
        ShowFormData(
          title: 'country_prefix : ',
          info: getDataProvider.phoneData.countryPrefix,
        ),
        ShowFormData(
          title: 'country_code : ',
          info: getDataProvider.phoneData.countryCode,
        ),
        ShowFormData(
          title: 'country_name : ',
          info: getDataProvider.phoneData.countryName,
        ),
        getDataProvider.phoneData.location == null
            ? ShowFormData(
                title: 'location : ', info: getDataProvider.phoneData.location)
            : Container(),
        ShowFormData(
          title: 'carrier : ',
          info: getDataProvider.phoneData.carrier,
        ),
      ],
    );
  }
}
