import 'dart:io';

import 'package:catcare2/models/funds.dart';
import 'package:catcare2/models/products.dart';
import 'package:catcare2/widget/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';

class FirebaseApi {
  static Future<String> createFund(Funds fund) async {
    final docProduct = FirebaseFirestore.instance.collection('Products').doc();

    fund.id = docProduct.id;
    await docProduct.set(fund.toJson());

    return docProduct.id;
  }

  Future<String> uploadFile(String title, File file) async {
    try {
      String path = 'uploads/products/$title-${DateTime.now()}.png';
      await firebase_storage.FirebaseStorage.instance.ref(path).putFile(file);

      String downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref(path)
          .getDownloadURL();

      return downloadURL;
    } catch (e) {
      return '';
      // e.g, e.code == 'canceled'
    }
  }

  static Future downloadFile2(
      String path, firebase_storage.Reference ref) async {
    final ref = firebase_storage.FirebaseStorage.instance.ref(path);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${ref.name}');

    await ref.writeToFile(file);
  }

  Future<bool> downloadFile(String path) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      // String path = 'Cat Funds Formuploads/CatCare Funds Form.docx';
      File downloadToFile =
          File('${appDocDir.path}/file-${DateTime.now()}.png');
      final task = await firebase_storage.FirebaseStorage.instance
          .ref(path)
          .writeToFile(downloadToFile);

      return true;
    } catch (e) {
      print(e);

      return false;
      // e.g, e.code == 'canceled'
    }
  }

  static Stream readFund() {
    return FirebaseFirestore.instance
        .collection('Funds')
        .orderBy(ProductField.createdTime, descending: true)
        .snapshots();

    // .transform(Utils.transformer(Funds.fromJson));
  }

  static Future<List<Funds>> fetchFund() async {
    final result = await FirebaseFirestore.instance
        .collection('Funds')
        .orderBy(ProductField.createdTime, descending: true)
        .get();

    final documents = result.docs;

    return documents.map((e) => Funds.fromMap(e.id, e.data())).toList();
  }

  static Future updateFund(Funds fund) async {
    final docProduct =
        FirebaseFirestore.instance.collection('Products').doc(fund.id);

    await docProduct.update(fund.toJson());
  }

  static Future deleteFund(Funds fund) async {
    final docProduct =
        FirebaseFirestore.instance.collection('Products').doc(fund.id);

    await docProduct.delete();
  }
}
