import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:service_app/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  FocusNode? focusNode1;
  FocusNode? focusNode2;
  FocusNode? focusNode3;
  FocusNode? focusNode4;
  FocusNode? focusNode5;
  FocusNode? focusNode6;
  FocusNode? focusNode7;
  FocusNode? focusNode8;
  String? type;

  @override
  void initState() {
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    focusNode4 = FocusNode();
    focusNode5 = FocusNode();
    focusNode6 = FocusNode();
    focusNode7 = FocusNode();
    focusNode8 = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focusNode1!.dispose();
    focusNode2!.dispose();
    focusNode3!.dispose();
    focusNode4!.dispose();
    focusNode5!.dispose();
    focusNode6!.dispose();
    focusNode7!.dispose();
    focusNode8!.dispose();

    super.dispose();
  }

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vehicle No",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: appUiTextGreyColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
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
                                border: OutlineInputBorder(),
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
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
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
                                  border: OutlineInputBorder(),
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: appUiDarkColor),
                                // controller: numberController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: "Km",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: appUiTextGreyColor,
                                      fontWeight: FontWeight.w400),
                                  border: OutlineInputBorder(),
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: appUiDarkColor),
                                // controller: numberController,
                                keyboardType: TextInputType.datetime,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: "yyyy-mm-dd",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: appUiTextGreyColor,
                                      fontWeight: FontWeight.w400),
                                  border: OutlineInputBorder(),
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        height: 50,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bill No",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: appUiTextGreyColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: appUiDarkColor),
                                // controller: numberController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: "123",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: appUiTextGreyColor,
                                      fontWeight: FontWeight.w400),
                                  border: OutlineInputBorder(),
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Amount",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: appUiTextGreyColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: appUiDarkColor),
                                  // controller: numberController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: "4000",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: appUiTextGreyColor,
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 80),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(8),
                        //   border: Border.all(color: appUiGreyColor, width: 1),
                        // ),
                        child: DottedBorder(
                          strokeWidth: 2,
                          color: appUiGreyColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Upload Bill",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: appUiTextGreyColor),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Icon(
                                    Icons.file_upload_outlined,
                                    color: appUiTextGreyColor,
                                    size: 18,
                                  ),
                                )
                              ],
                            ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 60,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: appUiThemeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Add Service  +",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: appUiLightColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
