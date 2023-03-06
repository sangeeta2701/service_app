// To parse this JSON data, do
//
//     final vehiclesServiceListData = vehiclesServiceListDataFromJson(jsonString);

import 'dart:convert';

VehiclesServiceListData vehiclesServiceListDataFromJson(String str) => VehiclesServiceListData.fromJson(json.decode(str));

String vehiclesServiceListDataToJson(VehiclesServiceListData data) => json.encode(data.toJson());

class VehiclesServiceListData {
    VehiclesServiceListData({
        this.success,
        this.vehicle,
        this.services,
    });

    bool? success;
    Vehicle? vehicle;
    List<Service>? services;

    factory VehiclesServiceListData.fromJson(Map<String, dynamic> json) => VehiclesServiceListData(
        success: json["success"],
        vehicle: Vehicle.fromJson(json["vehicle"]),
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "vehicle": vehicle!.toJson(),
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
    };
}

class Service {
    Service({
        this.id,
        this.customerName,
        this.phoneNumber,
        this.serviceDate,
        this.serviceType,
        this.vehicleKm,
        this.serviceId,
        this.vehicle,
        this.bill,
        this.serviceTotal,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? customerName;
    int? phoneNumber;
    String? serviceDate;
    String? serviceType;
    int? vehicleKm;
    String? serviceId;
    String? vehicle;
    Bill? bill;
    int? serviceTotal;
    String? createdAt;
    String? updatedAt;
    int? v;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["_id"],
        customerName: json["customerName"],
        phoneNumber: json["phoneNumber"],
        serviceDate: json["serviceDate"],
        serviceType: json["serviceType"],
        vehicleKm: json["vehicleKm"],
        serviceId: json["serviceId"],
        vehicle: json["vehicle"],
        bill: json["bill"] == null?Bill():Bill.fromJson(json["bill"]),
        serviceTotal: json["serviceTotal"],
        createdAt:json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "customerName": customerName,
        "phoneNumber": phoneNumber,
        "serviceDate": serviceDate,
        "serviceType": serviceType,
        "vehicleKm": vehicleKm,
        "serviceId": serviceId,
        "vehicle": vehicle,
        "bill": bill!.toJson(),
        "serviceTotal": serviceTotal,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}

class Bill {
    Bill({
        this.id,
        this.billNumber,
        this.billAmount,
        this.billDate,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    int? billNumber;
    String? billAmount;
    String? billDate;
    String? createdAt;
    String? updatedAt;
    int? v;

    factory Bill.fromJson(Map<String, dynamic> json) => Bill(
        id: json["_id"],
        billNumber: json["billNumber"],
        billAmount: json["billAmount"],
        billDate:json["billDate"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "billNumber": billNumber,
        "billAmount": billAmount,
        "billDate": billDate,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
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
    });

    String? id;
    String? vehicleNo;
    String? vehicleModel;
    String? createdAt;
    String? updatedAt;
    int? v;

    factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["_id"],
        vehicleNo: json["vehicleNo"],
        vehicleModel: json["vehicleModel"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "vehicleNo": vehicleNo,
        "vehicleModel": vehicleModel,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}
