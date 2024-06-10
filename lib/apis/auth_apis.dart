import 'package:dio/dio.dart';
import '../utilities/utility.dart';

class AuthApis {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> createUserAccount({
    required String mobileNo,
    required String password,
    required String email,
    required String name,
  }) async {
    String deviceId = await Utility.getDeviceId();
    try {
      // Post data
      var response = await _dio.post(
        'registration/create_user_account',
        data: {
          'phone': mobileNo,
          'password': password,
          'email': email,
          'device_id': deviceId,
        },
      );
      return response.data;
    } catch (e) {
      // Handle error
      print('Error during createUserAccount: $e');
      throw e;
    }
  }

  Future<Map<String, dynamic>> loginUser({
    required String mobileNo,
    required String password,
    required int languageId,
  }) async {
    try {
      // Post data
      var response = await _dio.post(
        'login/user_login',
        data: {
          'user_input': mobileNo,
          'password': password,
          'language_id': languageId.toString(),
        },
      );
      return response.data;
    } catch (e) {
      // Handle error
      print('Error during loginUser: $e');
      throw e;
    }
  }
}
