import 'package:githublogin/export.dart';
class Login extends StatelessWidget {
  final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => controller.isLoading.isTrue
              ? Center(
                  child: Image(
                  image: AssetImage(AppConstant.GITHUB_LOADING),
                ))
              : Column(children: [
                  Spacer(flex: 1),
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          AppConstant.RESPONSIVEWIDTH * 20,
                          AppConstant.RESPONSIVEWIDTH * 4,
                          AppConstant.RESPONSIVEWIDTH * 20,
                          AppConstant.RESPONSIVEWIDTH * 4),
                      child: Image(
                          image: AssetImage(AppConstant.LOGIN_GITHUB_LOGO))),
                  Spacer(flex: 1),
                  Image(image: AssetImage(AppConstant.LOGIN_PC_LOGO)),
                  Spacer(flex: 1),
                  Text("Lets built from here ...",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstant.RESPONSIVEWIDTH * 6,
                          color: AppConstant.SECONDARY_COLOR)),
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          AppConstant.RESPONSIVEWIDTH * 4,
                          AppConstant.RESPONSIVEWIDTH * 1,
                          AppConstant.RESPONSIVEWIDTH * 4,
                          AppConstant.RESPONSIVEWIDTH * 1),
                      child: Text(
                          "Our platform drives innovation with tools that boost developer velocity",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: AppConstant.RESPONSIVEWIDTH * 4,
                              color: AppConstant.SECONDARY_COLOR))),
                  Spacer(flex: 1),
                  Material(

                      //Wrap with Material
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              AppConstant.RESPONSIVEWIDTH * 4)),
                      elevation: AppConstant.RESPONSIVEWIDTH * 2,
                      color: AppConstant.SIGNINBUTTON_COLOR,
                      clipBehavior: Clip.antiAlias,
                      child: MaterialButton(
                          minWidth: AppConstant.RESPONSIVEWIDTH * 80,
                          child: Text("Sign in with Github",
                              style: TextStyle(
                                  fontSize: AppConstant.RESPONSIVEWIDTH * 4,
                                  color: Colors.white)),
                          onPressed: () async {
                            try {
                              if (context.mounted) {
                                controller.getGithubAccountdata();
                              }
                            } catch (e) {}
                          })),
                  Spacer(flex: 1),
                ]),
        ));
  }
}
