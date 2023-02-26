import 'dart:convert';

VehicleListData vehicleListDataFromJson(String str) =>
    VehicleListData.fromJson(json.decode(str));

String vehicleListDataToJson(VehicleListData data) =>
    json.encode(data.toJson());

class VehicleListData {
  VehicleListData({
    this.vehicles,
    this.suceess,
  });

  List<Vehicle>? vehicles;
  bool? suceess;

  factory VehicleListData.fromJson(Map<String, dynamic> json) =>
      VehicleListData(
        vehicles: List<Vehicle>.from(
            json["vehicles"].map((x) => Vehicle.fromJson(x))),
        suceess: json["suceess"],
      );

  Map<String, dynamic> toJson() => {
        "vehicles": List<dynamic>.from(vehicles!.map((x) => x.toJson())),
        "suceess": suceess,
      };
}

class Vehicle {
  Vehicle({
    this.id,
    this.vehicleNo,
    this.vehicleModel,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.serviceDate,
  });

  String? id;
  String? vehicleNo;
  String? vehicleModel;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? serviceDate;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["_id"],
        vehicleNo: json["vehicleNo"] ?? "",
        vehicleModel: json["vehicleModel"] ?? "",
        createdAt: json["createdAt"] ?? "",
        updatedAt: json["updatedAt"] ?? "",
        v: json["__v"] ?? "",
        serviceDate: json["serviceDate"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "vehicleNo": vehicleNo,
        "vehicleModel": vehicleModel,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "serviceDate": serviceDate,
      };
}
