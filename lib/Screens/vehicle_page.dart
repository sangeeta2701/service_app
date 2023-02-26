import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:service_app/Screens/search_page.dart';
import 'package:service_app/model/vehicleServiceListData.dart';
import 'package:service_app/utils/constants.dart';
import 'package:http/http.dart' as http;

class VehiclePage extends StatefulWidget {
  const VehiclePage({Key? key, required this.num}) : super(key: key);
  final String num;

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  @override
  void initState() {
    _getVehicleServicingList();
    super.initState();
  }

  List<Vehicle> vehicleList = [];
  List<Service> serviceList = [];
  List<Bill> billList = [];

  Future _getVehicleServicingList() async {
    var apiUrl = "http://192.168.1.12:3000/api/services/";
    apiUrl = "$apiUrl?vehicleNo=${widget.num}";
    final response = await http.get(
      Uri.parse(apiUrl),
    );
    var result = response.body.toString();

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var _vehicle = vehicleServiceListDataFromJson(result);
      var _service = vehicleServiceListDataFromJson(result);
      var _bill = vehicleServiceListDataFromJson(result);

      print(_vehicle);
      setState(() {
        vehicleList = _vehicle.vehicle as List<Vehicle>;
        serviceList = _service.services!;
        billList = _bill.bills as List<Bill>;
      });
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("No Vehicles Found"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appUiLightColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: appUiThemeColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "VA",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: appUiLightColor),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: appUiLightColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              child: Column(
                children: [
                  Image(
                    image: AssetImage("assets/images/img1.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: appUiDarkColor, width: 4),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.num,
                            // "HR29AD1387",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: appUiDarkColor,
                            ),
                          ),
                          Text(
                            "${vehicleList[0].vehicleModel}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: appUiDarkColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: appUiThemeColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "New Service  +",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: appUiLightColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Text(
                        "Services",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: appUiDarkColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      constraints: BoxConstraints(
                          // minHeight: 100,
                          maxHeight: 150,
                          maxWidth: double.infinity),
                      decoration: BoxDecoration(
                        border: Border.all(color: appUiGreyColor, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${serviceList[0].serviceId}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: appUiDarkColor),
                                    ),
                                    Text(
                                      " P/S- ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: appUiDarkColor),
                                    ),
                                    Text(
                                      "${serviceList[0].vehicleKm}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: appUiTextGreyColor),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${serviceList[0].serviceDate}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: appUiTextGreyColor),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Zee mot",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: appUiDarkColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Amount",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: appUiDarkColor),
                                  ),
                                  Text(
                                    "Rs.${billList[0].billAmount}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: appUiDarkColor),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: appUiThemeColor),
                                        child: Center(
                                            child: Text(
                                          "${billList[0].billNumber}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: appUiLightColor,
                                              fontSize: 14),
                                        )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          height: 30,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border: Border.all(
                                                  color: appUiGreyColor,
                                                  width: 1),
                                              color: appUiLightColor),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.call,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "Call",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: appUiTextGreyColor,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                        size: 25,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
