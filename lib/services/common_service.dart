import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/detail_model.dart';
import '../models/location_model.dart';
import '../models/locations_model.dart';
class CommonService extends GetxService {
  // var dashboardData = DashboardModel().obs;
  // var categoryData = DashboardModel().obs;
  var lastPlayedMacAddress = "".obs;
  var selectedCategoryName = "".obs;
  var selectedLocationId = 0.obs;
  var selectedFileType = "".obs;
  var fontSize = 1.0.obs;
  var fontSizeLabel = 'normal'.obs;
  var selectedLocationName = "".obs;
  var selectedAudioFile = "".obs;
  var isBluetoothPermissionPopupOpened = false.obs;
  var inMuseum = false.obs;
  var selectedBottomBarItemIndex = 0.obs;
  var playlistPopupOpened = false.obs;
  var socialUrl = ''.obs;
  var webViewTitle = ''.obs;
  // var staticLocationsData = LocationsModel().obs;
  var locationDetailData = <DetailModel>[].obs;

  GlobalKey<ScaffoldState> serialNoKey = GlobalKey<ScaffoldState>(
      debugLabel: DateTime.now().millisecondsSinceEpoch.toString());
  GlobalKey<ScaffoldState> barcodeKey = GlobalKey<ScaffoldState>(
      debugLabel: DateTime.now().millisecondsSinceEpoch.toString());


}
