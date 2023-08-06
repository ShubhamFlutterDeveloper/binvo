class GetMyDetailResponse {
  bool? success;
  int? code;
  String? message;
  Body? body;

  GetMyDetailResponse({this.success, this.code, this.message, this.body});

  GetMyDetailResponse.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? role;
  int? countryCode;
  int? mobileNo;
  int? otp;
  String? isOtpVerify;
  String? isProfile;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? name;
  String? profilePic;

  Body(
      {this.sId,
        this.role,
        this.countryCode,
        this.mobileNo,
        this.otp,
        this.isOtpVerify,
        this.isProfile,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.name,
        this.profilePic});

  Body.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    role = json['role'];
    countryCode = json['country_code'];
    mobileNo = json['mobile_no'];
    otp = json['otp'];
    isOtpVerify = json['is_otp_verify'];
    isProfile = json['is_profile'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    name = json['name'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['role'] = this.role;
    data['country_code'] = this.countryCode;
    data['mobile_no'] = this.mobileNo;
    data['otp'] = this.otp;
    data['is_otp_verify'] = this.isOtpVerify;
    data['is_profile'] = this.isProfile;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['name'] = this.name;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}
