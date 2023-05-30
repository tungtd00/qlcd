import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qlcd/constant/constants.dart';

class CategoryItem extends StatelessWidget {
  String svgIcon;
  String label;
  void Function()? ontap;

  CategoryItem(
      {Key? key, required this.svgIcon, required this.label, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(23)),
              color: Colors.white,
            ),
            child: SvgPicture.asset(svgIcon),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
                width: 56,
                child: Text(
                  label,
                  style: txtBodySmallRegular(
                    color: Colors.black,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }
}
