import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FireStoreDataBase extends ChangeNotifier {
  List belgium = [];
  List egypt = [];
  List united = [];

  final CollectionReference collectionEG =
      FirebaseFirestore.instance.collection("Egypt");

  Future getDataEG() async {
    try {
      await collectionEG.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          egypt.add(result.data());
          notifyListeners();
        }
      });

      return belgium;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  final CollectionReference collectionUS =
      FirebaseFirestore.instance.collection("US");

  Future getDataUS() async {
    try {
      await collectionUS.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          united.add(result.data());
          notifyListeners();
        }
      });

      return belgium;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  final CollectionReference collectionBel =
      FirebaseFirestore.instance.collection("Belgium");

  Future getDataBE() async {
    try {
      await collectionBel.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          belgium.add(result.data());
          notifyListeners();
        }
      });

      return belgium;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }
}
