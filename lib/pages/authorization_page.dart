import 'package:employee_personal_sheet/widgets/authorization.dart';
import 'package:flutter/material.dart';

class AuthorizationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Авторизация'),
      ),
      body: Authorization(),
    );
  }
}
