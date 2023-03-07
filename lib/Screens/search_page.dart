import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:service_app/utils/constants.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedValue = "type";

  TextEditingController dateController = TextEditingController();
  TextEditingController vNumberController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  TextEditingController billNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  //add services

  Future<void> _addService() async {
    // const apiUrl = "http://192.168.1.12:3000/api/vehicles/addService";
    const apiUrl = "https://va-api-render.onrender.com/api/vehicles/addService";
    Map<String, dynamic> body = {
      "vehicleNo": vNumberController.text,
      "vehicleModel": modelController.text,
      "customerName": nameController.text,
      "phoneNumber": phoneNumberController.text,
      "serviceDate": dateController.text,
      "serviceType": selectedValue,
      "vehicleKm": distanceController.text,
      "billNumber": billNumberController.text,
      "billAmount": amountController.text,
    };
    final response = await http.post(
      Uri.parse(apiUrl),
      body: (body),
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: appUiThemeColor,
          content: Text("Service Added Successfully!!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: appUiThemeColor,
          content: Text("Something went Wrong")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appUiLightColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
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
                            style: mainHeadingStyle,
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
                    child: Text("New Service", style: blackHeadingStyle),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 12),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vehicle Number",
                              style: textfieldHeadingStyle,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TextFormField(
                                style: textfieldInputStyle,
                                controller: vNumberController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: "Enter Vehicle Number",
                                  hintStyle: hintTextStyle,
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Vehicle Number";
                                  } else {
                                    return null;
                                  }
                                },
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
                                style: textfieldHeadingStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextFormField(
                                  style: textfieldInputStyle,
                                  controller: modelController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: "Enter Vehicle Model",
                                    hintStyle: hintTextStyle,
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter Model";
                                    } else {
                                      return null;
                                    }
                                  },
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
                                style: textfieldHeadingStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextFormField(
                                  style: textfieldInputStyle,
                                  controller: distanceController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: "Enter Distance(Km)",
                                    hintStyle: hintTextStyle,
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter Distance";
                                    } else {
                                      return null;
                                    }
                                  },
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
                                style: textfieldHeadingStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextFormField(
                                  controller: dateController,
                                  style: textfieldInputStyle,
                                  keyboardType: TextInputType.datetime,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: "yyyy-mm-dd",
                                    hintStyle: hintTextStyle,
                                    border: OutlineInputBorder(),
                                  ),
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2100));

                                    if (pickedDate != null) {
                                      print(pickedDate);
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(formattedDate);
                                      setState(() {
                                        dateController.text = formattedDate;
                                      });
                                    } else {}
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter Service Date Number";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Container(
                            // height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: appUiGreyColor, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Service Type :",
                                    style: textfieldHeadingStyle,
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          activeColor: appUiThemeColor,
                                          value: "P/S",
                                          groupValue: selectedValue,
                                          onChanged: (val) {
                                            setState(() {
                                              selectedValue = "P/S";
                                            });
                                          }),
                                      Text(
                                        "P/S",
                                        style: textfieldInputStyle,
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
                                            groupValue: selectedValue,
                                            onChanged: (val) {
                                              setState(() {
                                                selectedValue = "R/R";
                                              });
                                            }),
                                        Text(
                                          "R/R",
                                          style: textfieldInputStyle,
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
                                "Customer Name",
                                style: textfieldHeadingStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextFormField(
                                  style: textfieldInputStyle,
                                  controller: nameController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: "Enter Name",
                                    hintStyle: hintTextStyle,
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter  Name";
                                    } else if (RegExp(
                                            r'/(^[a-zA-Z][a-zA-Z\s]{0,20}[a-zA-Z]$)/')
                                        .hasMatch(value)) {
                                      return "Enter Correct Name";
                                    } else {
                                      return null;
                                    }
                                  },
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
                                "Phone Number",
                                style: textfieldHeadingStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  style: textfieldInputStyle,
                                  controller: phoneNumberController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: "Enter Phone Number",
                                    hintStyle: hintTextStyle,
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter Mobile Number";
                                    } else if (!RegExp(
                                            r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s./0-9]*$')
                                        .hasMatch(value)) {
                                      return "Enter Correct Phone Number";
                                    } else {
                                      return null;
                                    }
                                  },
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
                                "Bill Number",
                                style: textfieldHeadingStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextFormField(
                                  style: textfieldInputStyle,
                                  controller: billNumberController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: "Enter Bill Number",
                                    hintStyle: hintTextStyle,
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter Bill Number";
                                    } else {
                                      return null;
                                    }
                                  },
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
                                  style: textfieldHeadingStyle,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 150),
                                  child: TextFormField(
                                    style: textfieldInputStyle,
                                    controller: amountController,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      hintText: "Enter Amount",
                                      hintStyle: hintTextStyle,
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Amount ";
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 60,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: FloatingActionButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                _addService();
              } else {
                Center(child: CircularProgressIndicator());
              }
            },
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
