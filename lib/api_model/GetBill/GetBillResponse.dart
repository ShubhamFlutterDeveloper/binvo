class GetBillResponse {
  bool? success;
  int? code;
  String? message;
  List<Body>? body;

  GetBillResponse({this.success, this.code, this.message, this.body});

  GetBillResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Body {
  String? sId;
  String? creatorId;
  BillId? billId;
  String? billDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Body(
      {this.sId,
        this.creatorId,
        this.billId,
        this.billDate,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Body.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    creatorId = json['creator_id'];
    billId =
    json['bill_id'] != null ? new BillId.fromJson(json['bill_id']) : null;
    billDate = json['bill_date'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['creator_id'] = this.creatorId;
    if (this.billId != null) {
      data['bill_id'] = this.billId!.toJson();
    }
    data['bill_date'] = this.billDate;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class BillId {
  String? sId;
  String? creatorId;
  String? title;
  String? billNotes;
  Price? price;
  String? payableType;
  String? startDate;
  int? ends;
  int? repeat;
  String? billImages;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BillId(
      {this.sId,
        this.creatorId,
        this.title,
        this.price,
        this.billNotes,
        this.payableType,
        this.startDate,
        this.ends,
        this.repeat,
        this.billImages,
        this.createdAt,
        this.updatedAt,
        this.iV});

  BillId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    creatorId = json['creator_id'];
    title = json['title'];
    billNotes = json['billNotes'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    payableType = json['payable_type'];
    startDate = json['start_date'];
    ends = json['ends'];
    repeat = json['repeat'];
    billImages = json['bill_images'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['creator_id'] = this.creatorId;
    data['billNotes'] = this.billNotes;
    data['title'] = this.title;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['payable_type'] = this.payableType;
    data['start_date'] = this.startDate;
    data['ends'] = this.ends;
    data['repeat'] = this.repeat;
    data['bill_images'] = this.billImages;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Price {
  String? numberDecimal;

  Price({this.numberDecimal});

  Price.fromJson(Map<String, dynamic> json) {
    numberDecimal = json['$numberDecimal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberDecimal'] = this.numberDecimal;
    return data;
  }
}
