import '../../models/commit_list_model.dart' as CommitModel;
import 'package:githublogin/export.dart';
import 'package:intl/intl.dart';
class ProjectViewController extends GetxController {
  RxBool isLoading = false.obs;
  late Repo _Repo;
  RxInt selectedIndex = 0.obs;
  dynamic Arguments = Get.arguments;
  var projectName;
  var ownerName;
  var photoUrl;
  var lastDate;
  RxList<BranchListModel> RxBranchList = RxList();
  RxList<CommitModel.CommitListModel> RxCommitList = RxList();

  @override
  onInit() {
    super.onInit();
    projectName = Arguments[0]["projectName"];
    ownerName = Arguments[0]["owner"];
    photoUrl = Arguments[0]["photoUrl"];
    String utcTimestamp = Arguments[0]["lastUpdate"];
    DateTime dateTime = DateTime.parse(utcTimestamp).toLocal();

    // Format the DateTime object to the desired format
    String formattedDate = DateFormat('dd/MM/yyyy hh:mma').format(dateTime);
    lastDate = formattedDate;
    _Repo = Get.find<RepoImpl>();
    getBranchList();
  }

  void changeSelectedIndexAt(int indexAt) {
    selectedIndex = indexAt.obs;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getBranchList() async {
    isLoading.toggle();
    var apiResult = await _Repo.getBranchList(ownerName, projectName);
    if (apiResult != null) {
      final List<dynamic> rawData = apiResult;
      RxBranchList =
          rawData.map((e) => BranchListModel.fromJson(e)).toList().obs;
      getCommitList(ownerName, projectName, RxBranchList[0].name);
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

  Future<void> getCommitList(
      String ownerName, String projectName, String? branchName) async {
    isLoading.toggle();
    var apiResult =
        await _Repo.getCommitList(ownerName, projectName, branchName!);
    if (apiResult != null) {
      final List<dynamic> rawData = apiResult;
      RxCommitList = rawData
          .map((e) => CommitModel.CommitListModel.fromJson(e))
          .toList()
          .obs;
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

  String convertDateTime(String? Datetime) {
    String utcTimestamp = Datetime!;
    DateTime dateTime = DateTime.parse(utcTimestamp).toLocal();
    // Format the DateTime object to the desired format
    String formattedDate = DateFormat('dd/MM/yyyy hh:mma').format(dateTime);
    return formattedDate;
  }
}
