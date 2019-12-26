import 'package:employee_personal_sheet/models/one_user_record.dart';

import 'package:json_annotation/json_annotation.dart';

part 'registry_users_records.g.dart';

@JsonSerializable(nullable: false)
class RegistryUserRecords {
  List<OneUserRecord> users;

  RegistryUserRecords({this.users});
  factory RegistryUserRecords.fromJson(Map<String, dynamic> json) => _$RegistryUserRecordsFromJson(json);
  Map<String, dynamic> toJson() => _$RegistryUserRecordsToJson(this);
}
