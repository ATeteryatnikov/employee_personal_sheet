import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          Card(
            child: ListTile(
                title: Text('Страница авторизации'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                }),
          ),
          Card(
              child: ListTile(
                title: Text("Карта"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/map');
                },
              )),
          Card(
              child: ListTile(
                title: Text("Реестр"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/registry');
                },
              ))
        ],
      ),
    );;
  }
}