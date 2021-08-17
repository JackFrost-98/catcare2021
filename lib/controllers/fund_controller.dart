import 'package:catcare2/api/firebase_api_fund.dart';
import 'package:catcare2/models/funds.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FundController extends ChangeNotifier {
  final docProduct = FirebaseFirestore.instance.collection('Funds').doc();
  List<Funds> _funds = [];

  void setFunds(List<Funds> funds) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _funds = funds;
        notifyListeners();
      });

  void addFund(Funds fund) => FirebaseApi.createFund(fund);

  void removeFund(Funds fund) => FirebaseApi.deleteFund(fund);

  void updateFund(Funds fund, String title, String description) {
    fund.title = title;
    fund.description = description;

    FirebaseApi.updateFund(fund);
  }

  static Future<List<Funds>> fetchFunds() async {
    final result = await FirebaseFirestore.instance
        .collection('Fund')
        .orderBy(FundField.createdTime, descending: true)
        .get();

    final documents = result.docs;

    return documents.map((e) => Funds.fromMap(e.id, e.data())).toList();
  }

  static Future<bool> insertFund(Funds product) async {
    try {
      await FirebaseFirestore.instance.collection('Fund').add(product.toJson());

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
