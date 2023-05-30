// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:qlcd/api/graphql_server.dart';
import 'package:qlcd/constant/constants.dart';
import 'package:qlcd/view/category/family/add_member.dart';
import 'package:qlcd/view/home/home.dart';
import 'package:qlcd/widget/member_item.dart';

class MemberScreen extends StatefulWidget {
  static const routesName = '/member';

  const MemberScreen({super.key});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  String? dependentId;

  // Object? member ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<dynamic> getMember() async {
    List<dynamic>? member = await GraphQLServer().getMember();
    List<Map<String, dynamic>> map = member!.cast<Map<String, dynamic>>();
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Danh sách thành viên"),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacementNamed(context, Home.routesName);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12, right: 10, left: 10),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            FutureBuilder(
              future: getMember(),
              builder: (context, snapshot) {
                var a = snapshot.data;
                if (a != null) {
                  dependentId = a.firstWhere(
                      (v) => v['relationshipId'] == null)?['residentId'];
                }

                print("dependent: $dependentId");
                // for(Map<String,dynamic> result in a){
                //   if(result['relationshipId'] == null){
                //     dependentId = result['residentId'];
                //     break;
                //   }
                // }
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  case ConnectionState.done:
                    {
                      if (snapshot.data == null) {
                        print("dữ liệu rỗng");
                        return Center(
                          child: Text(
                            "Chưa có thành viên nào",
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      } else {
                        // print("có dữ liệu : ${snapshot.data}");
                        return ListView(children: [
                          ...snapshot.data.map((c) => InkWell(
                                child: Column(
                                  children: [
                                    MemberItem(map: c),
                                  ],
                                ),
                              )),
                          vpad(40),
                        ]);
                      }
                    }
                  case ConnectionState.none:
                    // TODO: Handle this case.
                    break;
                  case ConnectionState.active:
                    // TODO: Handle this case.
                    break;
                }
                return Center(
                  child: Text("Chưa có thành viên nào"),
                );
              },
            ),
            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AddMember.routesName,
                      arguments: dependentId);
                })
          ],
        ),
      ),
    );
  }
}
