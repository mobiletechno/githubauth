import 'package:flutter/cupertino.dart';
import 'package:githublogin/export.dart';
class Home extends StatelessWidget {
  final controller = Get.find<HomeController>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.isLoading.isTrue
            ? Center(child: CupertinoActivityIndicator())
            : Scaffold(
                key: _scaffoldKey,
                backgroundColor: Colors.white,
                drawer: Drawer(
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  // Add a ListView to the drawer. This ensures the user can scroll
                  // through the options in the drawer if there isn't enough vertical
                  // space to fit everything.
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,

                    children: [
                      SizedBox(height: AppConstant.RESPONSIVEWIDTH * 6),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                  AppConstant.RESPONSIVEWIDTH * 6),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      AppConstant.RESPONSIVEWIDTH * 2),
                                  child: FadeInImage.assetNetwork(
                                    height: AppConstant.RESPONSIVEWIDTH * 20,
                                    placeholder: AppConstant.GITHUB_LOADING,
                                    image:
                                        "${Get.find<appdata>().box.read(AppConstant.APPDATA_PHOTOURL)}",
                                  )),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${Get.find<appdata>().box.read(AppConstant.APPDATA_DISPLAYNAME)}",
                                    style: TextStyle(
                                        fontSize:
                                            AppConstant.RESPONSIVEWIDTH * 5,
                                        color: Colors.black)),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            AppConstant.RESPONSIVEWIDTH * 4,
                                        vertical:
                                            AppConstant.RESPONSIVEWIDTH * 1),
                                    child: Text(
                                        "${Get.find<appdata>().box.read(AppConstant.APPDATA_USERNAME)}",
                                        style: TextStyle(
                                            fontSize:
                                                AppConstant.RESPONSIVEWIDTH * 3,
                                            color: Colors.white)),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFF9C37),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                AppConstant.RESPONSIVEWIDTH *
                                                    2)))),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: AppConstant.RESPONSIVEHEIGHT * 75,
                        color: Colors.white,
                        child: ListView.builder(
                            // controller: controller.scrollController,
                            itemCount: controller.RxOrganisationList.length,
                            itemBuilder: (context, index) {
                              return controller.RxOrganisationList.isEmpty
                                  ? Center(
                                      child: Text("No Data",
                                          style: TextStyle(
                                              fontSize:
                                                  AppConstant.RESPONSIVEWIDTH *
                                                      6,
                                              color: Colors.black)))
                                  : Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              AppConstant.RESPONSIVEWIDTH * 2,
                                          vertical: 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                AppConstant.RESPONSIVEWIDTH *
                                                    2)),
                                        color: controller.selectedIndex == index
                                            ? Color(0xFFD3DEFF)
                                            : Colors.transparent,
                                      ),
                                      child: ListTile(
                                        leading: Padding(
                                          padding: EdgeInsets.all(
                                              AppConstant.RESPONSIVEWIDTH * 2),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppConstant
                                                              .RESPONSIVEWIDTH *
                                                          2),
                                              child: FadeInImage.assetNetwork(
                                                placeholder:
                                                    AppConstant.GITHUB_LOADING,
                                                image:
                                                    '${controller.RxOrganisationList[index].avatarUrl}',
                                              )),
                                        ),
                                        title: Text(
                                            '${controller.RxOrganisationList[index].login}',
                                            style: TextStyle(
                                                fontSize: AppConstant
                                                        .RESPONSIVEWIDTH *
                                                    5,
                                                color: Colors.black)),
                                        onTap: () {
                                          controller
                                              .changeSelectedIndexAt(index);
                                          controller.getRepoList(controller
                                              .RxOrganisationList[index].login);

                                          // Update the state of the app.
                                          // ...
                                        },
                                      ));
                            }),
                      )
                    ],
                  ),
                ),
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  toolbarHeight: AppConstant.RESPONSIVEWIDTH * 65,
                  flexibleSpace: Stack(
                    children: [
                      Container(
                          height: AppConstant.RESPONSIVEWIDTH * 65,
                          color: Colors.white),
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: AppConstant.RESPONSIVEWIDTH * 22,
                          child: Container(
                              color: AppConstant.SIGNINBUTTON_COLOR,
                              // height: AppConstant.RESPONSIVEWIDTH * 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacer(flex: 1),
                                  Row(
                                    children: [
                                      Spacer(flex: 1),
                                      IconButton(
                                          onPressed: () {
                                            _scaffoldKey.currentState!
                                                .openDrawer();
                                          },
                                          icon: Icon(
                                            Icons.menu,
                                            size:
                                                AppConstant.RESPONSIVEWIDTH * 8,
                                            color: Colors.white,
                                          )),
                                      Spacer(flex: 1),
                                      Text('Github',
                                          style: TextStyle(
                                              fontSize:
                                                  AppConstant.RESPONSIVEWIDTH *
                                                      5,
                                              color: Colors.white)),
                                      Spacer(flex: 20),
                                      IconButton(
                                          onPressed: () {
                                            Get.find<appdata>().box.erase();
                                            Get.offAllNamed(
                                                AppConstant.LOGIN_NAME);
                                          },
                                          icon: Icon(
                                            size:
                                                AppConstant.RESPONSIVEWIDTH * 6,
                                            Icons.logout,
                                            color: Colors.white,
                                          )),
                                      Spacer(flex: 1),
                                    ],
                                  ),
                                  // Spacer(flex: 1),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: AppConstant.RESPONSIVEWIDTH * 6),
                                    child: Text(
                                        "Hi ${Get.find<appdata>().box.read(AppConstant.APPDATA_DISPLAYNAME)}",
                                        style: TextStyle(
                                            fontSize:
                                                AppConstant.RESPONSIVEWIDTH * 4,
                                            color: Colors.white)),
                                  ),
                                  Spacer(flex: 2),
                                ],
                              ))),
                      Positioned(
                          top: AppConstant.RESPONSIVEWIDTH * 30,
                          left: AppConstant.RESPONSIVEWIDTH * 4,
                          right: AppConstant.RESPONSIVEWIDTH * 4,
                          child: Container(
                              height: AppConstant.RESPONSIVEWIDTH * 25,
                              child: Card(
                                  surfaceTintColor: Colors.white,
                                  elevation: AppConstant.RESPONSIVEWIDTH * 2,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(
                                            AppConstant.RESPONSIVEWIDTH * 4),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                AppConstant.RESPONSIVEWIDTH *
                                                    2),
                                            child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  AppConstant.GITHUB_LOADING,
                                              image:
                                                  '${Get.find<appdata>().box.read(AppConstant.APPDATA_PHOTOURL)}',
                                            )),
                                      ),
                                      // Image(image: NetworkImage("https://assets.weforum.org/sf_account/image/responsive_small_webp_rA_TF_tkRNKjxk_gzlr9UlBXMhuoPZNeRaRO7-ys_xw.webp")),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "${Get.find<appdata>().box.read(AppConstant.APPDATA_DISPLAYNAME)}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: AppConstant
                                                          .RESPONSIVEWIDTH *
                                                      4,
                                                  color: Colors.black)),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: AppConstant
                                                          .RESPONSIVEWIDTH *
                                                      4,
                                                  vertical:
                                                      AppConstant.RESPONSIVEWIDTH *
                                                          1),
                                              child: Text(
                                                  "${Get.find<appdata>().box.read(AppConstant.APPDATA_USERNAME)}",
                                                  style: TextStyle(
                                                      fontSize: AppConstant
                                                              .RESPONSIVEWIDTH *
                                                          3,
                                                      color: Colors.white)),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF22CCCC),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(
                                                          AppConstant.RESPONSIVEWIDTH * 2)))),
                                        ],
                                      ),
                                    ],
                                  )))),
                      Positioned(
                        bottom: 0,
                        left: AppConstant.RESPONSIVEWIDTH * 6,
                        child: Text('Projects',
                            style: TextStyle(
                                fontSize: AppConstant.RESPONSIVEWIDTH * 5,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                ),
                body: controller.RxRepoList.isEmpty
                    ? Center(
                        child: Text("No Data",
                            style: TextStyle(
                                fontSize: AppConstant.RESPONSIVEWIDTH * 6,
                                color: Colors.black)))
                    : ListView.builder(
                        // controller: controller.scrollController,
                        itemCount: controller.RxRepoList.length,
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
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius
                                                      .circular(AppConstant
                                                              .RESPONSIVEWIDTH *
                                                          2),
                                                  child:
                                                      FadeInImage.assetNetwork(
                                                    height: AppConstant
                                                            .RESPONSIVEWIDTH *
                                                        15,
                                                    placeholder: AppConstant
                                                        .GITHUB_LOADING,
                                                    image:
                                                        '${controller.RxRepoList[index].owner?.avatarUrl!}',
                                                  )),
                                            ),
                                            // Image(image: NetworkImage("https://assets.weforum.org/sf_account/image/responsive_small_webp_rA_TF_tkRNKjxk_gzlr9UlBXMhuoPZNeRaRO7-ys_xw.webp")),
                                            SizedBox(
                                                width: AppConstant
                                                        .RESPONSIVEWIDTH *
                                                    50,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
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
                                                            "${controller.RxRepoList[index].name}",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    AppConstant
                                                                            .RESPONSIVEWIDTH *
                                                                        4,
                                                                color: Colors
                                                                    .black))),
                                                    Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: AppConstant
                                                                    .RESPONSIVEWIDTH *
                                                                2,
                                                            vertical: AppConstant
                                                                    .RESPONSIVEWIDTH *
                                                                2),
                                                        child: Text(
                                                            "${controller.RxRepoList[index].owner?.login}",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    AppConstant
                                                                            .RESPONSIVEWIDTH *
                                                                        3,
                                                                color: Colors
                                                                    .black))),
                                                  ],
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  Get.toNamed(
                                                      AppConstant
                                                          .PROJECTVIEW_NAME,
                                                      arguments: [
                                                        {
                                                          "projectName":
                                                              "${controller.RxRepoList[index].name}",
                                                          "owner":
                                                              "${controller.RxRepoList[index].owner?.login}",
                                                          "photoUrl":
                                                              "${controller.RxRepoList[index].owner?.avatarUrl}",
                                                          "lastUpdate":
                                                              "${controller.RxRepoList[index].updatedAt}",
                                                        }
                                                      ]);
                                                },
                                                icon: Icon(
                                                  Icons.arrow_forward_ios_sharp,
                                                  size: AppConstant
                                                          .RESPONSIVEWIDTH *
                                                      6,
                                                  color: Colors.grey,
                                                )),
                                          ],
                                        ))),
                              ));
                        }),
              )));
  }
}
