import 'package:employee_personal_sheet/pages/authorization_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AuthorizationPage());
  }
}
