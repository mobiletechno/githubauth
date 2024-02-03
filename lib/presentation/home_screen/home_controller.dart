import 'package:githublogin/export.dart';
class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  late Repo _Repo;
  RxList<OrganisationModel> RxOrganisationList = RxList();
  RxList<RepoModel> RxRepoList = RxList();
  RxInt selectedIndex = 0.obs;

  @override
  onInit() {
    super.onInit();
    _Repo = Get.find<RepoImpl>();
    getOrganisationList();
  }

  void changeSelectedIndexAt(int indexAt) {
    selectedIndex = indexAt.obs;
  }

  Future<void> getOrganisationList() async {
    isLoading.toggle();
    var apiResult = await _Repo.getOrganisationList();
    if (apiResult != null) {
      final List<dynamic> rawData = apiResult;
      RxOrganisationList =
          rawData.map((e) => OrganisationModel.fromJson(e)).toList().obs;
      if (RxOrganisationList.isNotEmpty) {
        getRepoList(RxOrganisationList[0].login);
      } else {}
      isLoading.toggle();
    } else {
      Get.snackbar("Alert", "something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 4),
          margin: EdgeInsets.all(40),
          icon: Icon(Icons.info_outline, color: Colors.white),
          colorText: Colors.white,
          backgroundColor: Colors.red);
      isLoading.toggle();
    }
  }

  Future<void> getRepoList(String? loginName) async {
    isLoading.toggle();
    var apiResult = await _Repo.getRepoList(loginName!);
    if (apiResult != null) {
      final List<dynamic> rawData = apiResult;
      RxRepoList = rawData.map((e) => RepoModel.fromJson(e)).toList().obs;
      isLoading.toggle();
    } else {
      Get.snackbar("Alert", "something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 4),
          margin: EdgeInsets.all(40),
          icon: Icon(Icons.info_outline, color: Colors.white),
          colorText: Colors.white,
          backgroundColor: Colors.red);
      isLoading.toggle();
    }
  }
}
