import 'package:json_annotation/json_annotation.dart';

part 'user_characteristic.g.dart';

@JsonSerializable(nullable: false)
class UserCharacteristic {
  String field;
  String type;
  String value;
  
  UserCharacteristic({this.field, this.type, this.value});
  factory UserCharacteristic.fromJson(Map<String, dynamic> json) => _$UserCharacteristicFromJson(json);
  Map<String, dynamic> toJson() => _$UserCharacteristicToJson(this);
}