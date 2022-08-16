import 'package:flutter/cupertino.dart';

class TrackOrderIconModel {
  late String orderId;
  late String title;
  late String subtitle;
 late  IconData  icon;
  late String date;

  TrackOrderIconModel(
      {required this.title,required  this.subtitle,required  this.icon, required this.date});

  TrackOrderIconModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    title = json['title'];
    subtitle = json['subtitle'];
    icon = json['icon'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['icon'] = this.icon;
    data['date'] = this.date;
    return data;
  }
}
