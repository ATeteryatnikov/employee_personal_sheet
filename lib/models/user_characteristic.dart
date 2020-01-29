import 'package:json_annotation/json_annotation.dart';

part 'user_characteristic.g.dart';

@JsonSerializable(nullable: false)
class UserCharacteristic {
  
  static const String STRING_FiELD = 'String';
  static const String DATE_FiELD = 'DateTime';
  static const String LOCATION_FiELD = 'Location';
  
  String field;
  String type;
  String value;
  
  UserCharacteristic({this.field, this.type, this.value});
  factory UserCharacteristic.fromJson(Map<String, dynamic> json) => _$UserCharacteristicFromJson(json);
  Map<String, dynamic> toJson() => _$UserCharacteristicToJson(this);
}