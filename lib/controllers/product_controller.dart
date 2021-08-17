import 'package:catcare2/api/firebase_api.dart';
import 'package:catcare2/models/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductController extends ChangeNotifier {
  final docProduct = FirebaseFirestore.instance.collection('Products').doc();
  List<Product> _products = [];

  List<Product> get products =>
      _products.where((product) => product.isDone == false).toList();

  List<Product> get productsCompleted =>
      _products.where((product) => product.isDone == true).toList();

  void setProducts(List<Product> products) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _products = products;
        notifyListeners();
      });

  void addProduct(Product product) => FirebaseApi.createProduct(product);

  void removeProduct(Product product) => FirebaseApi.deleteProduct(product);

  static bool toggleProductStatus(Product product) {
    product.isDone = !product.isDone;
    FirebaseApi.updateProduct(product);

    return product.isDone;
  }

  void updateProduct(Product product, String title, String description) {
    product.title = title;
    product.description = description;

    FirebaseApi.updateProduct(product);
  }

  static Future<List<Product>> fetchProducts() async {
    final result = await FirebaseFirestore.instance
        .collection('Products')
        .orderBy(ProductField.createdTime, descending: true)
        .get();

    final documents = result.docs;

    return documents.map((e) => Product.fromMap(e.id, e.data())).toList();
  }

  static Future<bool> insertProduct(Product product) async {
    try {
      await FirebaseFirestore.instance
          .collection('Products')
          .add(product.toJson());

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
