import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'garageContents.dart';

class BillListPage extends StatefulWidget {
  const BillListPage({Key? key}) : super(key: key);

  @override
  State<BillListPage> createState() => _BillListPageState();
}

class _BillListPageState extends State<BillListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appUiLightColor,
      body: GarageContents("Bills", "assets/images/img4.png", "Amount"),
    );
  }
}
