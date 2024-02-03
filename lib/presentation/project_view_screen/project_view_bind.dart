import 'package:githublogin/export.dart';
class ProjectViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectViewController());
    // TODO: implement dependencies
  }
}
