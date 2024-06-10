import 'dart:convert';

List<Location> locationFromJson(String str) =>
    List<Location>.from(json.decode(str).map((x) => Location.fromJson(x)));

String locationToJson(List<Location> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Location {
  Location({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  int? code;
  String? message;
  List<LocationData>? data;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: List<LocationData>.from(
        json["data"].map((x) => LocationData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class LocationData {
  LocationData({
    this.locationId,
    this.languageId,
    this.locationName,
    this.shortName,
    this.serialNo,
    this.qrCode,
    this.mobileNo,
    this.address,
    this.description,
    this.textToSpeechDesc,
    this.shortDescription,
    this.cityId,
    this.gpsLocationEnabOnOff,
    this.gpsLocationNotiOnOff,
    this.pinCode,
    this.referenceLinks,
    this.estimatedVisitTime,
    this.websiteUrl,
    this.entryTicket,
    this.ticketFeeDetails,
    this.longitude,
    this.latitude,
    this.mapIcon,
    this.webIcon,
    this.appIcon,
    this.mapImage,
    this.qrImage,
    this.qrType,
    this.qrAudio,
    this.qrRedirection,
    this.wifiAvailability,
    this.headphnAvailability,
    this.workingHours,
    this.rulesRegulations,
    this.locationReview,
    this.surveyorRemarks,
    this.createdBy,
    this.modifiedBy,
    this.isActive,
    this.type,
    this.eventStartDate,
    this.eventEndDate,
    this.organizedBy,
    this.modifiedOn,
    this.createdOn,
    this.categoryName,
    this.categoryDescription,
    this.categoryId,
    this.categoryTypeId,
    this.categoryType,
    this.imagePath,
    this.imagePath500300,
    this.imagePath532460,
    this.imagePath1600740,
    this.wifiAvailText,
    this.visitedText,
    this.description2,
    this.shareTitle,
    this.isPhotoContentAvail,
    this.isVideoContentAvail,
    this.is360ContentAvail,
    this.photoIconText,
    this.videoIconText,
    this.video360IconText,
  });

  int? locationId;
  int? languageId;
  String? locationName;
  String? shortName;
  int? serialNo;
  int? qrCode;
  dynamic? mobileNo;
  String? address;
  String? description;
  dynamic? textToSpeechDesc;
  String? shortDescription;
  dynamic? cityId;
  int? gpsLocationEnabOnOff;
  int? gpsLocationNotiOnOff;
  dynamic? pinCode;
  dynamic? referenceLinks;
  dynamic? estimatedVisitTime;
  dynamic? websiteUrl;
  String? entryTicket;
  List<TicketFeeDetail>? ticketFeeDetails;
  int? longitude;
  int? latitude;
  String? mapIcon;
  String? webIcon;
  String? appIcon;
  String? mapImage;
  dynamic? qrImage;
  dynamic? qrType;
  dynamic? qrAudio;
  dynamic? qrRedirection;
  dynamic? wifiAvailability;
  String? headphnAvailability;
  List<WorkingHour>? workingHours;
  String? rulesRegulations;
  dynamic? locationReview;
  dynamic? surveyorRemarks;
  int? createdBy;
  dynamic? modifiedBy;
  int? isActive;
  String? type;
  dynamic? eventStartDate;
  dynamic? eventEndDate;
  dynamic? organizedBy;
  DateTime? modifiedOn;
  DateTime? createdOn;
  String? categoryName;
  String? categoryDescription;
  int? categoryId;
  int? categoryTypeId;
  String? categoryType;
  String? imagePath;
  String? imagePath500300;
  String? imagePath532460;
  String? imagePath1600740;
  String? wifiAvailText;
  String? visitedText;
  String? description2;
  String? shareTitle;
  int? isPhotoContentAvail;
  int? isVideoContentAvail;
  int? is360ContentAvail;
  dynamic? photoIconText;
  dynamic? videoIconText;
  dynamic? video360IconText;

  factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
    locationId: json["location_id"],
    languageId: json["language_id"],
    locationName: json["location_name"],
    shortName: json["short_name"],
    serialNo: json["serial_no"],
    qrCode: json["qr_code"],
    mobileNo: json["mobile_no"],
    address: json["address"],
    description: json["description"],
    textToSpeechDesc: json["text_to_speech_desc"],
    shortDescription: json["short_description"],
    cityId: json["city_id"],
    gpsLocationEnabOnOff: json["gps_location_enab_on_off"],
    gpsLocationNotiOnOff: json["gps_location_noti_on_off"],
    pinCode: json["pin_code"],
    referenceLinks: json["reference_links"],
    estimatedVisitTime: json["estimated_visit_time"],
    websiteUrl: json["website_url"],
    entryTicket: json["entry_ticket"],
    ticketFeeDetails: List<TicketFeeDetail>.from(
        json["ticket_fee_details"].map((x) => TicketFeeDetail.fromJson(x))),
    longitude: json["longitude"],
    latitude: json["latitude"],
    mapIcon: json["map_icon"],
    webIcon: json["web_icon"],
    appIcon: json["app_icon"],
    mapImage: json["map_image"],
    qrImage: json["qr_image"],
    qrType: json["qr_type"],
    qrAudio: json["qr_audio"],
    qrRedirection: json["qr_redirection"],
    wifiAvailability: json["wifi_availability"],
    headphnAvailability: json["headphn_availability"],
    workingHours: List<WorkingHour>.from(
        json["working_hours"].map((x) => WorkingHour.fromJson(x))),
    rulesRegulations: json["rules_regulations"],
    locationReview: json["location_review"],
    surveyorRemarks: json["surveyor_remarks"],
    createdBy: json["created_by"],
    modifiedBy: json["modified_by"],
    isActive: json["is_active"],
    type: json["type"],
    eventStartDate: json["event_start_date"],
    eventEndDate: json["event_end_date"],
    organizedBy: json["organized_by"],
    modifiedOn: DateTime.parse(json["modified_on"]),
    createdOn: DateTime.parse(json["created_on"]),
    categoryName: json["category_name"],
    categoryDescription: json["category_description"],
    categoryId: json["category_id"],
    categoryTypeId: json["category_type_id"],
    categoryType: json["category_type"],
    imagePath: json["image_path"],
    imagePath500300: json["image_path_500_300"],
    imagePath532460: json["image_path_532_460"],
    imagePath1600740: json["image_path_1600_740"],
    wifiAvailText: json["wifi_avail_text"],
    visitedText: json["visited_text"],
    description2: json["description_2"],
    shareTitle: json["share_title"],
    isPhotoContentAvail: json["is_photo_content_avail"],
    isVideoContentAvail: json["is_video_content_avail"],
    is360ContentAvail: json["is_360_content_avail"],
    photoIconText: json["photo_icon_text"],
    videoIconText: json["video_icon_text"],
    video360IconText: json["video_360_icon_text"],
  );

  Map<String, dynamic> toJson() => {
    "location_id": locationId,
    "language_id": languageId,
    "location_name": locationName,
    "short_name": shortName,
    "serial_no": serialNo,
    "qr_code": qrCode,
    "mobile_no": mobileNo,
    "address": address,
    "description": description,
    "text_to_speech_desc": textToSpeechDesc,
    "short_description": shortDescription,
    "city_id": cityId,
    "gps_location_enab_on_off": gpsLocationEnabOnOff,
    "gps_location_noti_on_off": gpsLocationNotiOnOff,
    "pin_code": pinCode,
    "reference_links": referenceLinks,
    "estimated_visit_time": estimatedVisitTime,
    "website_url": websiteUrl,
    "entry_ticket": entryTicket,
    "ticket_fee_details":
    List<dynamic>.from(ticketFeeDetails!.map((x) => x.toJson())),
    "longitude": longitude,
    "latitude": latitude,
    "map_icon": mapIcon,
    "web_icon": webIcon,
    "app_icon": appIcon,
    "map_image": mapImage,
    "qr_image": qrImage,
    "qr_type": qrType,
    "qr_audio": qrAudio,
    "qr_redirection": qrRedirection,
    "wifi_availability": wifiAvailability,
    "headphn_availability": headphnAvailability,
    "working_hours":
    List<dynamic>.from(workingHours!.map((x) => x.toJson())),
    "rules_regulations": rulesRegulations,
    "location_review": locationReview,
    "surveyor_remarks": surveyorRemarks,
    "created_by": createdBy,
    "modified_by": modifiedBy,
    "is_active": isActive,
    "type": type,
    "event_start_date": eventStartDate,
    "event_end_date": eventEndDate,
    "organized_by": organizedBy,
    "modified_on": modifiedOn!.toIso8601String(),
    "created_on": createdOn!.toIso8601String(),
    "category_name": categoryName,
    "category_description": categoryDescription,
    "category_id": categoryId,
    "category_type_id": categoryTypeId,
    "category_type": categoryType,
    "image_path": imagePath,
    "image_path_500_300": imagePath500300,
    "image_path_532_460": imagePath532460,
    "image_path_1600_740": imagePath1600740,
    "wifi_avail_text": wifiAvailText,
    "visited_text": visitedText,
    "description_2": description2,
    "share_title": shareTitle,
    "is_photo_content_avail": isPhotoContentAvail,
    "is_video_content_avail": isVideoContentAvail,
    "is_360_content_avail": is360ContentAvail,
    "photo_icon_text": photoIconText,
    "video_icon_text": videoIconText,
    "video_360_icon_text": video360IconText,
  };
}

class TicketFeeDetail {
  TicketFeeDetail({
    this.ticketType,
    this.ticketName,
    this.ticketPrice,
  });

  String? ticketType;
  String? ticketName;
  int? ticketPrice;

  factory TicketFeeDetail.fromJson(Map<String, dynamic> json) =>
      TicketFeeDetail(
        ticketType: json["ticket_type"],
        ticketName: json["ticket_name"],
        ticketPrice: json["ticket_price"],
      );

  Map<String, dynamic> toJson() => {
    "ticket_type": ticketType,
    "ticket_name": ticketName,
    "ticket_price": ticketPrice,
  };
}

class WorkingHour {
  WorkingHour({
    this.day,
    this.openingTime,
    this.closingTime,
  });

  String? day;
  String? openingTime;
  String? closingTime;

  factory WorkingHour.fromJson(Map<String, dynamic> json) => WorkingHour(
    day: json["day"],
    openingTime: json["opening_time"],
    closingTime: json["closing_time"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "opening_time": openingTime,
    "closing_time": closingTime,
  };
}
