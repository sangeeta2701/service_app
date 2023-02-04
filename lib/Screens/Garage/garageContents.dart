import 'package:flutter/material.dart';

import '../../constants.dart';

class GarageContents extends StatelessWidget {
  String name;
  String img;
  String txt;
  GarageContents(this.name, this.img, this.txt);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: appUiDarkColor),
                ),
                Image(
                  width: 40,
                  height: 40,
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Divider(
            color: appUiGreyColor,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Text(
              txt,
              style: TextStyle(
                  color: appUiDarkColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
