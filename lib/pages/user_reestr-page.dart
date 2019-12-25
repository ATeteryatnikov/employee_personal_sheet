import 'package:employee_personal_sheet/pages/authorization_page.dart';
import 'package:flutter/material.dart';

class UserReestrPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserReestState();
  }
}

class _UserReestState extends State<UserReestrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
                title: Text('Страница авторизации'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              AuthorizationPage()));
                })
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('demo'),
      ),
      body: ListView(children: <Widget>[Text('123'), Text('456')]),
    );
  }
}
