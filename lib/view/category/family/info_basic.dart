// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qlcd/api/graphql_server.dart';
import 'package:qlcd/constant/constants.dart';
import 'package:qlcd/generated/l10n.dart';
import 'package:qlcd/provider/member/basic_info_provider.dart';
import 'package:qlcd/widget/primary_button.dart';
import 'package:qlcd/widget/primary_dropdown.dart';
import 'package:qlcd/widget/primary_text_field.dart';
import 'package:qlcd/widget/select_media_widget.dart';

import '../../../utils/utils.dart';

class InfoBasic extends StatefulWidget {
  void Function() ontap;

  InfoBasic({required this.ontap});

  @override
  State<InfoBasic> createState() => _InfoBasicState();
}

class _InfoBasicState extends State<InfoBasic> {
  Future<dynamic> getRelationship() async {
    List<dynamic> list = await GraphQLServer().getRelationship();
    List<Map<String, dynamic>> map = list.cast<Map<String, dynamic>>();
    return map;
  }

  List<File> listfile = [];
  String? date;
  dynamic valueSex;
  dynamic valueTypeResidence;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Form(
          key: context.read<BasicInfoProvider>().formKeyBasicInfo,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vpad(12),
              PrimaryTextField(
                textColor: Colors.black,
                label: S.of(context).full_name,
                hint: S.of(context).full_name,
                isRequired: true,
                controller: context.read<BasicInfoProvider>().fullnameTextCtr,
                validateString:
                    context.watch<BasicInfoProvider>().fullnamevalidate,
                validator: (v) {
                  return context.read<BasicInfoProvider>().validateFullname();
                },
              ),
              vpad(12),
              FutureBuilder(
                  future: getRelationship(),
                  builder: (context, snapshot) {
                    List<DropdownMenuItem>? listRelationship = snapshot.data
                        ?.map<DropdownMenuItem>((c) => DropdownMenuItem(
                              value: c['_id'],
                              child: Text(c['name']),
                            ))
                        .toList();
                    // print("có dữ liệu : ${snapshot.data}");
                    return PrimaryDropDown(
                      value:
                          context.watch<BasicInfoProvider>().valueRelationship,
                      validateString: context
                              .read<BasicInfoProvider>()
                              .relationshipValidate ??
                          null,
                      onChange: (value) {
                        context
                            .read<BasicInfoProvider>()
                            .setValueRelationship(value);
                      },
                      validator: (v) {
                        print(
                            "vali ;${context.read<BasicInfoProvider>().validateRelationship()}");
                        return context
                                .read<BasicInfoProvider>()
                                .validateRelationship() ??
                            null;
                      },
                      label: "Quan hệ với chủ hộ",
                      isRequired: true,
                      selectList: listRelationship ?? [],
                    );
                  }),
              vpad(16),
              PrimaryDropDown(
                value: context.watch<BasicInfoProvider>().sexIndexx,
                validator: (v) {
                  return context.read<BasicInfoProvider>().validateSex();
                },
                validateString: context.read<BasicInfoProvider>().sexValidate,
                onChange: (value) {
                  context
                      .read<BasicInfoProvider>()
                      .setValueSex(value.toString());
                },
                label: "Giới tính",
                isRequired: true,
                selectList: [
                  DropdownMenuItem(
                    value: "1",
                    child: Text("MALE"),
                  ),
                  DropdownMenuItem(
                    value: "2",
                    child: Text("FEMALE"),
                  ),
                ],
              ),
              vpad(12),
              PrimaryTextField(
                textColor: Colors.black,
                label: "Ngày sinh",
                isRequired: true,
                hint: "dd/MM/yyyy",
                enable: false,
                controller: context.read<BasicInfoProvider>().dateTextCtr,
                validateString: context.read<BasicInfoProvider>().dateValidate,
                validator: (v) {
                  return context.read<BasicInfoProvider>().validateBirthday();
                },
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 80,
                              DateTime.now().month, DateTime.now().day),
                          lastDate: DateTime.now())
                      .then((v) {
                    date = v!.toIso8601String();
                    print(date);
                    DateTime dateTime = DateTime.parse(date!);
                    String formattedDate =
                        "${dateTime.day}/${dateTime.month}/${dateTime.year}";
                    context.read<BasicInfoProvider>().dateTextCtr.text =
                        formattedDate;
                  });
                },
                prefixIcon: InkWell(
                  child: Icon(
                    Icons.calendar_month_rounded,
                    color: primaryColor2,
                  ),
                ),
              ),
              vpad(12),
              PrimaryTextField(
                textColor: Colors.black,
                label: "CMND / CCCD / Hộ chiếu",
                hint: "Nhập số",
                controller: context.read<BasicInfoProvider>().CCCDTextCtr,
              ),
              vpad(12),
              PrimaryTextField(
                textColor: Colors.black,
                label: "Quốc tịch",
                hint: "Nhập số đăng kí",
                controller: context.read<BasicInfoProvider>().nationalTextCtr,
                validateString:
                    context.read<BasicInfoProvider>().nationalValidate,
                isRequired: true,
                validator: (v) {
                  return context.read<BasicInfoProvider>().validateNational();
                },
              ),
              vpad(12),
              PrimaryDropDown(
                value: context.watch<BasicInfoProvider>().typeResidenceIndex,
                validateString:
                    context.read<BasicInfoProvider>().typeResidenceValidate,
                onChange: (value) {
                  print("value ${value}");
                  context
                      .read<BasicInfoProvider>()
                      .setValueTypeResidence(value.toString());
                },
                validator: (v) {
                  return context
                      .read<BasicInfoProvider>()
                      .validateTypeResidence();
                },
                label: "Loại cư trú",
                isRequired: true,
                selectList: [
                  DropdownMenuItem(
                    value: "1",
                    child: Text("RESIDENT"),
                  ),
                  DropdownMenuItem(
                    value: "2",
                    child: Text("STAYING"),
                  ),
                ],
              ),
              vpad(24),
              Text(
                "Ảnh cư dân*",
                style: txtBodySmallRegular(color: grayScaleColorBase),
              ),
              vpad(5),
              SelectMediaWidget(
                images: listfile ?? [],
                onRemove: (int i) {
                  setState(() {
                    listfile.removeAt(i);
                  });
                },
                onSelect: () {
                  Utils.imagePicker(true, ImageSource.gallery).then((v) {
                    setState(() {
                      for (var i in v!) {
                        listfile.add(File(i.path));
                      }
                      print(v);
                      print(listfile.length);
                    });
                  });
                },
              ),
              vpad(24),
              Container(
                width: double.infinity,
                child: PrimaryButton(
                  text: "Tiếp tục",
                  buttonType: ButtonType.primary,
                  buttonSize: ButtonSize.large,
                  onTap: widget.ontap,
                ),
              ),
              vpad(36),
            ],
          ),
        ),
      ),
    );
  }
}
