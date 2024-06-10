import 'dart:async';
import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../models/attribute_model.dart';
import '../models/locations_model.dart';
import '../models/offline_locations_model.dart';
import '../services/common_service.dart';

class DetailController extends GetxController {
  ScrollController scrollController = ScrollController();
  var assetsAudioPlayerForLongAudio = AssetsAudioPlayer().obs;
  var assetsAudioPlayerForShortAudio = AssetsAudioPlayer().obs;
  // var buttonLoader = false.obs;
  // var loader = false.obs;
  CommonService commonService = Get.find();
  // final List<StreamSubscription> audioSubscriptions = [];
  // var isBufferingStream = false.obs;
  // ItemScrollController itemScrollController;
  // ItemPositionsListener itemPositionsListener;
  // var selectedBeaconId = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    print("DetailController OnInit");
    assetsAudioPlayerForShortAudio.value = AssetsAudioPlayer();
    assetsAudioPlayerForLongAudio.value = AssetsAudioPlayer();
    // itemScrollController = ItemScrollController();
    // itemPositionsListener = ItemPositionsListener.create();
  }

  @override
  void onClose() {
    super.onClose();
    print("DetailController OnClose");
    assetsAudioPlayerForShortAudio.value.dispose();
    assetsAudioPlayerForLongAudio.value.dispose();
  }

  // void openPlayer(String file, int beaconId) async {
  //   if (file.isNotEmpty) {
  //     try {
  //       await commonService.assetsAudioPlayer.value.open(
  //         Audio(
  //           Helper.localAssetPath(file),
  //         ),
  //         showNotification: true,
  //         autoStart: false,
  //       );
  //     } catch (e) {}
  //     switch (commonService.selectedBeacon.value.action) {
  //       case '1':
  //       case '5':
  //         if (commonService.inMuseum.value) {
  //           print("Entering");
  //
  //           AssetsAudioPlayer.allPlayers().forEach((key, value) {
  //             value.pause();
  //           });
  //           commonService.assetsAudioPlayer.value.play();
  //           commonService.isAudioPlaying.value = false;
  //           commonService.isAudioPlaying.refresh();
  //           // int selectedLocationIndex = commonService.sameCategoryBeacons.indexWhere((element) => element.locationId == commonService.selectedBeacon.value.locationId);
  //           // if (selectedLocationIndex > -1) {
  //           //   itemScrollController.scrollTo(index: selectedLocationIndex, duration: const Duration(milliseconds: 200));
  //           // }
  //         }
  //
  //         break;
  //     }
  //     commonService.assetsAudioPlayer.value.playlistAudioFinished.listen((Playing playing) {
  //       commonService.isAudioPlaying.value = false;
  //       commonService.isAudioPlaying.refresh();
  //     });
  //   }
  // }

  // Future<void> getLocationDetailData(int locationId) async {
  //   commonService.selectedAudioFile.value = "";
  //   selectedBeaconId.value = 0;
  //   AssetsAudioPlayer.allPlayers().forEach((key, value) {
  //     value.stop();
  //   });
  //   commonService.assetsAudioPlayer.value.dispose();
  //   commonService.assetsAudioPlayer.value = AssetsAudioPlayer();
  //   if (commonService.offlineLocationDetailData.value.data.isNotEmpty) {
  //     int locDataIndex = commonService.offlineLocationDetailData.value.data.indexWhere((element) => element.locationId == locationId);
  //     if (locDataIndex > -1) {
  //       commonService.selectedLocationName.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationName;
  //       commonService.selectedLocationId.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationId;
  //       commonService.locationDetailData.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail;
  //       int audioFileIndex = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.indexWhere((element) => element.isPrimary == 1);
  //       if (audioFileIndex > -1) {
  //         if (GetStorage().read('language_id') == 1) {
  //           switch (commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).englishParam) {
  //             case 'E':
  //               commonService.selectedAudioFile.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).englishSoundFile;
  //               break;
  //             case 'H':
  //               commonService.selectedAudioFile.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).hindiSoundFile;
  //               break;
  //             case 'P':
  //               commonService.selectedAudioFile.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).punjabiSoundFile;
  //               break;
  //             case 'POP':
  //               Helper.alertDialog();
  //               break;
  //           }
  //         } else if (GetStorage().read('language_id') == 2) {
  //           switch (commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).hindiParam) {
  //             case 'E':
  //               commonService.selectedAudioFile.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).englishSoundFile;
  //               break;
  //             case 'H':
  //               commonService.selectedAudioFile.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).hindiSoundFile;
  //               break;
  //             case 'P':
  //               commonService.selectedAudioFile.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).punjabiSoundFile;
  //               break;
  //             case 'POP':
  //               Helper.alertDialog();
  //               break;
  //           }
  //         } else {
  //           switch (commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).punjabiParam) {
  //             case 'E':
  //               commonService.selectedAudioFile.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).englishSoundFile;
  //               break;
  //             case 'H':
  //               commonService.selectedAudioFile.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).hindiSoundFile;
  //               break;
  //             case 'P':
  //               commonService.selectedAudioFile.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).punjabiSoundFile;
  //               break;
  //             case 'POP':
  //               Helper.alertDialog();
  //               break;
  //           }
  //         }
  //         selectedBeaconId.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).id;
  //         openPlayer(commonService.selectedAudioFile.value, selectedBeaconId.value);
  //       }
  //     }
  //   }
  // }
  Future<bool> loadAndParseJson(int locationId) async {
    String file = "";
    final languageId = GetStorage().read('language_id');

    if (languageId != '' || languageId != null) {
      switch (languageId) {
        case 1:
          file = "locations.json";
          break;
        case 2:
          file = "locations_hi.json";
          break;
        case 3:
          file = "locations_ta.json";
          break;
        case 4:
          file = "locations_te.json";
          break;
        case 5:
          file = "locations_ka.json";
          break;
        case 6:
          file = "locations_ma.json";
          break;
        case 7:
          file = "locations_mar.json";
          break;
      }
    }

    try {
      final String data =
          await rootBundle.loadString('assets/data_files/$file');
      List<dynamic>? locations = jsonDecode(data)['data'];
      OfflineLocationsItem? item;
      for (var location in locations!) {
        if (location['location_id'] == locationId) {
          item = OfflineLocationsItem.fromJson(location);
          commonService.selectedLocationName.value = item.locationName;
          commonService.selectedLocationId.value = item.locationId;
          commonService.locationDetailData.value = item.locationDetail;
          int locIndex = commonService.locationDetailData.indexWhere(
              (element) => element.moduleAlias == "loc_description");
          if (locIndex > -1) {
            if (commonService.locationDetailData
                .elementAt(locIndex)
                .attributes
                .isNotEmpty) {
              Attributes locAttributes = commonService.locationDetailData
                  .elementAt(locIndex)
                  .attributes
                  .elementAt(0);
              if (locAttributes.shortAudio.isNotEmpty) {
                try {
                  // bool playing =
                  //     commonService.assetsAudioPlayer.value.isPlaying.value;
                  // print("is playing:");
                  // print(playing);
                  // await assetsAudioPlayerForShortAudio.value.open(
                  //   Audio(
                  //     Helper.localAssetPath(locAttributes.shortAudio),
                  //   ),
                  //   showNotification: false,
                  //   autoStart: playing ? false : locAttributes.isAudioAutoPlay,
                  // );
                } catch (e) {}
              }
              if (locAttributes.longAudio.isNotEmpty) {
                try {
                  // await assetsAudioPlayerForLongAudio.value.open(
                  //   Audio(
                  //     Helper.localAssetPath(locAttributes.longAudio),
                  //   ),
                  //   showNotification: false,
                  //   autoStart: false,
                  // );
                } catch (e) {}
              }
            }
          }
          break;
        }
      }
      if (item?.locationId != null) {
        locations = null;
        return true;
      } else
        return false;
    } catch (e) {
      print('Error loading or parsing JSON file: $e');
      return false;
    }
  }

  Future<void> getLocationDetailData(int locationId) async {
    commonService.selectedAudioFile.value = "";
    // selectedBeaconId.value = 0;
    commonService.selectedFileType.value = "";
    // AssetsAudioPlayer.allPlayers().forEach((key, value) {
    //   value.pause();
    // });

    // if (commonService.offlineLocationDetailData.value.data.isNotEmpty) {
    //   int locDataIndex = commonService.offlineLocationDetailData.value.data
    //       .indexWhere((element) => element.locationId == locationId);
    //   if (locDataIndex > -1) {
    //     commonService.selectedLocationName.value = commonService
    //         .offlineLocationDetailData.value.data
    //         .elementAt(locDataIndex)
    //         .locationName;
    //     commonService.selectedLocationId.value = commonService
    //         .offlineLocationDetailData.value.data
    //         .elementAt(locDataIndex)
    //         .locationId;
    //     commonService.locationDetailData.value = commonService
    //         .offlineLocationDetailData.value.data
    //         .elementAt(locDataIndex)
    //         .locationDetail;
    //     int locIndex = commonService.locationDetailData
    //         .indexWhere((element) => element.moduleAlias == "loc_description");
    //     if (locIndex > -1) {
    //       if (commonService.locationDetailData
    //           .elementAt(locIndex)
    //           .attributes
    //           .isNotEmpty) {
    //         Attributes locAttributes = commonService.locationDetailData
    //             .elementAt(locIndex)
    //             .attributes
    //             .elementAt(0);
    //         if (locAttributes.shortAudio.isNotEmpty) {
    //           try {
    //             bool playing =
    //                 commonService.assetsAudioPlayer.value.isPlaying.value;
    //             print("is playing:");
    //             print(playing);
    //             await assetsAudioPlayerForShortAudio.value.open(
    //               Audio(
    //                 Helper.localAssetPath(locAttributes.shortAudio),
    //               ),
    //               showNotification: false,
    //               autoStart: playing ? false : locAttributes.isAudioAutoPlay,
    //             );
    //           } catch (e) {}
    //         }
    //         if (locAttributes.longAudio.isNotEmpty) {
    //           try {
    //             await assetsAudioPlayerForLongAudio.value.open(
    //               Audio(
    //                 Helper.localAssetPath(locAttributes.longAudio),
    //               ),
    //               showNotification: false,
    //               autoStart: false,
    //             );
    //           } catch (e) {}
    //         }
    //       }
    //     }
    //
    //
    //   }
    // }
    // int audioFileIndex = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.indexWhere((element) => element.isPrimary == 1);
    // if (audioFileIndex > -1) {
    //   commonService.selectedFileType.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).fileType;
    //   if (GetStorage().read('language_id') == 1) {
    //     commonService.selectedAudioFile.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).englishSoundFile;
    //   } else if (GetStorage().read('language_id') == 2) {
    //     commonService.selectedAudioFile.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).hindiSoundFile;
    //   } else {
    //     commonService.selectedAudioFile.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).punjabiSoundFile;
    //   }
    //   selectedBeaconId.value = commonService.offlineLocationDetailData.value.data.elementAt(locDataIndex).locationDetail.attributes.baconListing.elementAt(audioFileIndex).id;
    //   if (commonService.selectedFileType.value == "A") {
    //     openPlayer(commonService.selectedAudioFile.value, selectedBeaconId.value);
    //   } else {
    //     // initializeAndPlayYTPlayer(commonService.selectedAudioFile.value);
    //   }
    // }
  }

  // Future<void> loadJsonFromAssets() async {
  //   // Specify the path to your JSON file in the assets folder
  //   String path = 'assets/data.json';
  //
  //   // Load the JSON file
  //   String jsonString = await rootBundle.loadString(path);
  //
  //   // Decode the JSON string
  //   Map<String, dynamic> jsonData = json.decode(jsonString);
  //
  //   // Now, jsonData contains the parsed JSON from the file
  //   print(jsonData);
  // }
  // Future getLocationsData() async {
  //   String file = "";
  //   if (GetStorage().read('language_id') != '' || GetStorage().read('language_id') != null) {
  //     switch (GetStorage().read('language_id')) {
  //       case 1:
  //         file = "locations.json";
  //         break;
  //       case 2:
  //         file = "locations_hi.json";
  //         break;
  //       case 3:
  //         file = "locations_ta.json";
  //         break;
  //       case 4:
  //         file = "locations_te.json";
  //         break;
  //       case 5:
  //         file = "locations_ka.json";
  //         break;
  //       case 6:
  //         file = "locations_ma.json";
  //         break;
  //       case 7:
  //         file = "locations_mar.json";
  //         break;
  //     }
  //   }
  //   try {
  //     final String data = await rootBundle.loadString('assets/data_files/$file');
  //     var response = jsonDecode(data);
  //     if (response['status']) {
  //       commonService.locationDetailData.value = DetailModel.fromJson(response);
  //       commonService.locationDetailData.refresh();
  //     }
  //   } catch (e) {
  //     throw Exception("Error: ${e.toString()}");
  //   }
  // }

  // Future getOfflineLocationsData() async {
  //   String file = "";
  //   if (GetStorage().read('language_id') != '' ||
  //       GetStorage().read('language_id') != null) {
  //     switch (GetStorage().read('language_id')) {
  //       case 1:
  //         file = "locations.json";
  //         break;
  //       case 2:
  //         file = "locations_hi.json";
  //         break;
  //       case 3:
  //         file = "locations_ta.json";
  //         break;
  //       case 4:
  //         file = "locations_te.json";
  //         break;
  //       case 5:
  //         file = "locations_ka.json";
  //         break;
  //       case 6:
  //         file = "locations_ma.json";
  //         break;
  //       case 7:
  //         file = "locations_mar.json";
  //         break;
  //     }
  //   }
  //   //try {
  //   final String data = await rootBundle.loadString('assets/data_files/$file');
  //   var response = jsonDecode(data);
  //   if (response['status']) {
  //     print(3333);
  //     commonService.offlineLocationDetailData.value =
  //         OfflineLocationsModel.fromJson(response);
  //     commonService.offlineLocationDetailData.refresh();
  //     print(response['data']);
  //   }
  //   // } catch (e) {
  //   //   throw Exception("Error: ${e.toString()}");
  //   // }
  // }

  Future getStaticLocationsData(String? searchVal) async {
    // if (searchVal != null && searchVal.length == 0) {
    //   return;
    // }
    String file = "";
    if (GetStorage().read('language_id') != '' ||
        GetStorage().read('language_id') != null) {
      switch (GetStorage().read('language_id')) {
        case 1:
          file = "static_locations.json";
          break;
        case 2:
          file = "static_locations_hi.json";
          break;
        case 3:
          file = "static_locations_ta.json";
          break;
        case 4:
          file = "static_locations_te.json";
          break;
        case 5:
          file = "static_locations_ka.json";
          break;
        case 6:
          file = "static_locations_ma.json";
          break;
        case 7:
          file = "static_locations_mar.json";
          break;
      }
    }
    //try {
    final String data = await rootBundle.loadString('assets/data_files/$file');
    var response = jsonDecode(data);
    print(222222);
    if (response['status'] == 200) {
      print(133333);
      if (searchVal != null && searchVal.length > 0) {
        // commonService.staticLocationsData.value =
        //     LocationsModel.filterLocations(
        //         LocationsModel.fromJSON(response), searchVal);
        // commonService.staticLocationsData.refresh();
      } else {
        // commonService.staticLocationsData.value =
        //     LocationsModel.fromJson(response);
        // commonService.staticLocationsData.refresh();
      }
      print(response['data']);
    }
    // } catch (e) {
    //   throw Exception("Error: ${e.toString()}");
    // }
  }
}
