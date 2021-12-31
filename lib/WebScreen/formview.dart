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
  int numberOfItems = 1;

  @override
  void initState() {
    super.initState();
    getDataProvider = Provider.of<GetDataProvider>(context, listen: false);
  }
  // CollectionReference phoneData =
  //       FirebaseFirestore.instance.collection('PhoneData');

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
          style: Maintext.display5(context),
        ),
        content: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Okay"),
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
                width: size.width * 0.19,
                height: size.height * 0.08,
                onPress: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    getDataProvider
                        .getPhoneData(phoneController.text)
                        .then((value) => {
                              if (getDataProvider.phoneData.valid == true)
                                {
                                   Navigator.pushNamed(
                                            context, ViewData.route)
                                  //  Navigator.pushNamed(context, ViewData.route)
                                  // phoneData.add({
                                  //   'number': getDataProvider.phoneData.number,
                                  //   'valid': getDataProvider.phoneData.valid,
                                  //   'contrycode':
                                  //       getDataProvider.phoneData.countryCode,
                                  //   'countryName':
                                  //       getDataProvider.phoneData.countryName,
                                  //   'location':
                                  //       getDataProvider.phoneData.location
                                  // }).then((value) => {
                                  //       Navigator.pushNamed(
                                  //           context, ViewData.route)
                                  //     })
                                }
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
