import 'dart:convert' as convert;
import 'package:githublogin/export.dart';
class RepoImpl implements Repo {
  HttpService? _httpService;
  RepoImpl() {
    this._httpService = Get.put(HttpServiceImplementation());
  }

  @override
  Future<dynamic> getOrganisationList() async {
    try {
      final response = await _httpService!.getRequest(
          "${Get.find<appdata>().box.read(AppConstant.APPDATA_ORGURL)}");

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        return jsonResponse;
      } else {
        automaticLogout();
      }
    } on Exception catch (e) {
      automaticLogout();
    }
  }

  @override
  Future<dynamic> getRepoList(String organisationName) async {
    try {
      final response = await _httpService!
          .getRequest("${AppConstant.BASEURL}orgs/${organisationName}/repos");

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        return jsonResponse;
      } else {
        automaticLogout();
      }
    } on Exception catch (e) {
      automaticLogout();
    }
  }

  @override
  Future<dynamic> getBranchList(
      String organisationName, String repoName) async {
    try {
      final response = await _httpService!.getRequest(
          "${AppConstant.BASEURL}repos/$organisationName/$repoName/branches");
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        return jsonResponse;
      } else {
        automaticLogout();
      }
    } on Exception catch (e) {
      automaticLogout();
    }
  }

  @override
  Future<dynamic> getCommitList(
      String organisationName, String repoName, String branchName) async {
    try {
      final response = await _httpService!.getRequest(
          "${AppConstant.BASEURL}repos/$organisationName/$repoName/commits?sha=$branchName");
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        return jsonResponse;
      } else {
        automaticLogout();
      }
    } on Exception catch (e) {
      automaticLogout();
    }
  }

  Future<void> automaticLogout() async {
    Get.find<appdata>().box.erase();
    Get.offAllNamed(AppConstant.LOGIN_NAME);
  }
}
