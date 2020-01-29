import 'package:employee_personal_sheet/models/user_characteristic.dart';
import 'package:json_annotation/json_annotation.dart';

part 'one_user_record.g.dart';

@JsonSerializable(nullable: false)
class OneUserRecord {
  String name;
  String id;
  String address;
  
  @JsonKey(name: "dynamicField")
  List<UserCharacteristic> dynamicFields;

  OneUserRecord({this.name, this.id, this.address, this.dynamicFields});
  factory OneUserRecord.fromJson(Map<String, dynamic> json) => _$OneUserRecordFromJson(json);
  Map<String, dynamic> toJson() => _$OneUserRecordToJson(this);
}
