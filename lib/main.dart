import 'package:githublogin/export.dart';
Future<void> main() async {
  await GetStorage.init(AppConstant.APPDATA_GETSTORAGE);
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(appdata());
  Get.put(RepoImpl());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppConstant.MOBILEHEIGHT = MediaQuery.of(context).size.height;
    AppConstant.MOBILEWIDTH = MediaQuery.of(context).size.width;
    AppConstant.RESPONSIVEHEIGHT = AppConstant.MOBILEHEIGHT * 0.01;
    AppConstant.RESPONSIVEWIDTH = AppConstant.MOBILEWIDTH * 0.01;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      getPages: Approutes.list,
      initialRoute: AppConstant.LOGIN_NAME,
    );
  }
}
