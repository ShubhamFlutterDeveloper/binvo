class UploadImageResponse {
  bool? success;
  int? code;
  String? message;
  List<String>? body;

  UploadImageResponse({this.success, this.code, this.message, this.body});

  UploadImageResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    body = json['body'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    data['body'] = this.body;
    return data;
  }
}
