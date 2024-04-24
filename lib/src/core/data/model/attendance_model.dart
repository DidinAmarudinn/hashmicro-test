import 'package:hashmicro_test/src/core/domain/entity/attendance_entity.dart';

class AttendanceModel {
  int? id;
  String? time;
  double? latitudeMyLocation;
  double? longitudeMyLocation;
  double? latitudeOffice;
  double? longitudeOffice;
  double? distance;
  int? isValid;

  AttendanceModel({
    this.id,
    this.time,
    this.latitudeMyLocation,
    this.longitudeMyLocation,
    this.latitudeOffice,
    this.longitudeOffice,
    this.distance,
    this.isValid,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time,
      'latitudeMyLocation': latitudeMyLocation,
      'longitudeMyLocation': longitudeMyLocation,
      'latitudeOffice': latitudeOffice,
      'longitudeOffice': longitudeOffice,
      'distance': distance,
      'isValid': isValid,
    };
  }

  factory AttendanceModel.fromMap(Map<String, dynamic> map) {
    return AttendanceModel(
      id: map['id'],
      time: map['time'],
      latitudeMyLocation: map['latitudeMyLocation'],
      longitudeMyLocation: map['longitudeMyLocation'],
      latitudeOffice: map['latitudeOffice'],
      longitudeOffice: map['longitudeOffice'],
      distance: map['distance'],
      isValid: map['isValid'],
    );
  }

  AttendanceEntity toEntity() {
    return AttendanceEntity(
        id: id,
        time: time,
        latitudeMyLocation: latitudeMyLocation,
        longitudeMyLocation: longitudeMyLocation,
        latitudeOffice: latitudeOffice,
        longitudeOffice: longitudeOffice,
        distance: distance,
        isValid: isValid == 1);
  }
}
