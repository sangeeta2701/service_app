import 'package:flutter/material.dart';

import '../../model/billListData.dart';
import '../../utils/constants.dart';
import 'garageContents.dart';
import 'package:http/http.dart' as http;

class BillListPage extends StatefulWidget {
  const BillListPage({Key? key}) : super(key: key);

  @override
  State<BillListPage> createState() => _BillListPageState();
}

class _BillListPageState extends State<BillListPage> {
  @override
  void initState() {
    _getBillList();
    super.initState();
  }

  List<Bill> billList = [];

  Future _getBillList() async {
    const apiUrl = "https://va-api-render.onrender.com/api/bills";
    final response = await http.get(
      Uri.parse(apiUrl),
    );
    var result = response.body.toString();

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var _bill = billListDataFromJson(result);
      print(_bill);
      setState(() {
        billList = _bill.bills!;
      });
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("No Data Found"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appUiLightColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GarageContents(
              "Bills", "assets/images/img4.png", "Bill No.", "Amount"),
          SizedBox(
            height: 530,
            child:billList.isEmpty?Center(child: CircularProgressIndicator(),) : ListView.builder(
                itemCount: billList.length,
                itemBuilder: (context, index) {
                  Bill data = billList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: appUiGreyColor, width: 1))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${data.billNumber}",
                              style: textfieldInputStyle,
                            ),
                            Text(
                              "Rs. ${data.billAmount}",
                              style: textfieldInputStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
