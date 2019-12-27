import 'package:employee_personal_sheet/models/one_user_record.dart';
import 'package:flutter/material.dart';

class UserItemRegistry extends StatefulWidget {
  OneUserRecord userRecord;
  
  int userIndex;
  
  UserItemRegistry(this.userIndex, this.userRecord);
  
  @override
  State<StatefulWidget> createState() {
    return _UserItemRegistryPage();
  }
}

class _UserItemRegistryPage extends State<UserItemRegistry> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: RaisedButton(
        onPressed: () {Navigator.pushNamed(context, '/user_card/'+ widget.userIndex.toString());},
        child: Row(
          
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.userRecord.id),
            ),
            SizedBox(
              width: 80.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Имя: '),
                      Text('Адрес:'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(widget.userRecord.name),

                      Text(widget.userRecord.address),
                    ],
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),

    );
  }
}
