class CompleteProfleRequest {
  String? name;
  String? profilePic;

  CompleteProfleRequest({this.name, this.profilePic});

  CompleteProfleRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}
