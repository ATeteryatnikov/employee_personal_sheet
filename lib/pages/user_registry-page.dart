import 'package:employee_personal_sheet/models/registry_users_records.dart';
import 'package:employee_personal_sheet/pages/authorization_page.dart';
import 'package:employee_personal_sheet/pages/flutter_map.dart';
import 'package:employee_personal_sheet/services/users/users_service.dart';
import 'package:flutter/material.dart';

class UserRegistryPage extends StatefulWidget {
  final RegistryUserRecords users = new RegistryUserRecords();

  @override
  State<StatefulWidget> createState() {
    return _UserReestState();
  }
}

class _UserReestState extends State<UserRegistryPage> {
  @override
  Widget build(BuildContext context) {
    UserService.getAllUsers()
        .then((value) => {widget.users.users = value.users});

    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Card(
                child: ListTile(
                    title: Text('Страница авторизации'),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AuthorizationPage()));
                    }),
              ),
              Card(
                  child: ListTile(
                title: Text("Карта"),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => UserMap()));
                },
              ))
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('demo'),
        ),
        body: Column(children: <Widget>[Text('1212')],));
  }

  Widget _buildUserItem(BuildContext context) {
    print(context);
    return Card(child: Text(context.toString()));
  }
}
