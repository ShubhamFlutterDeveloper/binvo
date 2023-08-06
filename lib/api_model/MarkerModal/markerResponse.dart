class MarkerResponse {
  bool? success;
  int? code;
  String? message;
  List<Body>? body;

  MarkerResponse({this.success, this.code, this.message, this.body});

  MarkerResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  int? parking;
  String? latitude;
  String? longitude;
  double? distance;
  List<StationChargers>? stationChargers;
  List<StationImages>? stationImages;
  Null? favorite;
  Operator? operator;

  Body(
      {this.id,
        this.name,
        this.parking,
        this.latitude,
        this.longitude,
        this.distance,
        this.stationChargers,
        this.stationImages,
        this.favorite,
        this.operator});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parking = json['parking'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    distance = json['distance'];
    if (json['station_chargers'] != null) {
      stationChargers = <StationChargers>[];
      json['station_chargers'].forEach((v) {
        stationChargers!.add(new StationChargers.fromJson(v));
      });
    }
    if (json['station_images'] != null) {
      stationImages = <StationImages>[];
      json['station_images'].forEach((v) {
        stationImages!.add(new StationImages.fromJson(v));
      });
    }
    favorite = json['favorite'];
    operator = json['operator'] != null
        ? new Operator.fromJson(json['operator'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parking'] = this.parking;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['distance'] = this.distance;
    if (this.stationChargers != null) {
      data['station_chargers'] =
          this.stationChargers!.map((v) => v.toJson()).toList();
    }
    if (this.stationImages != null) {
      data['station_images'] =
          this.stationImages!.map((v) => v.toJson()).toList();
    }
    data['favorite'] = this.favorite;
    if (this.operator != null) {
      data['operator'] = this.operator!.toJson();
    }
    return data;
  }
}

class StationChargers {
  int? id;
  int? stationId;
  int? chargerId;
  int? quantity;
  ChargerType? chargerType;

  StationChargers(
      {this.id,
        this.stationId,
        this.chargerId,
        this.quantity,
        this.chargerType});

  StationChargers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    chargerId = json['charger_id'];
    quantity = json['quantity'];
    chargerType = json['charger_type'] != null
        ? new ChargerType.fromJson(json['charger_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['station_id'] = this.stationId;
    data['charger_id'] = this.chargerId;
    data['quantity'] = this.quantity;
    if (this.chargerType != null) {
      data['charger_type'] = this.chargerType!.toJson();
    }
    return data;
  }
}

class ChargerType {
  int? id;
  String? name;
  int? status;
  String? image;

  ChargerType({this.id, this.name, this.status, this.image});

  ChargerType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['image'] = this.image;
    return data;
  }
}

class StationImages {
  int? id;
  int? stationId;
  String? image;

  StationImages({this.id, this.stationId, this.image});

  StationImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationId = json['station_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['station_id'] = this.stationId;
    data['image'] = this.image;
    return data;
  }
}

class Operator {
  String? name;
  String? image;

  Operator({this.name, this.image});

  Operator.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
