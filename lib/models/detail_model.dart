import 'attribute_model.dart';

class DetailModel {
  String moduleName = "";
  String moduleAlias = "";
  int languageId = 0;
  int moduleType = 0;
  int moduleLayout = 0;
  int moduleLayoutId = 0;
  List<Attributes> attributes = [];
  DetailModel();
  DetailModel.fromJson(Map<String, dynamic> json) {
    moduleName = json["module_name"] ?? '';
    moduleAlias = json["module_alias"] ?? '';
    languageId = json["language_id"] ?? 0;
    moduleType = json["module_type"] ?? 0;
    moduleLayout = json["module_layout"] ?? 0;
    moduleLayoutId = json["module_layout_id"] ?? 0;
    attributes = json["attributes"] != null ? parseAttributes(json["attributes"]) : [];
  }

  static List<Attributes> parseAttributes(attributesJson) {
    List list = attributesJson;
    List<Attributes> attrList =
        list.map((data) => Attributes.fromJSON(data)).toList();
    return attrList;
  }
}

// class DetailAttributes {
//   String title = "";
//   int id = 0;
//   String type = "";
//   int locationId = 0;
//   String locationName = "";
//   String description = "";
//   String mapIcon = "";
//   String imagePath = "";
//   bool isAudioAutoPlay = false;
//   String typeData = "";
//   String listViewIcon = "";
//   int serialNo = 0;
//   List<ImageSlider> imageSliders = [];
//   DetailAttributes();
//
//   DetailAttributes.fromJson(Map<String, dynamic> json) {
//     title = json["title"] ?? json["location_name"] ?? '';
//     id = json["id"] ?? 0;
//     type = json["type"] ?? '';
//     locationId = json["location_id"] ?? 0;
//     isAudioAutoPlay = json["is_audio_auto_play"] == 0 || json["is_audio_auto_play"] == null ? false : true;
//     locationName = json["location_name"] ?? '';
//     description = json["description2"] ?? '';
//     mapIcon = json["map_icon"] ?? '';
//     imagePath = json["image_path"];
//     typeData = json["type_data"] ?? "";
//     listViewIcon = json["list_view"] ?? "";
//     serialNo = json["serial_no"] ?? 0;
//     imageSliders = json["sliderimages"] != null ? parseImageSlider(json["sliderimages"]) : [];
//   }
// }
