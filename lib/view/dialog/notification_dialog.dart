import 'package:flutter/material.dart';
import 'package:qlcd/constant/constants.dart';
import 'package:qlcd/generated/l10n.dart';
import 'package:qlcd/utils/utils.dart';
import 'package:qlcd/widget/primary_dialog.dart';

class NotificationDialog {
  static showDialog(String title, String content, BuildContext context) {
    Utils.showDialog(
        context: context,
        dialog: PrimaryDialog.custom(
          title: title,
          content: Column(children: [
            Text(content,
                style: txtLinkSmall(color: grayScaleColor1),
                textAlign: TextAlign.center),
            vpad(12),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  // color: Colors.black,
                  // ignore: prefer_const_constructors
                  border: Border(
                      top: BorderSide(color: grayScaleColor7, width: 1))),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    width: double.infinity,
                    height: 48,
                    alignment: Alignment.center,
                    child: Text(S.of(context).close,
                        style: txtLinkMedium(color: secondaryColor9))),
              ),
            ),
          ]),
        ));
  }

  static closeDialog() {}
}
