import 'dart:ffi';

class CordenadaModel {
  String id = '';
  Double latitude = 0 as Double;
  Double longitude = 0 as Double;

  CordenadaModel({
    required this.id,
    required this.latitude,
    required this.longitude,
  });

  CordenadaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
