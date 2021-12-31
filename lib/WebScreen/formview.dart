import 'package:emaxapp/WebScreen/listview_screen.dart';
import 'package:emaxapp/WebScreen/viewdata.dart';
import 'package:emaxapp/common_widgets/creat_button.dart';
import 'package:emaxapp/common_widgets/creat_text_field.dart';
import 'package:emaxapp/local_data.dart';
import 'package:emaxapp/providers/getdata_provider.dart';
import 'package:emaxapp/utilities/text_style.dart';
import 'package:emaxapp/utilities/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormView extends StatefulWidget {
  static const route = "FormView";
  const FormView({Key key}) : super(key: key);

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  GetDataProvider getDataProvider;
  final formKey = GlobalKey<FormState>();
  CollectionReference egypt = FirebaseFirestore.instance.collection('Egypt');
  CollectionReference united = FirebaseFirestore.instance.collection('US');
  CollectionReference canda = FirebaseFirestore.instance.collection('Belgium');

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
      children: [_background(size), _form(size)],
    );
  }

  Widget _background(Size size) {
    return Expanded(
      flex: 1,
      child: Container(
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/image/BK.jpg"),
          fit: BoxFit.fill,
        )),
      ),
    );
  }

  Widget _form(Size size) {
    final AlertDialog alert = AlertDialog(
        title: Text(
          error,
          textAlign: TextAlign.center,
          style: Maintext.display5(context),
        ),
        content: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Okay", style: Maintext.display5(context)),
        ));

    return Expanded(
      flex: 1,
      child: Form(
        key: formKey,
        child: Container(
          color: Color(0xffE7C475),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Search for a number',
                style: TitleStyle.display5(context),
              ),
              CreatTextField(
                controller: phoneController,
                validator: (value) => Validator.mobileNumber(value),
              ),
              CreatButton(
                label: 'Search',
                labelStyle: Textfiled.display5(context),
                width: size.width * 0.2,
                height: size.height * 0.05,
                onPress: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    getDataProvider
                        .getPhoneData(phoneController.text)
                        .then((value) => {
                              if (getDataProvider.phoneData.valid == true)
                                {add(getDataProvider.phoneData.countryCode)}
                              else
                                {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    },
                                  )
                                }
                            });
                  }
                },
              ),
              CreatButton(
                label: 'History',
                width: size.width * 0.2,
                labelStyle: Textfiled.display5(context),
                height: size.height * 0.05,
                onPress: () {
                  Navigator.pushNamed(context, HistoryScreen.route);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void add(String code) {
    if (code == 'EG') {
      egypt.add({
        'number': getDataProvider.phoneData.number,
        'valid': getDataProvider.phoneData.valid,
        'contrycode': getDataProvider.phoneData.countryCode,
        'countryName': getDataProvider.phoneData.countryName,
        'location': getDataProvider.phoneData.location
      }).then((value) => {Navigator.pushNamed(context, ViewData.route)});
    } else if (code == 'US') {
      united.add({
        'number': getDataProvider.phoneData.number,
        'valid': getDataProvider.phoneData.valid,
        'contrycode': getDataProvider.phoneData.countryCode,
        'countryName': getDataProvider.phoneData.countryName,
        'location': getDataProvider.phoneData.location
      }).then((value) => {Navigator.pushNamed(context, ViewData.route)});
    } else if (code == 'BE') {
      canda.add({
        'number': getDataProvider.phoneData.number,
        'valid': getDataProvider.phoneData.valid,
        'contrycode': getDataProvider.phoneData.countryCode,
        'countryName': getDataProvider.phoneData.countryName,
        'location': getDataProvider.phoneData.location
      }).then((value) => {Navigator.pushNamed(context, ViewData.route)});
    }
  }
}
