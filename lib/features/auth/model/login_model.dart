import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part 'login_model.g.dart';

@JsonSerializable(createToJson: false)
class UsersLoginModel extends BaseModel {
  String? token;

  UsersLoginModel({
    this.token,
  });
  @override
  fromJson(Map<String, dynamic> json) {
    return _$UsersLoginModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
