import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_dev/Controllers/AllFilesController.dart';
import 'package:flutter_test_dev/Services/models/files.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_dev/Services/models/local.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  List filteredFiles = <Local>[];

  AllFilesController controller = AllFilesController();

  @override
  void initState() {
    controller.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return Scaffold(
          body: Obx(
        () => !controller.isLoading.value
            ? CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.height * 0.1,
                    floating: false,
                    pinned: true,
                    backgroundColor: Colors.amberAccent,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text(
                          'File Storage',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        background: SvgPicture.asset(
                          'image/bg_yellow_condensed.svg',
                          fit: BoxFit.cover,
                        )),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.add_circle),
                        tooltip: 'Add new entry',
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                  SliverFixedExtentList(
                    itemExtent: 30.sp,
                    delegate: SliverChildListDelegate([
                      Container(
                          child: Row(
                        children: [
                          Container(width: 75.w, child: buildTextField()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 5.w,
                                height: 5.h,
                                child: SvgPicture.asset('image/ic_sort.svg')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 5.w,
                                height: 5.h,
                                child: SvgPicture.asset('image/ic_filter.svg')),
                          ),
                        ],
                      )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 1.h,
                            width: 60.w,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 43.w,
                                      child: Text('FOLDERS',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          textAlign: TextAlign.left)),

                                  SizedBox(
                                      width: 43.w,
                                      child: Text('New Folders',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          textAlign: TextAlign.right)),
                                  Divider()
                                  //Container(width: 170, child: Text("FOLDERS")),
                                  // Container(width: 170, child: Text("New Folders")),
                                ],
                              ),
                            ),
                          )),
                    ]),
                  ),
                  SliverList(
                    delegate: controller.isFiltred.value
                        ? SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Card(
                                  margin: EdgeInsets.only(
                                      left: 10.0, right: 10.0, bottom: 5.0),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: HexColor('#FFD947'), width: 5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.sp))),
                                  elevation: 20.sp,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                        '/Home/file',
                                      );
                                    },
                                    child: ListTile(
                                        title: Text(
                                          controller.titul[index].name,
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        subtitle:
                                            Text(controller.titul[index].value),
                                        leading: Container(
                                            width: 25.w,
                                            height: 20.h,
                                            child: SvgPicture.asset(
                                                'image/ic_folder.svg')),
                                        trailing:
                                            Text(controller.titul[index].time)),
                                  ));
                            },
                            childCount: controller.titul.length as int,
                          )
                        : SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Card(
                                  margin: EdgeInsets.only(
                                      left: 10.0, right: 10.0, bottom: 5.0),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: HexColor('#FFD947'),
                                          width: 3.sp),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.sp))),
                                  elevation: 20.sp,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                        '/Home/file',
                                      );
                                    },
                                    child: ListTile(
                                        title: Text(
                                          filteredFiles[index].name,
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        subtitle:
                                            Text(filteredFiles[index].value),
                                        leading: Container(
                                            width: 25.w,
                                            height: 20.h,
                                            child: SvgPicture.asset(
                                                'image/ic_folder.svg')),
                                        trailing:
                                            Text(filteredFiles[index].time)),
                                  ));
                            },
                            childCount: filteredFiles.length as int,
                          ),
                  )
                ],
              )
            : Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 40.0.h),
                    child: Column(children: [
                      CircularProgressIndicator(
                        backgroundColor: Colors.indigo,
                      ),
                      Text(
                        "Please wait, downloading data...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: "Helvetica",
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
      ));
    });
  }

  TextField buildTextField() {
    return TextField(
      decoration:
          InputDecoration(icon: Icon(Icons.search), hintText: 'Search... '),
      onChanged: (value) {
        setState(() {
          filteredFiles = controller.titul
              .where((item) =>
                  (item.name.toLowerCase().contains(value.toLowerCase()) ||
                      item.name.toLowerCase().contains(value.toLowerCase())))
              .toList();
        });
        controller.filterList();
      },
    );
  }
}
