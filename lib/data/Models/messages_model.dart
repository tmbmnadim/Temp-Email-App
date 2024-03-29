// ignore_for_file: unnecessary_new

class MessageModel {
  String? id;
  String? type;
  String? aid;
  String? msgid;
  From? from;
  List<To>? to;
  String? subject;
  String? intro;
  bool? seen;
  bool? isDeleted;
  bool? hasAttachments;
  int? size;
  String? downloadUrl;
  String? sourceUrl;
  String? createdAt;
  String? updatedAt;
  String? accountId;

  MessageModel(
      {this.id,
        this.type,
        this.aid,
        this.msgid,
        this.from,
        this.to,
        this.subject,
        this.intro,
        this.seen,
        this.isDeleted,
        this.hasAttachments,
        this.size,
        this.downloadUrl,
        this.sourceUrl,
        this.createdAt,
        this.updatedAt,
        this.accountId});

  MessageModel.fromJson(Map<String, dynamic> json) {
    aid = json['@id'];
    type = json['@type'];
    id = json['id'];
    msgid = json['msgid'];
    from = json['from'] != null ? new From.fromJson(json['from']) : null;
    if (json['to'] != null) {
      to = <To>[];
      json['to'].forEach((v) {
        to!.add(new To.fromJson(v));
      });
    }
    subject = json['subject'];
    intro = json['intro'];
    seen = json['seen'];
    isDeleted = json['isDeleted'];
    hasAttachments = json['hasAttachments'];
    size = json['size'];
    downloadUrl = json['downloadUrl'];
    sourceUrl = json['sourceUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    accountId = json['accountId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@id'] = aid;
    data['@type'] = type;
    data['id'] = id;
    data['msgid'] = msgid;
    if (from != null) {
      data['from'] = from!.toJson();
    }
    if (to != null) {
      data['to'] = to!.map((v) => v.toJson()).toList();
    }
    data['subject'] = subject;
    data['intro'] = intro;
    data['seen'] = seen;
    data['isDeleted'] = isDeleted;
    data['hasAttachments'] = hasAttachments;
    data['size'] = size;
    data['downloadUrl'] = downloadUrl;
    data['sourceUrl'] = sourceUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['accountId'] = accountId;
    return data;
  }
}

class From {
  String? address;
  String? name;

  From({this.address, this.name});

  From.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['name'] = name;
    return data;
  }
}

class To {
  String? address;
  String? name;

  To({this.address, this.name});

  To.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['name'] = name;
    return data;
  }
}