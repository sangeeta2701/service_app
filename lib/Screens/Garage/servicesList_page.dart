import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:service_app/provider/service_provider.dart';

import '../../model/ServicesData.dart';
import '../../utils/constants.dart';
import 'garageContents.dart';
import 'package:http/http.dart' as http;

class ServicesListPage extends StatefulWidget {
  const ServicesListPage({Key? key}) : super(key: key);

  @override
  State<ServicesListPage> createState() => _ServicesListPageState();
}

class _ServicesListPageState extends State<ServicesListPage> {
  @override
  void initState() {
    Provider.of<ServiceProvider>(context, listen: false).fetchServicesList();
  }

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    return Scaffold(
      backgroundColor: appUiLightColor,
      body: SafeArea(
          child: Column(children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: appUiThemeColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "VA",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: appUiLightColor),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: appUiLightColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Services",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: appUiDarkColor),
              ),
              Image(
                width: 40,
                height: 40,
                image: AssetImage("assets/images/img3.png"),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: serviceProvider.serviceCount == 0
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: 600,
                      child: ListView.builder(
                          itemCount: serviceProvider.serviceCount,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: serviceContainer(index, serviceProvider),
                            );
                          }),
                    )),
        )
      ])),
    );
  }

  Widget serviceContainer(int index, ServiceProvider provider) {
    MyService data = provider.getServiceList[index];
    DateTime? date = DateTime.tryParse(data.serviceDate!);
    return Container(
      constraints: BoxConstraints(
          // minHeight: 100,
          maxHeight: 190,
          maxWidth: double.infinity),
      decoration: BoxDecoration(
        border: Border.all(color: appUiGreyColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          // "AV356",
                          "${data.serviceId}",
                          style: blackHeadingStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                              // " P/S- ",
                              "${data.serviceType}",
                              style: blackHeadingStyle),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "${data.vehicleKm}Km",
                        style: hintTextStyle,
                      ),
                    ),
                  ],
                ),
                Text(
                  DateFormat.yMd().format(date!),
                  style: hintTextStyle,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Zee mot",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: appUiDarkColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: appUiDarkColor),
                  ),
                  Text(
                    "Rs.${data.bill?.billAmount}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: appUiDarkColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: appUiThemeColor),
                        child: Center(
                            child: Text(
                          "Bill ${data.bill?.billNumber}",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: appUiLightColor,
                              fontSize: 14),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border:
                                  Border.all(color: appUiGreyColor, width: 1),
                              color: appUiLightColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                size: 16,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Call",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: appUiTextGreyColor,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 25,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
