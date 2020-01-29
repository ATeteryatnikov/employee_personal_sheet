import 'dart:convert' as convert;
import 'package:employee_personal_sheet/models/registry_users_records.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<RegistryUserRecords> getAllUsers() async {
    print('[UserService: ] users requested');

    String url = "https://resttest-d2780.firebaseio.com/main.json";

    try {
      http.Response response = await http.get(url);
      checkResponse(response);
      return RegistryUserRecords.fromJson(convert.jsonDecode(response.body));
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  static checkResponse(http.Response response) {
    print('code = ' + response.statusCode.toString());
    print('body: ' + response.body);
  }
}
