import 'package:employee_personal_sheet/pages/user_registry-page.dart';
import 'package:flutter/material.dart';

import '../models/credentials.dart';
import '../services/authorization/authorization_service.dart';

class Authorization extends StatelessWidget {
  final Credentials user = new Credentials();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
          margin: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Text("Авторизация"),
              TextFormField(
                decoration: InputDecoration(labelText: 'Логин'),
                onSaved: (String value) => {user.login = value},
                validator: (String value) {
                  return (value.isEmpty) ? 'Пусто тут' : null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Пароль',
                ),
                obscureText: true,
                onSaved: (String value) => {user.password = value},
              ),
              RaisedButton(
                onPressed: () => authenticate(context),
                child: Text('Соединиться'),
              ),
              SizedBox(
                height: 210,
              ),
              Image.network('https://i.gifer.com/8xGs.gif'),
            ],
          )),
    );
  }

  bool _submitForm() {
    if (!_formKey.currentState.validate()) {
      return false;
    }
    _formKey.currentState.save();
    return true;
  }

  authenticate(BuildContext context) {
    if (_submitForm()) {
      AuthorizationService.connect(user.login, user.password)
          .then((bool value) => {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => UserRegistryPage()))
              });
    }
  }
}
