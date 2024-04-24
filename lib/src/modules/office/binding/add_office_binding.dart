import 'package:get/get.dart';
import 'package:hashmicro_test/src/modules/office/controller/add_office_controller.dart';

class AddOfficeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddOfficeController>(
      () => AddOfficeController(),
    );
  }
}
