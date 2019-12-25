import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class AuthorizationService {
  
  static String login;
  static String password;
  
  Future<bool> connect(String login,String password) {
    print('[connect: ] connection with $login, $password');
    
    // String url = "http://10.0.2.2:57773/csp/sou/rest/users";
    String url = "http://10.0.2.2:57773/csp/sou/rest/login";
    
    Map<String, String> map = {"Authorization": getAuthorizationHeader(login, password)};

    return http.get(url, headers: map).then(checkResponse);
  }
  
  String getAuthorizationHeader(String login,String password) {
    return 'basic ' + convert.base64Encode(convert.utf8.encode('$login:$password'));
  }

  bool checkResponse(http.Response response) {
    print(response.body);
    bool isSuccess = response.statusCode.toString() == '200';
    isSuccess ? print("Соединение успешно") : print("Не удалось авторизоваться");
    return isSuccess;
  }
}
