class Attributes {
  int id = 0;
  int locationId = 0;
  int categoryId = 0;
  String title = '';
  String imagePath = '';
  String soundPath = '';
  String description = '';
  int serialNo = 0;
  String mapIcon = "";
  int rank = 0;
  String type = '';
  String typeData = "";
  String latitude = "";
  String longitude = "";
  String attributeTypes = '';
  String shortAudio = '';
  String longAudio = '';
  String alias = '';
  bool isAudioAutoPlay = false;
  List<Attributes> imageSliders = [];
  Attributes();
  Attributes.fromJSON(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    locationId = json["location_id"] ?? 0;
    categoryId = json["category_id"] ?? 0;
    title =
        json["title"] ?? json["location_name"] ?? json["category_name"] ?? '';
    imagePath = json["image_path"] ?? json["media_url"] ?? '';
    description = json["description"] ?? json["description2"] ?? '';
    soundPath = json["sound_path"] ?? '';
    latitude = json["latitude"] ?? '';
    longitude = json["longitude"] ?? '';
    rank = json["rank"] ?? 0;
    type = json["type"] ?? json["typedata"] ?? '';
    mapIcon = json["map_icon"] ?? '';
    typeData = json["type_data"] ?? "";
    attributeTypes = json["att_type"] ?? '';
    shortAudio = json["short_audio"] ?? '';
    longAudio = json["long_audio"] ?? '';
    alias = json["alias"] ?? '';
    serialNo = json["serial_no"] ?? 0;
    isAudioAutoPlay =
        json["is_audio_auto_play"] == 0 || json["is_audio_auto_play"] == null
            ? false
            : true;
    imageSliders = json["sliderimages"] != null
        ? parseImageSlider(json["sliderimages"])
        : [];
  }

  static List<Attributes> parseImageSlider(jsonData) {
    List _list = jsonData;
    List<Attributes> _data =
        _list.map((data) => Attributes.fromJSON(data)).toList();
    return _data;
  }
}
