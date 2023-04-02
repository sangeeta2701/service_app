import 'package:flutter/material.dart';
import 'package:service_app/api/api_client.dart';
import 'package:service_app/model/billListData.dart';

class BillProvider extends ChangeNotifier {
  List<Bill> _billList = [];
  List<Bill> get getBillList => _billList;
  int get billListCount => _billList.length;

  void fetchBillList() async {
    try {
      var response = await ApiClient.getServices().fetchBillListApi();
      BillListData billListData = billListDataFromJson(response);
      _billList = billListData.bills!;
    } catch (e) {
      print("error no 3: $e");
    }
    notifyListeners();
  }
}
