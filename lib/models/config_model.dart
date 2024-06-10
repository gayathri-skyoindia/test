class ConfigModel {
  List<MainMenuItems> mainMenuData = [];
  List<MainMenuItems> bottomMenuData = [];
  List<LangModelItems> langData = [];
  List<FontModelItems> fontData = [];
  LabelItem labelData = LabelItem();
  String latitude = '';
  String longitude = '';
  String facebookUrl = '';
  String twitterUrl = '';
  String youtubeUrl = '';
  String instagramUrl = '';
  String helpDesk = '';

  ConfigModel();
  ConfigModel.fromJSON(Map<String, dynamic> json) {
    mainMenuData = json["main_menu_data"] != null
        ? parseMenuData(json["main_menu_data"])
        : [];
    bottomMenuData = json["bottom_menu_data"] != null
        ? parseMenuData(json["bottom_menu_data"])
        : [];
    langData =
        json["lang_data"] != null ? parseLangData(json["lang_data"]) : [];
    fontData = json["font_mode_data"] != null
        ? parseFontData(json["font_mode_data"])
        : [];
    labelData = json["label_data"] != null
        ? LabelItem.fromJSON(json["label_data"])
        : LabelItem();
    latitude = json["latitude"] ?? '';
    longitude = json["longitude"] ?? '';
    facebookUrl = json["facebook_url"] ?? '';
    twitterUrl = json["twitter_url"] ?? '';
    youtubeUrl = json["youtube_url"] ?? '';
    instagramUrl = json["instagram_url"] ?? '';
    helpDesk = json["help-desk"] ?? '';
  }

  static List<MainMenuItems> parseMenuData(jsonData) {
    List list = jsonData;
    List<MainMenuItems> attrList =
        list.map((data) => MainMenuItems.fromJSON(data)).toList();
    return attrList;
  }

  static List<LangModelItems> parseLangData(jsonData) {
    List list = jsonData;
    List<LangModelItems> attrList =
        list.map((data) => LangModelItems.fromJSON(data)).toList();
    return attrList;
  }

  static List<FontModelItems> parseFontData(jsonData) {
    List list = jsonData;
    List<FontModelItems> attrList =
        list.map((data) => FontModelItems.fromJSON(data)).toList();
    return attrList;
  }
}

class MainMenuItems {
  int id = 0;
  int languageId = 0;
  String title = '';
  String alias = '';
  String icon = '';
  MainMenuItems();
  MainMenuItems.fromJSON(Map<String, dynamic> json) {
    id = json["menu_id"] ?? 0;
    languageId = json["language_id"] ?? 0;
    title = json["menu_name"] ?? '';
    alias = json["menu_alias"] ?? '';
    icon = json["app_menu_icon"] ?? '';
  }
}

class LangModelItems {
  int id = 0;
  String title = '';
  String code = '';
  int isDefault = 0;
  String sound = '';
  LangModelItems();
  LangModelItems.fromJSON(Map<String, dynamic> json) {
    id = json["language_id"] ?? 0;
    title = json["language_name"] ?? '';
    code = json["language_short_name"] ?? '';
    isDefault = json["is_default"] ?? 0;
    sound = json["welcome_sound"] ?? '';
  }
}

class FontModelItems {
  int id = 0;
  int languageId = 0;
  String title = '';
  String alias = '';
  FontModelItems();
  FontModelItems.fromJSON(Map<String, dynamic> json) {
    id = json["option_id"] ?? 0;
    languageId = json["language_id"] ?? 0;
    title = json["title"] ?? '';
    alias = json["short_name"] ?? '';
  }
}

class LabelItem {
  String appName = 'Mahabharata Museum';
  String welcomeTo = 'Welcome To';
  String virastEKhalsa = '';
  String signOut = '';
  String logoutMsg = '';
  String cancel = '';
  String logout = '';
  String selectLanguage = '';
  String selectLangDesc = '';
  String feedback = '';
  String enterYourName = '';
  String enterPhoneNo = '';
  String enterTitle = '';
  String enterMessage = '';
  String submit = '';
  String nameFieldValidation = '';
  String phoneFieldValidation = '';
  String titleFieldValidation = '';
  String messageFieldValidation = '';
  String login = '';
  String verifyMobileNo = '';
  String or = '';
  String nearBy = '';
  String selectNearBy = '';
  String from = '';
  String to = '';
  String currentLocation = '';
  String getDirection = '';
  String delete = '';
  String search = '';
  String enterEmailAddress = '';
  String emailFieldValidation = '';
  String emailNotValid = '';
  String sendOtp = '';
  String verifyOtp = '';
  String verifyOtpDesc = '';
  String verify = '';
  String didntRecvOtp = '';
  String resendOtp = '';
  String resendIn = '';
  String otpValidation = '';
  String home = '';
  String contentLanguage = '';
  String deleteAccount = '';
  String deleteMsg = '';
  String deleteAccountDesc = '';
  String more = '';
  String less = '';
  String skip = '';
  String skipVideo = '';
  String entryAccess = '';
  String provideNecessaryInfo = '';
  String yourName = '';
  String numberOfGuests = '';
  String enterNumberOfGuests = '';
  String history = '';
  String srNo = '';
  String name = '';
  String date = '';
  String time = '';
  String guests = '';
  String qrcodeEntryPoint = '';
  String thankYouForVisiting = '';
  String viewAll = '';
  String fillAboveInfo = '';
  String scanQR = '';
  String guestsEntered = '';
  String totalGuests = '';
  String qrExpired = '';
  String qrWrong = '';
  String thankYou = '';
  String deleteRequestDesc = '';
  String today = '';
  String weekly = '';
  String monthly = '';
  String guestUser = 'Guest User';

