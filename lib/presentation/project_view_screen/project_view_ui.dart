import 'package:flutter/cupertino.dart';
import 'package:githublogin/export.dart';
class ProjectView extends StatelessWidget {
  final controller = Get.find<ProjectViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() => controller.isLoading.isTrue
            ? Center(child: CupertinoActivityIndicator())
            : Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                          color: AppConstant.SIGNINBUTTON_COLOR,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: AppConstant.RESPONSIVEWIDTH * 6),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Spacer(flex: 1),
                                    IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: Icon(
                                          Icons.arrow_back_ios,
                                          size: AppConstant.RESPONSIVEWIDTH * 6,
                                          color: Colors.white,
                                        )),
                                    Spacer(flex: 6),
                                    Text("Project",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize:
                                                AppConstant.RESPONSIVEWIDTH * 6,
                                            color: Colors.white)),
                                    Spacer(flex: 10),
                                  ]),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          AppConstant.RESPONSIVEWIDTH * 4,
                                      vertical:
                                          AppConstant.RESPONSIVEWIDTH * 1),
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(
                                              AppConstant.RESPONSIVEWIDTH * 4),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppConstant
                                                              .RESPONSIVEWIDTH *
                                                          2),
                                              child: FadeInImage.assetNetwork(
                                                height: AppConstant
                                                        .RESPONSIVEWIDTH *
                                                    15,
                                                placeholder:
                                                    AppConstant.GITHUB_LOADING,
                                                image: '${controller.photoUrl}',
                                              )),
                                        ),
                                        // Image(image: NetworkImage("https://assets.weforum.org/sf_account/image/responsive_small_webp_rA_TF_tkRNKjxk_gzlr9UlBXMhuoPZNeRaRO7-ys_xw.webp")),
                                        SizedBox(
                                            width: AppConstant.RESPONSIVEWIDTH *
                                                50,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: AppConstant
                                                                .RESPONSIVEWIDTH *
                                                            2,
                                                        vertical: AppConstant
                                                                .RESPONSIVEWIDTH *
                                                            2),
                                                    child: Text(
                                                        "${controller.projectName}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: AppConstant
                                                                    .RESPONSIVEWIDTH *
                                                                5,
                                                            color:
                                                                Colors.white))),
                                                Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: AppConstant
                                                                .RESPONSIVEWIDTH *
                                                            2,
                                                        vertical: AppConstant
                                                                .RESPONSIVEWIDTH *
                                                            2),
                                                    child: Text(
                                                        "${controller.ownerName}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: AppConstant
                                                                    .RESPONSIVEWIDTH *
                                                                3,
                                                            color:
                                                                Colors.white))),
                                              ],
                                            )),
                                      ],
                                    )),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: AppConstant.RESPONSIVEWIDTH * 6),
                                  child: Text(
                                      "Last update: ${controller.lastDate}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              AppConstant.RESPONSIVEWIDTH * 4,
                                          color: Colors.white)))
                            ],
                          ))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.RxBranchList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      controller.changeSelectedIndexAt(index);
                                      controller.getCommitList(
                                          controller.ownerName,
                                          controller.projectName,
                                          controller.RxBranchList[index].name);
                                    },
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                AppConstant.RESPONSIVEWIDTH * 4,
                                            vertical:
                                                AppConstant.RESPONSIVEWIDTH *
                                                    2),
                                        margin: EdgeInsets.symmetric(
                                            horizontal:
                                                AppConstant.RESPONSIVEWIDTH * 4,
                                            vertical:
                                                AppConstant.RESPONSIVEWIDTH *
                                                    2),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  AppConstant.RESPONSIVEWIDTH *
                                                      4)),
                                          color:
                                              controller.selectedIndex == index
                                                  ? Color(0xFF27274A)
                                                  : Color(0xFFD3DEFF),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "${controller.RxBranchList[index].name}",
                                          style: TextStyle(
                                            color: controller.selectedIndex ==
                                                    index
                                                ? Color(0xFFD3DEFF)
                                                : Color(0xFF27274A),
                                          ),
                                        ))));
                              }))),
                  Expanded(
                    flex: 10,
                    child: ListView.builder(
                        itemCount: controller.RxCommitList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppConstant.RESPONSIVEWIDTH * 4,
                                  vertical: AppConstant.RESPONSIVEWIDTH * 1),
                              child: Container(
                                color: Colors.transparent,
                                child: Center(
                                    child: Card(
                                        surfaceTintColor: Colors.white,
                                        elevation:
                                            AppConstant.RESPONSIVEWIDTH * 2,
                                        color: Colors.white,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(
                                                  AppConstant.RESPONSIVEWIDTH *
                                                      4),
                                              child: Container(
                                                  padding: EdgeInsets.all(
                                                      AppConstant
                                                              .RESPONSIVEWIDTH *
                                                          1),
                                                  height: AppConstant
                                                          .RESPONSIVEWIDTH *
                                                      10,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFFF5EB),
                                                    borderRadius: BorderRadius
                                                        .circular(AppConstant
                                                                .RESPONSIVEWIDTH *
                                                            2),
                                                  ),
                                                  child: Image(
                                                    image: AssetImage(
                                                        AppConstant
                                                            .FOLDER_ASSET),
                                                  )),
                                            ),
                                            SizedBox(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: AppConstant
                                                                .RESPONSIVEWIDTH *
                                                            2,
                                                        vertical: AppConstant
                                                                .RESPONSIVEWIDTH *
                                                            2),
                                                    child: Text(
                                                        "${controller.RxCommitList[index].commit?.message}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: AppConstant
                                                                    .RESPONSIVEWIDTH *
                                                                4,
                                                            color:
                                                                Colors.black))),
                                                Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: AppConstant
                                                                .RESPONSIVEWIDTH *
                                                            2,
                                                        vertical: AppConstant
                                                                .RESPONSIVEWIDTH *
                                                            2),
                                                    child: Text(
                                                        "${controller.convertDateTime(controller.RxCommitList[index].commit?.committer?.date)}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: AppConstant
                                                                    .RESPONSIVEWIDTH *
                                                                3,
                                                            color:
                                                                Colors.black))),
                                                Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: AppConstant
                                                                .RESPONSIVEWIDTH *
                                                            2,
                                                        vertical: AppConstant
                                                                .RESPONSIVEWIDTH *
                                                            2),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        AppConstant.RESPONSIVEWIDTH *
                                                                            2,
                                                                    vertical:
                                                                        0),
                                                            child: Image(
                                                                image: AssetImage(
                                                                    AppConstant
                                                                        .AUTHOR_ASSET),
                                                                height: AppConstant
                                                                        .RESPONSIVEWIDTH *
                                                                    4)),
                                                        Text(
                                                            "${controller.RxCommitList[index].commit?.author?.name}",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    AppConstant
                                                                            .RESPONSIVEWIDTH *
                                                                        3,
                                                                color: Colors
                                                                    .black))
                                                      ],
                                                    )),
                                              ],
                                            )),
                                          ],
                                        ))),
                              ));
                        }),
                  )
                ],
              )));
  }
}
