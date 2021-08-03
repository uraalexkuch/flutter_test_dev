import 'package:flutter_test_dev/Services/models/files.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProviderFiles {
  static const String url =
      'https://jsonplaceholder.typicode.com/photos?albumId=1';
  static Future<List<File>> fetchAll() async {
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      utf8.decode(response.bodyBytes);
      String source = Utf8Decoder().convert(response.bodyBytes);
      var data = json.decode(source);
      List list = data;
      final files = list.map((i) => new File.fromJson(i));
      //print(vacancy);
      return files.toList();
    } else {
      return [];
    }
  }
}
