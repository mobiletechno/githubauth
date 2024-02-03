import 'package:githublogin/export.dart';
class Approutes {
  static var list = [
    GetPage(
        name: AppConstant.LOGIN_NAME,
        page: () => Login(),
        binding: LoginBinding()),
    GetPage(
        name: AppConstant.HOME_NAME,
        page: () => Home(),
        binding: HomeBinding()),
    GetPage(
        name: AppConstant.PROJECTVIEW_NAME,
        page: () => ProjectView(),
        binding: ProjectViewBinding()),
  ];
}
