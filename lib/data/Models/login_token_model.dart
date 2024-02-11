class TokenModel {
  String? token;
  String? id;

  TokenModel({this.token, this.id});

  TokenModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['id'] = id;
    return data;
  }
}