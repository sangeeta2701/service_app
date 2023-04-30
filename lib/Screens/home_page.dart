import 'package:flutter/material.dart';
import 'package:service_app/Screens/Garage/billList_page.dart';
import 'package:service_app/Screens/Garage/servicesList_page.dart';
// import 'package:service_app/Screens/noVehiclefound_page.dart';
import 'package:service_app/Screens/search_page.dart';
import 'package:service_app/Screens/vehicle_page.dart';
import 'package:service_app/utils/constants.dart';
import 'Garage/vehicleList_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController numberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appUiLightColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: appUiThemeColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "VA",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: appUiLightColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: appUiLightColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2, //spread radius
                              blurRadius: 5, // blur radius
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Vishwakarma",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: appUiDarkColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Automobiles",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: appUiThemeColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          "Vehicle No.",
                          style: textfieldHeadingStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: TextFormField(
                          style: textfieldInputStyle,
                          controller: numberController,
                          keyboardType: TextInputType.text,
                          // textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: "HRXXXX",
                            hintStyle: hintTextStyle,
                            border: OutlineInputBorder(),

                            // suffixIcon: IconButton(
                            //     onPressed: () {
                            //       numberController.clear();
                            //     },
                            //     icon: Icon(Icons.clear)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Vehicle Number";
                            }
                            // else if (!RegExp(
                            //         r'^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$')
                            //     .hasMatch(value)) {
                            //   return "Enter Correct Vehicle Number";
                            // }
                            else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VehiclePage(vehicleNo: numberController.text),
                                ),
                              );
                            }
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => NoVehicleFoundPage(),
                            //   ),
                            // );
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
                                "Search",
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
                              color: appUiLightColor,
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: appUiGreyColor, width: 1),
                            ),
                            child: Center(
                              child: Text(
                                "New Service",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: appUiDarkColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Center(
                          child: Text(
                            "My Garage",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: appUiDarkColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VehicleListPage(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 160,
                                width: 105,
                                decoration: BoxDecoration(
                                  color: appUiContainerColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: appUiGreyColor, width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Vehicles",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: appUiDarkColor),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Image(
                                          width: 80,
                                          height: 100,
                                          image: AssetImage(
                                              "assets/images/img2.png"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ServicesListPage(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 160,
                                width: 105,
                                decoration: BoxDecoration(
                                  color: appUiContainerColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: appUiGreyColor, width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Services",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: appUiDarkColor),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Image(
                                          width: 80,
                                          height: 100,
                                          image: AssetImage(
                                              "assets/images/img3.png"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BillListPage(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 160,
                                width: 105,
                                decoration: BoxDecoration(
                                  color: appUiContainerColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: appUiGreyColor, width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Bills",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: appUiDarkColor),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Image(
                                          width: 80,
                                          height: 100,
                                          image: AssetImage(
                                              "assets/images/img4.png"),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
