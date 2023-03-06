// To parse this JSON data, do
//
//     final servicesData = servicesDataFromJson(jsonString);

import 'dart:convert';

ServicesData servicesDataFromJson(String str) => ServicesData.fromJson(json.decode(str));

String servicesDataToJson(ServicesData data) => json.encode(data.toJson());

class ServicesData {
    ServicesData({
        this.services,
    });

    List<MyService>? services;

    factory ServicesData.fromJson(Map<String, dynamic> json) => ServicesData(
        services: List<MyService>.from(json["services"].map((x) => MyService.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
    };
}

class MyService {
    MyService({
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
    ServiceType? serviceType;
    int? vehicleKm;
    String? serviceId;
    Vehicle? vehicle;
    Bill? bill;
    int? serviceTotal;
    String? createdAt;
    String? updatedAt;
    int? v;

    factory MyService.fromJson(Map<String, dynamic> json) => MyService(
        id: json["_id"],
        customerName: json["customerName"],
        phoneNumber: json["phoneNumber"],
        serviceDate: json["serviceDate"],
        serviceType: serviceTypeValues.map[json["serviceType"]],
        vehicleKm: json["vehicleKm"],
        serviceId: json["serviceId"],
        vehicle: Vehicle.fromJson(json["vehicle"]),
        bill:json["bill"] == null?Bill():Bill.fromJson(json["bill"]),
        serviceTotal: json["serviceTotal"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "customerName": customerName,
        "phoneNumber": phoneNumber,
        "serviceDate": serviceDate,
        "serviceType": serviceTypeValues.reverse[serviceType],
        "vehicleKm": vehicleKm,
        "serviceId": serviceId,
        "vehicle": vehicle!.toJson(),
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
    });

    String? id;
    int? billNumber;
    String? billAmount;
    String? billDate;

    factory Bill.fromJson(Map<String, dynamic> json) => Bill(
        id: json["_id"],
        billNumber: json["billNumber"],
        billAmount: json["billAmount"],
        billDate: json["billDate"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "billNumber": billNumber,
        "billAmount": billAmount,
        "billDate": billDate,
    };
}

enum ServiceType { RR, PS }

final serviceTypeValues = EnumValues({
    "PS": ServiceType.PS,
    "RR": ServiceType.RR
});

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
        vehicleNo: json["vehicleNo"],
        vehicleModel: json["vehicleModel"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        serviceDate: json["serviceDate"],
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
