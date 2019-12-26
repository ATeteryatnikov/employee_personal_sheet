import 'package:employee_personal_sheet/pages/authorization_page.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  
  static bool _certificateCheck(X509Certificate cert, String host, int port) =>
      true;
  
  @override
  Widget build(BuildContext context) {
    
    HttpClient client = new HttpClient();
    client.badCertificateCallback = _certificateCheck;
    
    return MaterialApp(
        home: AuthorizationPage());
  }
}
