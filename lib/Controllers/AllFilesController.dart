import 'package:flutter_test_dev/Services/LocalDepository.dart';
import 'package:flutter_test_dev/Services/models/local.dart';
import 'package:flutter_test_dev/services/FilesDepository.dart';
import 'package:get/get.dart';

class AllFilesController extends GetxController {
  List files = [].obs;
  List titul = [].obs;
  late dynamic value;
  List filteredFiles = <Local>[].obs;
  RxBool isLoading = true.obs;
  RxBool isFiltred = true.obs;
  @override
  void onInit() {
    fetchData();
    fetchLocal();
    super.onInit();
  }

  void fetchData() async {
    try {
      files = (await FilesRepository.getAllFiles());
    } finally {
      isLoading.value = false;
    }
    // print(files[0].thumbnailUrl);
  }

  void fetchLocal() async {
    try {
      titul = (await LocalRepository.getAllLocal());
    } finally {
      isLoading.value = false;
    }
  }

  void filterList() {
    isFiltred.value = false;
    print(isFiltred.value);
  }
}
