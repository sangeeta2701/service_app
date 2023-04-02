import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:service_app/api/api_client.dart';
import 'package:service_app/model/vehicleListData.dart';
import 'package:service_app/model/vehiclesServiceListData.dart' as vsd;

class VehicleProvider extends ChangeNotifier {
  List<Vehicle> _vehicleList = [];
  List<Vehicle> get getVehicleList => _vehicleList;
  int get vehicleListCount => _vehicleList.length;

  void fetchVehicleList() async {
    try {
      var response = await ApiClient.getServices().fetchVehicleListApi();
      VehicleListData vehicleListData = vehicleListDataFromJson(response);
      _vehicleList = vehicleListData.vehicles!;
    } catch (e) {
      print("error no 2: $e");
    }
    notifyListeners();
  }

  vsd.Vehicle _vehicle = vsd.Vehicle();
  vsd.Vehicle get getVehicle => _vehicle;
  List<vsd.Service> _services = [];
  List<vsd.Service> get getServices => _services;
  int get serviceCount => _services.length;

  bool _isVehicleFound = true;
  bool get isVehicleFound => _isVehicleFound;

  bool _isVehicleServiceLoader = false;
  bool get isVehicleServiceLoader => _isVehicleServiceLoader;
  void fetchVehicleServices(String vehicleNo) async {
    _isVehicleServiceLoader = true;
    try {
      var response =
          await ApiClient.getServices().fetchVehicleServices(vehicleNo);
      Map<String, dynamic> map = jsonDecode(response);
      bool success = map["success"];
      if (success) {
        vsd.VehiclesServiceListData vehiclesServiceListData =
            vsd.vehiclesServiceListDataFromJson(response);
        _vehicle = vehiclesServiceListData.vehicle!;
        _services = vehiclesServiceListData.services!;
        _isVehicleServiceLoader = false;
        _isVehicleFound = true;
      } else {
        _isVehicleServiceLoader = false;
        _isVehicleFound = false;
      }
    } catch (e) {
      print("error no 5: $e");
      _isVehicleServiceLoader = false;
    }
    notifyListeners();
  }
}
