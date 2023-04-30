import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_app/provider/bill_provider.dart';

import '../../model/billListData.dart';
import '../../utils/constants.dart';
import 'garageContents.dart';

class BillListPage extends StatefulWidget {
  const BillListPage({Key? key}) : super(key: key);

  @override
  State<BillListPage> createState() => _BillListPageState();
}

class _BillListPageState extends State<BillListPage> {
  @override
  void initState() {
   // _getBillList();
   Provider.of<BillProvider>(context, listen: false).fetchBillList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final billProvider = Provider.of<BillProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appUiLightColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GarageContents(
                "Bills", "assets/images/img4.png", "Bill No.", "Amount"),
            Expanded(
              child: billProvider.billListCount == 0
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                    padding: EdgeInsets.zero,
                      itemCount: billProvider.billListCount,
                      itemBuilder: (context, index) {
                        Bill data = billProvider.getBillList[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: appUiGreyColor, width: 1))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
      ),
    );
  }
}
