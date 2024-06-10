import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mahabharat_museum/apis/dashboard_apis.dart';
import 'package:mahabharat_museum/models/locations_model.dart';

class DashBoardController extends GetxController {
  final DashboardApis _dashboardApis = DashboardApis();
  RxInt counter = 0.obs;
  RxString title = 'Mahabharata Museum'.obs;
  List<String> images = [
    'assets/images/stack1.png',
    'assets/images/stack1.png',
    'assets/images/stack1.png',
  ];
  var locationList = <LocationsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLocations();
  }

  void fetchLocations() async {
    try {
      EasyLoading.show(status: 'Loading...');

      var response = await _dashboardApis.getLocations(languageId: 1);
      if (response['code'] == 200) {
        EasyLoading.showSuccess('Success');

       locationList.value = Locati.fromJson(response);
      } else {
        // Registration failed
        // Error message: response['message']
        EasyLoading.showError(response['message']);
      }
    } catch (e) {
      EasyLoading.showError('Error');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
