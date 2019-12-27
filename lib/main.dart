import 'dart:io';

import 'package:employee_personal_sheet/pages/authorization_page.dart';
import 'package:employee_personal_sheet/pages/flutter_map.dart';
import 'package:employee_personal_sheet/pages/user_card_page.dart';
import 'package:employee_personal_sheet/pages/user_registry-page.dart';
import 'package:employee_personal_sheet/scoped_models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  static bool _certificateCheck(X509Certificate cert, String host, int port) =>
      true;

  @override
  Widget build(BuildContext context) {
    HttpClient client = new HttpClient();
    client.badCertificateCallback = _certificateCheck;

    final UsersModel usersModel = UsersModel();
    return ScopedModel<UsersModel>(
      model: UsersModel(),
      child: MaterialApp(
          routes: {
            '/': (BuildContext context) => AuthorizationPage(),
            '/registry': (BuildContext context) => UserRegistryPage(usersModel),
            '/map': (BuildContext context) => UserMap(),
          },
          onGenerateRoute: (RouteSettings settings) {
            final List<String> pathElements = settings.name.split('/');
            if (pathElements[0] != '') {
              return null;
            }
            if (pathElements[1] == 'user_card') {
              final int index = int.parse(pathElements[2]);
              return MaterialPageRoute<bool>(
                builder: (BuildContext context) =>
                    UserCardPage(usersModel.users[index]),
              );
            }
            return null;
          }),
    );
  }
}
