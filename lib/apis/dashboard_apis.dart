import 'package:mahabharat_museum/utilities/utility.dart';

import '../utilities/my_consts.dart';

class DashboardApis {
  Future submitComplaint(Map<String, dynamic> data) async {
    try {
      String url = '${MyConsts.baseUrl}/feedback/add_feedback';
      return Utility().sendDioRequest(url: url, queryParameters: data);
    } catch (e) {
      Utility.printMe('Error during submitComplaint: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getLocations({
    required int languageId,
  }) async {
    try {
      // Define query parameters
      Map<String, dynamic> queryParameters = {
        'language_id': languageId.toString(),
      };
      String url = '${MyConsts.baseUrl}/locations/getLocations';
      return Utility().sendDioRequest(url: url, queryParameters: queryParameters);

    } catch (e) {
      Utility.printMe('Error during getLocations: $e');
      rethrow;
    }
  }
}
