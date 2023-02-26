import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'garageContents.dart';

class ServicesListPage extends StatefulWidget {
  const ServicesListPage({Key? key}) : super(key: key);

  @override
  State<ServicesListPage> createState() => _ServicesListPageState();
}

class _ServicesListPageState extends State<ServicesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appUiLightColor,
      // body: GarageContents("Services", "assets/images/img3.png", "Services"),
    );
  }
}
