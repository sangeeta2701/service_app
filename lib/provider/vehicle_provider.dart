import 'package:flutter/material.dart';
import 'package:service_app/api/api_client.dart';
import 'package:service_app/model/vehicleListData.dart';

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
}
