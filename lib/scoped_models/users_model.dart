import 'package:employee_personal_sheet/models/one_user_record.dart';
import 'package:employee_personal_sheet/models/registry_users_records.dart';
import 'package:scoped_model/scoped_model.dart';

class UsersModel extends Model {
  RegistryUserRecords records = new RegistryUserRecords(users: List<OneUserRecord>());
  
  List<OneUserRecord> get users {
    return List.from(records.users);
  }
  
  void update(List<OneUserRecord> users) {
    print('update!');
    records = RegistryUserRecords(users: users) ;
    notifyListeners();
  }
}
