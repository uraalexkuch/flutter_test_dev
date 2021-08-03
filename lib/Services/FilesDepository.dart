import 'package:flutter_test_dev/Services/models/files.dart';

import 'package:flutter_test_dev/services/ApiProviderFilesc.dart';

class FilesRepository {
  static Future<List<File>>getAllFiles()  => ApiProviderFiles.fetchAll();
}
