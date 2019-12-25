import 'package:employee_personal_sheet/authorization/authorization_service.dart';
import 'package:employee_personal_sheet/authorization/credentials.dart';
import 'package:employee_personal_sheet/pages/user_reestr-page.dart';
import 'package:flutter/material.dart';

class Authorization extends StatelessWidget {
  final Credentials user = new Credentials();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Text("Авторизация"),
            TextField(
                decoration: InputDecoration(labelText: 'Логин'),
                onChanged: (String value) => {user.setLogin(value)}),
            TextField(
              decoration: InputDecoration(
                labelText: 'Пароль',
              ),
              obscureText: true,
              onChanged: (String value) => {user.setPassword(value)},
            ),
            RaisedButton(
              onPressed: () => AuthorizationService()
                  .connect(user.getLogin(), user.getPassword())
                  .then((bool value) => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    UserReestrPage()))
                      }),
              child: Text('Соединиться'),
            )
          ],
        ));
  }
}