  LabelItem();
  LabelItem.fromJSON(Map<String, dynamic> json) {
    appName = json["app_name"] ?? '';
    welcomeTo = json["welcome_to"] ?? '';
    virastEKhalsa = json["virast_e_khalsa"] ?? '';
    signOut = json["sign_out"] ?? '';
    logoutMsg = json["logout_msg"] ?? '';
    cancel = json["cancel"] ?? '';
    logout = json["logout"] ?? '';
    selectLanguage = json["select_language"] ?? '';
    selectLangDesc = json["select_lang_desc"] ?? '';
    feedback = json["feedback"] ?? '';
    enterYourName = json["enter_your_name"] ?? '';
    enterPhoneNo = json["enter_phone_no"] ?? '';
    enterTitle = json["enter_title"] ?? '';
    enterMessage = json["enter_message"] ?? '';
    submit = json["submit"] ?? '';
    nameFieldValidation = json["name_field_validation"] ?? '';
    phoneFieldValidation = json["phone_field_validation"] ?? '';
    titleFieldValidation = json["title_field_validation"] ?? '';
    messageFieldValidation = json["message_field_validation"] ?? '';
    login = json["login"] ?? '';
    verifyMobileNo = json["verify_mobile_no"] ?? '';
    or = json["or"] ?? '';
    nearBy = json["near_by"] ?? '';
    selectNearBy = json["select_near_by"] ?? '';
    from = json["from"] ?? '';
    to = json["to"] ?? '';
    currentLocation = json["current_location"] ?? '';
    getDirection = json["get_direction"] ?? '';
    delete = json["delete"] ?? '';
    search = json["search"] ?? '';
    enterEmailAddress = json["enter_email_address"] ?? '';
    emailFieldValidation = json["email_field_validation"] ?? '';
    emailNotValid = json["email_not_valid"] ?? '';
    sendOtp = json["send_otp"] ?? '';
    verifyOtp = json["verify_otp"] ?? '';
    verifyOtpDesc = json["verify_otp_desc"] ?? '';
    verify = json["verify"] ?? '';
    didntRecvOtp = json["didnt_recv_otp"] ?? '';
    resendOtp = json["resend_otp"] ?? '';
    resendIn = json["resend_in"] ?? '';
    otpValidation = json["otp_validation"] ?? '';
    home = json["home"] ?? '';
    contentLanguage = json["content_language"] ?? '';
    deleteAccount = json["delete_account"] ?? '';
    deleteMsg = json["delete_msg"] ?? '';
    deleteAccountDesc = json["delete_account_desc"] ?? '';
    more = json["more"] ?? '';
    less = json["less"] ?? '';
    skip = json["skip"] ?? '';
    skipVideo = json["skip_video"] ?? '';
    entryAccess = json["entry_access"] ?? '';
    provideNecessaryInfo = json["provide_necessary_info"] ?? '';
    yourName = json["your_name"] ?? '';
    numberOfGuests = json["number_of_guests"] ?? '';
    enterNumberOfGuests = json["enter_number_of_guests"] ?? '';
    history = json["history"] ?? '';
    srNo = json["sr_no"] ?? '';
    name = json["name"] ?? '';
    date = json["date"] ?? '';
    time = json["time"] ?? '';
    guests = json["guests"] ?? '';
    qrcodeEntryPoint = json["qrcode_entry_point"] ?? '';
    thankYouForVisiting = json["thank_you_for_visiting"] ?? '';
    viewAll = json["view_all"] ?? '';
    fillAboveInfo = json["fill_above_info"] ?? '';
    scanQR = json["scan_qr"] ?? '';
    guestsEntered = json["guests_entered"] ?? '';
    totalGuests = json["total_guests"] ?? '';
    qrExpired = json["qr_expired"] ?? '';
    qrWrong = json["wrong_qr"] ?? '';
    thankYou = json["thank_you"] ?? '';
    deleteRequestDesc = json["delete_request_desc"] ?? '';
    today = json["today"] ?? '';
    weekly = json["weekly"] ?? '';
    monthly = json["monthly"] ?? '';
  }
}
