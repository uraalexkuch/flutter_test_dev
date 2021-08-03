import 'package:flutter_test_dev/services/FilesDepository.dart';
import 'package:get/get.dart';

class TwoPageController extends GetxController {
  List files = [].obs;
  int? count = 0;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchData();

    print(count);

    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      files = (await FilesRepository.getAllFiles());
    } finally {
      isLoading.value = false;
    }
    print(files[0].thumbnailUrl);
  }
}
