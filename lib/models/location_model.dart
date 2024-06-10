class LocationModel {
  int id = 0;
  String title = '';
  String shortDescription = '';
  String description = '';
  String image = '';
  int serialNo = 0;


  LocationModel({this.id = 0, this.title = "", this.shortDescription = "", this.description = "", this.image = ""});
  LocationModel.fromJSON(Map<String, dynamic> json) {
    id = json["id"] ?? json["location_id"] ?? 0;
    title = json["title"] ?? json["location_name"] ?? '';
    shortDescription = json["short_description"] ?? '';
    description = json["description"] ?? '';
    image = json["image"] ?? json["media_file_name"] ?? '';
    serialNo = json["serial_no"] ?? 0;
  }

}
