import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Screens/home_page.dart';
import 'package:service_app/Screens/noVehiclefound_page.dart';
import 'package:service_app/provider/bill_provider.dart';
import 'package:service_app/provider/service_provider.dart';
import 'package:service_app/provider/vehicle_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (context) => ServiceProvider()),
        ListenableProvider(create: (context) => BillProvider()),
        ListenableProvider(create: (context) => VehicleProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
