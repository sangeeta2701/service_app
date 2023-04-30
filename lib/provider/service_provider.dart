import 'package:flutter/material.dart';
import 'package:service_app/api/api_client.dart';
import 'package:service_app/model/ServicesData.dart';

class ServiceProvider extends ChangeNotifier {
  List<MyService> _serviceList = [];
  List<MyService> get getServiceList => _serviceList;
  int get serviceCount => _serviceList.length;

  void fetchServicesList() async {
    try {
      var response = await ApiClient.getServices().fetchServiceListApi();
      ServicesData servicesData = servicesDataFromJson(response);
      _serviceList = servicesData.services!;
    } catch (e) {
      print("error no 1: $e");
    }
    notifyListeners();
  }
}
