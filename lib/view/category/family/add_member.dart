import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlcd/constant/constants.dart';
import 'package:qlcd/provider/member/basic_info_provider.dart';
import 'package:qlcd/view/category/family/info_basic.dart';
import 'package:qlcd/view/category/family/info_other.dart';
import 'package:qlcd/view/category/family/member_screen.dart';

class AddMember extends StatefulWidget {
  static const routesName = "/add_member";

  const AddMember({super.key});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);
  int indexTab = 0;
  bool checkTab = false;

  @override
  Widget build(BuildContext context) {
    String? dependentId = ModalRoute.of(context)?.settings.arguments as String?;
    print('rebuild');
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text("Thêm mới thành viên"),
              leading: BackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, MemberScreen.routesName);
                },
              ),
              bottom: TabBar(
                controller: tabController,
                onTap: (index) {
                  if (checkTab) {
                    setState(() {
                      tabController.index = index;
                    });
                  } else {
                    setState(() {
                      tabController.index = 0;
                    });
                  }
                },
                tabs: [
                  Text(
                    "Thông tin cơ bản",
                    style: txtBodySmallBold(color: grayScaleColor2),
                  ),
                  Text("Thông tin khác",
                      style: txtBodySmallBold(color: grayScaleColor2))
                ],
              ),
            ),
            body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  InfoBasic(
                    ontap: () {
                      if (context
                          .read<BasicInfoProvider>()
                          .validateBasicInfo()) {
                        setState(() {
                          checkTab = true;
                          tabController.index = 1;
                          print(tabController.index);
                        });
                      } else {
                        print(
                            "national: ${context.read<BasicInfoProvider>().nationalTextCtr.text}");
                      }
                    },
                  ),
                  // ignore: prefer_const_constructors
                  OtherInfo(
                    dependentId: dependentId,
                  )
                ])));
  }
}
