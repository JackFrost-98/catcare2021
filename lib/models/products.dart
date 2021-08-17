import 'package:catcare2/widget/utils.dart';
import 'package:flutter/cupertino.dart';

class ProductField {
  static const createdTime = 'createdTime';
}

class Product {
  DateTime createdTime;
  String title;
  String id;
  String description;
  String price;
  String imgUrl;
  bool isDone;

  Product({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.price = '',
    this.imgUrl = '',
    this.id,
    this.isDone = false,
  });

  @override
  String toString() =>
      '{ id: $id, title: $title, price: $price, imgUrl: $imgUrl, isDone: $isDone, description: $description }';

  static Product fromJson(Map<String, dynamic> json) => Product(
        createdTime: Utils.toDateTime(json['createdTime']),
        title: json['title'],
        description: json['description'],
        price: json['price'],
        imgUrl: json['imgUrl'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'price': price,
        'imgUrl': imgUrl,
        'id': id,
        'isDone': isDone,
      };

  factory Product.fromMap(id, Map<String, dynamic> data) {
    if (data == null || id == null) {
      return null;
    }
    final String title = data['title'];
    if (title == null) {
      return null;
    }
    final String description = data['description'];
    if (description == null) {
      return null;
    }
    final String price = data['price'];
    if (price == null) {
      return null;
    }
    final String imgUrl = data['imgUrl'];
    if (imgUrl == null) {
      return null;
    }
    final bool isDone = data['isDone'];
    if (isDone == null) {
      return null;
    }
    final DateTime createdTime = data['createdTime'].toDate();
    if (createdTime == null) {
      return null;
    }

    return Product(
      id: id,
      title: title,
      description: description,
      price: price,
      imgUrl: imgUrl,
      isDone: isDone,
      createdTime: createdTime,
    );
  }
}
