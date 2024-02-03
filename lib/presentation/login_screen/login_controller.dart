import 'package:githublogin/export.dart';
class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  @override
  onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
    if (Get.find<appdata>().box.read(AppConstant.APPDATA_ISLOGGEDIN)) {
      Get.offAllNamed(AppConstant.HOME_NAME);
    }
  }

  Future<void> getGithubAccountdata() async {
    isLoading.toggle();
    UserCredential userCredential = await signInWithGithub();
    Get.find<appdata>().box.write(
        AppConstant.APPDATA_DISPLAYNAME, userCredential.user!.displayName);
    Get.find<appdata>().box.write(AppConstant.APPDATA_USERNAME,
        userCredential.additionalUserInfo!.profile!["login"]);
    Get.find<appdata>().box.write(AppConstant.APPDATA_ORGURL,
        userCredential.additionalUserInfo!.profile!["organizations_url"]);
    Get.find<appdata>().box.write(AppConstant.APPDATA_ACCESS_TOKEN,
        userCredential.credential!.accessToken!);
    Get.find<appdata>().box.write(AppConstant.APPDATA_ISLOGGEDIN, true);
    Get.find<appdata>()
        .box
        .write(AppConstant.APPDATA_PHOTOURL, userCredential.user!.photoURL!);
    Get.offAllNamed(AppConstant.HOME_NAME);
    isLoading.toggle();
  }

  Future<UserCredential> signInWithGithub() async {
    GithubAuthProvider githubAuthProvider = GithubAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(githubAuthProvider);
  }
}
