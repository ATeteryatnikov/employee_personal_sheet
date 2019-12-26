import 'package:employee_personal_sheet/pages/flutter_map.dart';
import 'package:employee_personal_sheet/models/one_user_record.dart';
import 'package:flutter/cupertino.dart';

class UserCardPage extends StatefulWidget {
  
  final OneUserRecord user = new OneUserRecord();
  
  @override
  State<StatefulWidget> createState() {
    return _UserCardState();
  }
}

class _UserCardState extends State<UserCardPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text("Имя пользователя "+ widget.user.name),
        Text("Адрес " + widget.user.address),
        UserMap()
      ],
    );
  }
}
