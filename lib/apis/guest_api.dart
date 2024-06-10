import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../services/common_service.dart';
import '../utilities/my_consts.dart';
import '../utilities/utility.dart';

class GuestApi extends GetConnect {
  final Dio _dio = Dio();

  Future updateFCMToken(String token) async {
    print(GetStorage().read('token'));
    try {
      String url = '${MyConsts.baseUrl}/EntryQrController/update_fcm';
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${GetStorage().read('token') ?? ''}',
      };
      print(jsonEncode({'fcm_token': token}));
      var response = await _dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode({'fcm_token': token}),
      );
      print(response.data);
      return response.data;
    } catch (e) {
      print('Error during updateFCMToken: $e');
      throw e;
    }
  }

  Future saveGuestInformation(String name, String guests) async {
    try {
      String url = '${MyConsts.baseUrl}/EntryQrController/store_entry_qr_data';
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${GetStorage().read('token') ?? ''}',
      };
      var response = await _dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode({'name': name, 'guests': guests}),
      );
      print(response.data);
      return response.data;
    } catch (e) {
      print('Error during saveGuestInformation: $e');
      throw e;
    }
  }

  Future deleteGuestInformation(int id) async {
    try {
      String url = '${MyConsts.baseUrl}/EntryQrController/delete_guest_request';
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${GetStorage().read('token') ?? ''}',
      };
      var response = await _dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode({'id': id.toString()}),
      );
      print(response.data);
      return response.data;
    } catch (e) {
      print('Error during deleteGuestInformation: $e');
      throw e;
    }
  }

  Future scanQR(String qr) async {
    try {
      String url = '${MyConsts.baseUrl}/EntryQrController/scanQrCode';
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${GetStorage().read('token') ?? ''}',
      };
      var response = await _dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode({'qr_value': qr}),
      );
      print(response.data);
      return response.data;
    } catch (e) {
      print('Error during scanQR: $e');
      throw e;
    }
  }

  Future fetchGuestInformationHistory(int page, int limit, bool forUser) async {
    try {
      CommonService commonService = Get.find();
      String url = '${MyConsts.baseUrl}/EntryQrController/fetch_entry_qr_data';

      Map<String, dynamic> queryParameters = {
        'page': page.toString(),
        'limit': limit.toString(),
        'type': !forUser ? "commonService.dateType.value" : '',
      };

      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      if (forUser) {
        headers['Authorization'] = 'Bearer ${GetStorage().read('token') ?? ''}';
      }

      var response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      print(response.data);
      return response.data;
    } catch (e) {
      print('Error during fetchGuestInformationHistory: $e');
      throw e;
    }
  }
}
