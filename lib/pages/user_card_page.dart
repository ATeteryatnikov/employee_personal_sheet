import 'package:employee_personal_sheet/models/one_user_record.dart';
import 'package:employee_personal_sheet/models/user_characteristic.dart';
import 'package:employee_personal_sheet/widgets/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class UserCardPage extends StatefulWidget {
  final OneUserRecord user;

  UserCardPage(this.user);

  @override
  State<StatefulWidget> createState() {
    return _UserCardState();
  }
}

class _UserCardState extends State<UserCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Карточка пользователя'),
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: <Widget>[
          _buildHeader(),
          SizedBox(height: 20,),
          _buildDynamicFields(),
          //UserMap()
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(width: 50,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            Text(
              "Имя пользователя:",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.right,
            ),
            Text(
              "Адрес:",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Text(widget.user.name),
            
            Text(widget.user.address),
          ],
        ),
      ],
    );
  }

  Widget _buildDynamicFields() {
    return Card(
      child: Column(
        children: widget.user.dynamicFields.map(_dynamicConverter).toList(),
      ),
    );
  }

  Widget _dynamicConverter(UserCharacteristic characteristic) {
    switch (characteristic.type) {
      case UserCharacteristic.LOCATION_FiELD:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                'ТИП Месторасположение',
                style: TextStyle(fontSize: 10),
              ),
              RaisedButton(
                  child: Text('Мое местоположение на карте'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/map');
                  })
            ],
          ),
        );
      case UserCharacteristic.STRING_FiELD:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                'ТИП Строка',
                style: TextStyle(fontSize: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(characteristic.field + ':'),
                  Text(characteristic.value),
                ],
              ),
            ],
          ),
        );
      case UserCharacteristic.DATE_FiELD:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                'ТИП Календарь',
                style: TextStyle(fontSize: 10),
              ),
              RaisedButton(
                child: Text(characteristic.field),
                onPressed: () {
                  DatePicker.showDatePicker(context);
                },
              ),
            ],
          ),
        );

      default:
        return Text('Неопознанное поле');
    }
  }
}
