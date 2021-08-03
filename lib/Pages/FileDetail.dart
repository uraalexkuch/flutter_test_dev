import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_dev/Controllers/TwoPagesController.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FileDetail extends StatelessWidget {
  TwoPageController controller = TwoPageController();
  @override
  Widget build(BuildContext context) {
    controller.onInit();

    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: Obx(
          () => !controller.isLoading.value
              ? CustomScrollView(slivers: [
                  SliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.height * 0.1,
                    floating: false,
                    pinned: true,
                    backgroundColor: Colors.amberAccent,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text(
                          'File List',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        background: SvgPicture.asset(
                          'image/bg_yellow_condensed.svg',
                          fit: BoxFit.cover,
                        )),
                  ),
                  SliverFixedExtentList(
                      itemExtent: 30.sp,
                      delegate: SliverChildListDelegate([
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 1.h,
                              width: 45.w,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 43.w,
                                      child: Text('FILES',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          textAlign: TextAlign.left),
                                    ),
                                    SizedBox(
                                        width: 43.w,
                                        child: Text(
                                            controller.files.length.toString(),
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            textAlign: TextAlign.right)),
                                    Divider()
                                  ],
                                ),
                              ),
                            )),
                      ])),
                  SliverStaggeredGrid.countBuilder(
                    crossAxisCount: 4,
                    itemCount: controller.files.length as int,
                    itemBuilder: (BuildContext context, int index) =>
                        new Container(
                            child: Card(
                                margin: EdgeInsets.only(
                                    left: 5.0, right: 5.0, bottom: 5.0),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: HexColor('#FFD947'),
                                        width: 6.sp),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.sp))),
                                elevation: 20.sp,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/Home',
                                        arguments: controller.files[index]);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 22.h,
                                              width: 40.w,
                                              child: Image.network(
                                                controller
                                                    .files[index].thumbnailUrl,
                                                fit: BoxFit.cover,
                                                width: 20.h,
                                                height: 38.w,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                //width: 52.w,
                                                child: Text(
                                                    controller
                                                        .files[index].title,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.sp,
                                                    ),
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, index.isEven ? 3 : 2.5),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  )
                ])
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
                          "Please wait, downloading data",
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
        ),
      );
    });
  }
}
