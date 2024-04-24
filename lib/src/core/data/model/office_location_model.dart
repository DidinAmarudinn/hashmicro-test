class OfficeLocationModel {
  final String officeName;
  final double lat;
  final double long;

  OfficeLocationModel(
      {required this.officeName, required this.lat, required this.long});

  Map<String, dynamic> toJson() {
    return {
      'officeName': officeName,
      'lat': lat,
      'long': long,
    };
  }

  factory OfficeLocationModel.fromJson(Map<String, dynamic> json) {
    return OfficeLocationModel(
      officeName: json['officeName'],
      lat: json['lat'],
      long: json['long'],
    );
  }
}
