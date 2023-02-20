// To parse this JSON data, do
//
//     final vehicleListData = vehicleListDataFromJson(jsonString);

import 'dart:convert';

VehicleListData vehicleListDataFromJson(String str) =>
    VehicleListData.fromJson(json.decode(str));

String vehicleListDataToJson(VehicleListData data) =>
    json.encode(data.toJson());

class VehicleListData {
  VehicleListData({
    required this.vehicles,
    required this.suceess,
  });

  List<Vehicle> vehicles;
  bool suceess;

  factory VehicleListData.fromJson(Map<String, dynamic> json) =>
      VehicleListData(
        vehicles: List<Vehicle>.from(
            json["vehicles"].map((x) => Vehicle.fromJson(x))),
        suceess: json["suceess"],
      );

  Map<String, dynamic> toJson() => {
        "vehicles": List<Vehicle>.from(vehicles.map((x) => x.toJson())),
        "suceess": suceess,
      };
}

class Vehicle {
  Vehicle({
    required this.id,
    required this.vehicleNo,
    this.vehicleModel,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.serviceDate,
  });

  String id;
  String vehicleNo;
  String? vehicleModel;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  DateTime? serviceDate;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["_id"],
        vehicleNo: json["vehicleNo"],
        vehicleModel: json["vehicleModel"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        serviceDate: json["serviceDate"] == null
            ? null
            : DateTime.parse(json["serviceDate"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "vehicleNo": vehicleNo,
        "vehicleModel": vehicleModel,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "serviceDate": serviceDate?.toIso8601String(),
      };
}
