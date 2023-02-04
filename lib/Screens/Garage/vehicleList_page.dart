import 'package:flutter/material.dart';
import 'package:service_app/constants.dart';

import 'garageContents.dart';

class VehicleListPage extends StatefulWidget {
  const VehicleListPage({Key? key}) : super(key: key);

  @override
  State<VehicleListPage> createState() => _VehicleListPageState();
}

class _VehicleListPageState extends State<VehicleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appUiLightColor,
      body: GarageContents("Vehicles", "assets/images/img2.png", "Services"),
    );
  }
}
