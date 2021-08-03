import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

import 'dart:convert';

import 'package:flutter_test_dev/Services/models/local.dart';

class ApiProviderLocal {
  Future<List<Local>> ReadJsonData() async {
    //read json file
    final jsondata = await rootBundle.loadString('image/titul.json');
    //decode json data as list
    final data = json.decode(jsondata);
    List list = data;
    final titul = list.map((i) => new Local.fromJson(i));
    //print(vacancy);
    return titul.toList();
  }
}
