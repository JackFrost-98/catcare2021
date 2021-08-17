import 'package:catcare2/widget/utils.dart';
import 'package:flutter/cupertino.dart';

class FundField {
  static const createdTime = 'createdTime';
}

class Funds {
  DateTime createdTime;
  String title;
  String id;
  String goal;
  String description;
  String reason;
  String imgUrl;
  String email;

  Funds({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.reason = '',
    this.imgUrl = '',
    this.id,
    this.goal = '',
    this.email = '',
  });

  @override
  String toString() =>
      '{ id: $id, goal: $goal, title: $title, reason: $reason, imgUrl: $imgUrl, description: $description, email: $email }';

  static Funds fromJson(Map<String, dynamic> json) => Funds(
      createdTime: Utils.toDateTime(json['createdTime']),
      title: json['title'],
      description: json['description'],
      reason: json['reason'],
      imgUrl: json['imgUrl'],
      goal: json['goal'],
      email: json['email'],
      id: json['id']);

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'reason': reason,
        'imgUrl': imgUrl,
        'goal': goal,
        'email': email,
        'id': id,
      };

  factory Funds.fromMap(id, Map<String, dynamic> data) {
    if (data == null || id == null) {
      return null;
    }
    final String email = data['email'];
    if (email == null) {
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
    final String goal = data['goal'];
    if (goal == null) {
      return null;
    }
    final String imgUrl = data['imgUrl'];
    if (imgUrl == null) {
      return null;
    }
    final String reason = data['reason'];
    if (reason == null) {
      return null;
    }
    final DateTime createdTime = data['createdTime'].toDate();
    if (createdTime == null) {
      return null;
    }

    return Funds(
      id: id,
      goal: goal,
      title: title,
      description: description,
      reason: reason,
      imgUrl: imgUrl,
      email: email,
      createdTime: createdTime,
    );
  }
}
