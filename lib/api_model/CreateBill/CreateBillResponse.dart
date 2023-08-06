class CreateBillResponse {
  bool? success;
  int? code;
  String? message;
  Body? body;

  CreateBillResponse({this.success, this.code, this.message, this.body});

  CreateBillResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Body {
  String? creatorId;
  String? title;
  Price? price;
  String? payableType;
  String? startDate;
  int? ends;
  int? repeat;
  String? billImages;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Body(
      {this.creatorId,
        this.title,
        this.price,
        this.payableType,
        this.startDate,
        this.ends,
        this.repeat,
        this.billImages,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Body.fromJson(Map<String, dynamic> json) {
    creatorId = json['creator_id'];
    title = json['title'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    payableType = json['payable_type'];
    startDate = json['start_date'];
    ends = json['ends'];
    repeat = json['repeat'];
    billImages = json['bill_images'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creator_id'] = this.creatorId;
    data['title'] = this.title;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['payable_type'] = this.payableType;
    data['start_date'] = this.startDate;
    data['ends'] = this.ends;
    data['repeat'] = this.repeat;
    data['bill_images'] = this.billImages;
    data['_id'] = this.sId;
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
