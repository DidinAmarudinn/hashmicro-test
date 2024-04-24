import 'package:equatable/equatable.dart';

class AttendanceEntity extends Equatable {
  final int? id;
  final String? time;
  final double? latitudeMyLocation;
  final double? longitudeMyLocation;
  final double? latitudeOffice;
  final double? longitudeOffice;
  final double? distance;
  final bool? isValid;

  const AttendanceEntity({
    this.id,
    this.time,
    this.latitudeMyLocation,
    this.longitudeMyLocation,
    this.latitudeOffice,
    this.longitudeOffice,
    this.distance,
    this.isValid,
  });

  @override
  List<Object?> get props => [
        id,
        time,
        latitudeMyLocation,
        longitudeMyLocation,
        latitudeOffice,
        longitudeOffice,
        distance,
        isValid,
      ];
}
