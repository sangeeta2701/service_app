import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Screens/vehicle_page.dart';
import 'package:service_app/provider/vehicle_provider.dart';
import 'package:service_app/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../../model/vehicleListData.dart';
import 'garageContents.dart';

class VehicleListPage extends StatefulWidget {
  const VehicleListPage({Key? key}) : super(key: key);

  @override
  State<VehicleListPage> createState() => _VehicleListPageState();
}

class _VehicleListPageState extends State<VehicleListPage> {
  @override
  void initState() {
    Provider.of<VehicleProvider>(context, listen: false).fetchVehicleList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vehicleProvider = Provider.of<VehicleProvider>(context);
    return Scaffold(
      backgroundColor: appUiLightColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GarageContents(
                  "Vehicles", "assets/images/img2.png", "Number", "Model"),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: vehicleProvider.vehicleListCount == 0
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        height: 530,
                        child: ListView.builder(
                            itemCount: vehicleProvider.vehicleListCount,
                            itemBuilder: (context, index) {
                              Vehicle data =
                                  vehicleProvider.getVehicleList[index];
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VehiclePage(
                                            vehicleNo: data.vehicleNo!))),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${data.vehicleNo}",
                                            style: textfieldInputStyle,
                                          ),
                                          Text(
                                            "${data.vehicleModel}",
                                            style: textfieldInputStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
