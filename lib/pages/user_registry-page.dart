import 'package:employee_personal_sheet/models/one_user_record.dart';
import 'package:employee_personal_sheet/scoped_models/users_model.dart';
import 'package:employee_personal_sheet/services/users/users_service.dart';
import 'package:employee_personal_sheet/widgets/app_drawer.dart';
import 'package:employee_personal_sheet/widgets/user_item_registry.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserRegistryPage extends StatefulWidget {
  final UsersModel usersModel;

  UserRegistryPage(this.usersModel);

  @override
  State<StatefulWidget> createState() {
    return _UserRegistryPageState();
  }
}

class _UserRegistryPageState extends State<UserRegistryPage> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Реестр'),
      ),
      drawer: AppDrawer(),
      body: ScopedModelDescendant<UsersModel>(
        builder: (BuildContext context, Widget child, UsersModel model) {
          return _buildList(users: widget.usersModel.users);
        },
      ),
    );
  }

  @override
  void initState() {
    UserService.getAllUsers().then(
            (usersRegistry) => {widget.usersModel.update(usersRegistry.users)});
    
    super.initState();
  }

  Widget _buildList({List<OneUserRecord> users = const []}) {
    if (users == null || users.length <= 0) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text('Нет пользователей!'),
            SizedBox(
              height: 400,
            ),
            Image.network(
                'https://pngicon.ru/file/uploads/ljagushonok-pepe.png', width: 100, height: 100,),
          ],
        ),
      );
    }
    return ListView(
        children: users
            .map((OneUserRecord element) => UserItemRegistry(users.indexOf(element),element))
            .toList());
  }
}
