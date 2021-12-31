import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:emaxapp/model/phone_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GetDataProvider extends ChangeNotifier {
  String baseUrl =
      'http://apilayer.net/api/validate?access_key=a6f1ed22c64a7373ab3e46ca8809932e&number=';
  String endpPoint = '&country_code=&format=1';
  PhoneData phoneData;

  Future<bool> getPhoneData(String number) async {
    try {
      http.Response response = await http.get(
          Uri.parse(baseUrl + number + endpPoint),
          headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        phoneData = PhoneData.fromJson(jsonDecode(response.body));
        notifyListeners();
        print('success');
        
      }
    } on DioError catch (error) {
      print('fail');
      print(error.toString());
    }
    return phoneData.valid;
  }
}
