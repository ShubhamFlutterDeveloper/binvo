class CreateBillRequest {
  String? title;
  double? price;
  String? payableType;
  String? startDate;
  String? ends;
  String? repeat;
  String? billNotes;
  List<String>? billImages;

  CreateBillRequest(
      {this.title,
        this.price,
        this.payableType,
        this.startDate,
        this.ends,
        this.repeat,
        this.billNotes,
        this.billImages});

  CreateBillRequest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    payableType = json['payable_type'];
    startDate = json['start_date'];
    ends = json['ends'];
    repeat = json['repeat'];
    billNotes = json['billNotes'];
    billImages = json['bill_images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['payable_type'] = this.payableType;
    data['start_date'] = this.startDate;
    data['ends'] = this.ends;
    data['repeat'] = this.repeat;
    data['billNotes'] = this.billNotes;
    data['bill_images'] = this.billImages;
    return data;
  }
}
