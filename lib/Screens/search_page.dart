import 'package:flutter/material.dart';
import 'package:service_app/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appUiLightColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
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
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: appUiContainerColor,
                ),
                child: Center(
                  child: Text(
                    "New Service",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: appUiDarkColor),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: appUiGreyColor, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vehicle No",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: appUiTextGreyColor),
                            ),
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: appUiDarkColor),
                                // controller: numberController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: "HR29AD1387",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: appUiTextGreyColor,
                                      fontWeight: FontWeight.w400),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Vehicle Number";
                                  } else if (!RegExp(
                                          r'^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$')
                                      .hasMatch(value)) {
                                    return "Enter Correct Vehicle Number";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: appUiGreyColor, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Model",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: appUiTextGreyColor),
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: appUiDarkColor),
                                  // controller: numberController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: "Spark",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: appUiTextGreyColor,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                  ),
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Please Enter Vehicle Number";
                                  //   } else if (!RegExp(
                                  //           r'^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$')
                                  //       .hasMatch(value)) {
                                  //     return "Enter Correct Vehicle Number";
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: appUiGreyColor, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Distance",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: appUiTextGreyColor),
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: appUiDarkColor),
                                  // controller: numberController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: "Km",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: appUiTextGreyColor,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                  ),
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Please Enter Vehicle Number";
                                  //   } else if (!RegExp(
                                  //           r'^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$')
                                  //       .hasMatch(value)) {
                                  //     return "Enter Correct Vehicle Number";
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: appUiGreyColor, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Service Date",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: appUiTextGreyColor),
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: appUiDarkColor),
                                  // controller: numberController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: "yyyy-mm-dd",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: appUiTextGreyColor,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                  ),
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Please Enter Vehicle Number";
                                  //   } else if (!RegExp(
                                  //           r'^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$')
                                  //       .hasMatch(value)) {
                                  //     return "Enter Correct Vehicle Number";
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: appUiGreyColor, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Service Type :",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: appUiDarkColor),
                              ),
                              Row(
                                children: [
                                  Radio(
                                      activeColor: appUiThemeColor,
                                      value: "P/S",
                                      groupValue: type,
                                      onChanged: (val) {
                                        setState(() {
                                          type = val;
                                        });
                                      }),
                                  Text(
                                    "P/S",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: appUiDarkColor),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: [
                                    Radio(
                                        activeColor: appUiThemeColor,
                                        value: "R/R",
                                        groupValue: type,
                                        onChanged: (val) {
                                          setState(() {
                                            type = val;
                                          });
                                        }),
                                    Text(
                                      "R/R",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: appUiDarkColor),
                                    )
                                  ],
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
    );
  }
}
