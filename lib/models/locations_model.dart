
class LocationsModel {
  final int locationId;
  final String locationName;
  final String shortName;
  final String serialNo;
  final String qrCode;
  final String description;
  final String longitude;
  final String latitude;
  final String mapIcon;
  final String webIcon;
  final String appIcon;
  final String mapImage;
  final String categoryName;
  final String imagePath;
  final String visitedText;

  LocationsModel({
    required this.locationId,
    required this.locationName,
    required this.shortName,
    required this.serialNo,
    required this.qrCode,
    required this.description,
    required this.longitude,
    required this.latitude,
    required this.mapIcon,
    required this.webIcon,
    required this.appIcon,
    required this.mapImage,
    required this.categoryName,
    required this.imagePath,
    required this.visitedText,
  });

  factory LocationsModel.fromJson(Map<String, dynamic> json) {
    return LocationsModel(
      locationId: json['location_id'] ?? 0,
      locationName: json['location_name'] ?? '',
      shortName: json['short_name'] ?? '',
      serialNo: json['serial_no'] ?? '',
      qrCode: json['qr_code'] ?? '',
      description: json['description'] ?? '',
      longitude: json['longitude'] ?? '',
      latitude: json['latitude'] ?? '',
      mapIcon: json['map_icon'] ?? '',
      webIcon: json['web_icon'] ?? '',
      appIcon: json['app_icon'] ?? '',
      mapImage: json['map_image'] ?? '',
      categoryName: json['category_name'] ?? '',
      imagePath: json['image_path'] ?? '',
      visitedText: json['visited_text'] ?? '',
    );
  }

}
