import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';
import 'package:logger/logger.dart'; // Import the logger package

class Utility {
  final Dio _dio = Dio();

  static printMe(object) {
    if (kDebugMode) {
      print(object);
    }
  }

  Future<Map<String, dynamic>> sendDioRequest(
      {required String url,
      required Map<String, dynamic> queryParameters}) async {
    // Define headers
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var response = await _dio.get(
      url,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
    Logger logger = Logger();

    logger.d('Request URL: $url');
    logger.d('Request params: $queryParameters');
    debugPrint('Response: ${response.data}', wrapWidth: 1024);

    // Return response data
    return response.data;
  }

  static Future<Map<String, dynamic>> sendRequest(
      http.MultipartRequest request) async {
    Logger logger = Logger();
    logger.d('Request URL: ${request.url}');
    logger.d('Request Headers: ${request.headers}');
    logger.d('Request Fields: ${request.fields}');

    // Send the request
    var response = await request.send();

    // Read the response
    String responseBody = await response.stream.bytesToString();

    // Log response details
    logger.d('Response Status Code: ${response.statusCode}');
    logger.d('Response Body: $responseBody');

    // Decode the response body and return it
    return jsonDecode(responseBody);
  }

  static getDeviceId() async {
    try {
      var deviceInfo = DeviceInfoPlugin();
      if (Platform.isIOS) {
        // import 'dart:io'
        var iosDeviceInfo = await deviceInfo.iosInfo;
        return iosDeviceInfo.identifierForVendor; // unique ID on iOS
      } else if (Platform.isAndroid) {
        var androidDeviceInfo = await deviceInfo.androidInfo;
        return androidDeviceInfo.id; // unique ID on Android
      } else {
        return DateTime.timestamp().toString();
      }
    } catch (e) {
      return DateTime.timestamp().toString();
    }
  }

  static launchURL(url) async {
    if (kDebugMode) {
      print(url);
    }
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    }
  }

  static String truncateString(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }

  static String addLineBreaks(String text, {int wordsPerLine = 2}) {
    List<String> words = text.split(' ');
    List<String> lines = [];

    for (int i = 0; i < words.length; i += wordsPerLine) {
      int end = i + wordsPerLine;
      end = end > words.length ? words.length : end;
      lines.add(words.sublist(i, end).join(' '));
    }

    return lines.join('\n');
  }

  static localAssetPath(String url) {
    if (url.isNotEmpty) {
      String modifiedUrl = url
          .replaceAll('https://varanasi.dwgroup.in/', '')
          .replaceAll('/500300', '')
          .replaceAll('JPG', 'jpg');

      return "data/$modifiedUrl";
    } else {
      return '';
    }
  }

  static localAssetUrlPath(String url) {
    if (url.isNotEmpty) {
      return "assets/data/${url.replaceAll('https://varanasi.dwgroup.in/', '')}"
          .replaceAll('JPG', 'jpg');
    } else {
      return '';
    }
  }

  static localAssetSvgPath(String url) {
    if (url.isNotEmpty) {
      return "data/${url.replaceAll('https://varanasi.dwgroup.in/', '')}"
          .replaceAll('jpg', 'svg')
          .replaceAll('png', 'svg');
    } else {
      return '';
    }
  }
}
