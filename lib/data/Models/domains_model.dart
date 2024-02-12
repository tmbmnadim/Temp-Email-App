class DomainsModel {
  String? id;
  String? type;
  String? aid;
  String? domain;
  bool? isActive;
  bool? isPrivate;
  String? createdAt;
  String? updatedAt;

  DomainsModel(
      {this.id,
        this.type,
        this.aid,
        this.domain,
        this.isActive,
        this.isPrivate,
        this.createdAt,
        this.updatedAt});

  DomainsModel.fromJson(Map<String, dynamic> json) {
    aid = json['@id'];
    type = json['@type'];
    id = json['id'];
    domain = json['domain'];
    isActive = json['isActive'];
    isPrivate = json['isPrivate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@id'] = aid;
    data['@type'] = type;
    data['id'] = id;
    data['domain'] = domain;
    data['isActive'] = isActive;
    data['isPrivate'] = isPrivate;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}