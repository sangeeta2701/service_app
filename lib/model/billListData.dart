// To parse this JSON data, do
//
//     final billListData = billListDataFromJson(jsonString);

import 'dart:convert';

BillListData billListDataFromJson(String str) =>
    BillListData.fromJson(json.decode(str));

String billListDataToJson(BillListData data) => json.encode(data.toJson());

class BillListData {
  BillListData({
    this.success,
    this.bills,
  });

  bool? success;
  List<Bill>? bills;

  factory BillListData.fromJson(Map<String, dynamic> json) => BillListData(
        success: json["success"],
        bills: List<Bill>.from(json["bills"].map((x) => Bill.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "bills": List<dynamic>.from(bills!.map((x) => x.toJson())),
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
        billDate: json["billDate"],
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
