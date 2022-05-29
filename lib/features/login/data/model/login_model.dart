/// message : "done"

class LoginModel {
  LoginModel({
      String? message,}){
    _message = message;
}

  LoginModel.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
LoginModel copyWith({  String? message,
}) => LoginModel(  message: message ?? _message,
);
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}