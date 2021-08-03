import 'package:flutter_test_dev/Services/ApiProvideLocal.dart';
import 'package:flutter_test_dev/Services/models/local.dart';

class LocalRepository {
  static Future<List<Local>> getAllLocal() => ApiProviderLocal().ReadJsonData();
}
