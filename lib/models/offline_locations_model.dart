
import 'attribute_model.dart';
import 'detail_model.dart';

class OfflineLocationsModel {
  List<OfflineLocationsItem> data = [];

  OfflineLocationsModel();

  OfflineLocationsModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] != null ? parseData(json["data"]) : [];
  }

  static List<OfflineLocationsItem> parseData(attributesJson) {
    List list = attributesJson;
    List<OfflineLocationsItem> attrList =
        list.map((data) => OfflineLocationsItem.fromJson(data)).toList();
    return attrList;
  }

  static List<Attributes> parseAttributes(attributesJson) {
    List list = attributesJson;
    List<Attributes> attrList =
        list.map((data) => Attributes.fromJSON(data)).toList();
    return attrList;
  }
}

class OfflineLocationsItem {
  int locationId = 0;
  String locationName = '';
  int serialNo = 0;
  List<DetailModel> locationDetail = [];
  OfflineLocationsItem();
  OfflineLocationsItem.fromJson(Map<String, dynamic> json) {
    locationId = json["location_id"] ?? 0;
    locationName = json["location_name"] ?? '';
    serialNo = json["serial_no"] ?? 0;
    locationDetail = json["location_detail"] != null
        ? parseDetailModel(json["location_detail"])
        : [];
  }

  static List<DetailModel> parseDetailModel(attributesJson) {
    List list = attributesJson;
    List<DetailModel> attrList =
        list.map((data) => DetailModel.fromJson(data)).toList();
    return attrList;
  }
}
