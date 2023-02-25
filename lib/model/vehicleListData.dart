// To parse this JSON data, do
//
//     final vehicleListData = vehicleListDataFromJson(jsonString);

import 'dart:convert';

List<VehicleListData> vehicleListDataFromJson(String str) =>
    json.decode(str) == null
        ? []
        : List<VehicleListData>.from(
            json.decode(str)!.map((x) => VehicleListData.fromJson(x)));
// VehicleListData.fromJson(json.decode(str));
String vehicleListDataToJson(List<VehicleListData?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));
// String vehicleListDataToJson(VehicleListData data) => json.encode(data.toJson());

class VehicleListData {
  VehicleListData({
    this.vehicles,
    this.suceess,
  });
  List<Map>? vehicles;
  bool? suceess;
  factory VehicleListData.fromJson(Map<dynamic, dynamic> json) =>
      VehicleListData(
        vehicles: json["vehicles"] == null
            ? []
            : List<Map>.from(json[
                "vehicles"]), // List<Vehicle>.from(//     json["vehicles"].map((x) => Vehicle.fromJson(x))),
        suceess: json["suceess"],
      );
  Map<dynamic, dynamic> toJson() => {
        "vehicles":
            vehicles, // List<Vehicle>.from(vehicles.map((x) => x.toJson())),
        "suceess": suceess,
      };
}

// class Vehicle {
//   Vehicle({
//     required this.id,
//     required this.vehicleNo,
//     this.vehicleModel,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//     this.serviceDate,
//   });
//
//   String id;
//   String vehicleNo;
//   String? vehicleModel;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;
//   DateTime? serviceDate;
//
//   factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
//         id: json["_id"],
//         vehicleNo: json["vehicleNo"],
//         vehicleModel: json["vehicleModel"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         serviceDate: json["serviceDate"] == null
//             ? null
//             : DateTime.parse(json["serviceDate"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "vehicleNo": vehicleNo,
//         "vehicleModel": vehicleModel,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//         "serviceDate": serviceDate?.toIso8601String(),
//       };
// }
