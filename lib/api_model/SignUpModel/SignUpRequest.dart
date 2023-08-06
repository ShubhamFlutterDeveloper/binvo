class SignUpRequest {
  int? countryCode;
  String? mobileNo;

  SignUpRequest({this.countryCode, this.mobileNo});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    mobileNo = json['mobile_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['mobile_no'] = this.mobileNo;
    return data;
  }
}
