import 'package:flutter/material.dart';
import 'package:qlcd/api/graphql_server.dart';
import 'package:qlcd/constant/constants.dart';
import 'package:qlcd/view/dialog/notification_dialog.dart';

import '../generated/l10n.dart';

class MemberItem extends StatelessWidget {
  Map<String, dynamic> map;

  MemberItem({required this.map});

  @override
  Widget build(BuildContext context) {
    String? relationship;
    String? name;
    String? phone;
    if (map['b'] != null) {
      name = map['b']['info_name'];
      phone = map['b']['phone_required'];
    } else {
      name = "";
      phone = "";
    }
    if (map['relationshipId'] != null) {
      relationship = map['a']['name'];
    } else {
      relationship = "Chủ nhà";
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 186,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: gradientWhite, borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 86,
                width: 68,
                margin: EdgeInsets.all(16),
                child: Image.asset(
                  "assets/images/avt.png",
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name ?? "",
                      style: txtLinkSmall(color: grayScaleColorBase),
                    ),
                    vpad(12),
                    Container(
                      // width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                S.of(context).phone,
                                style:
                                    txtBodyXXSmallBold(color: grayScaleColor2),
                              )),
                          Flexible(
                            child: Text(phone ?? "",
                                style: txtLinkSmall(color: grayScaleColorBase)),
                            flex: 1,
                          )
                        ],
                      ),
                    ),
                    vpad(12),
                    Container(
                      // width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text("Quan hệ với chủ hộ ",
                                  style: txtBodyXXSmallBold(
                                      color: grayScaleColor2))),
                          hpad(10),
                          Expanded(
                            child: Text(
                              relationship!,
                              style: txtLinkSmall(color: grayScaleColorBase),
                            ),
                            flex: 1,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    color: secondaryColor11,
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit_note,
                      color: secondaryColor11,
                    )),
                IconButton(
                    onPressed: () async {
                      String? residentId;
                      if (map['b'] != null) {
                        residentId = map['b']['_id'];
                      } else {
                        residentId = null;
                      }
                      String ownInfoId = map['_id'];
                      print(residentId);
                      print("-----");
                      print(ownInfoId);
                      String? result = await GraphQLServer()
                          .deleteMember(residentId!, ownInfoId);
                      if (result != null) {
                        NotificationDialog.showDialog(
                            S.current.notification, result, context);
                      } else {
                        NotificationDialog.showDialog(
                            S.current.notification, "Xóa thành công", context);
                      }
                    },
                    icon: Icon(Icons.delete_sharp, color: secondaryColor11)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.message, color: secondaryColor11)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.phone, color: secondaryColor11))
              ],
            ),
          )
        ],
      ),
    );
  }
}
