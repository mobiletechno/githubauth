import 'dart:ui';
class AppConstant {
  // Api section
  static String BASEURL = "https://api.github.com/";

  // Screen size section

  static double MOBILEHEIGHT = 0.0;
  static double MOBILEWIDTH = 0.0;
  static double RESPONSIVEHEIGHT = 0.0;
  static double RESPONSIVEWIDTH = 0.0;

  // route section
  static String HOME_NAME = "/home";
  static String PROJECTVIEW_NAME = "/home/project_view";
  static String LOGIN_NAME = "/Login";

  //assets
  static String LOGIN_GITHUB_LOGO = "assets/github_logo_text.png";
  static String LOGIN_PC_LOGO = "assets/pc_logo.png";
  static String GITHUB_LOADING = "assets/github_loader.gif";
  static String FOLDER_ASSET = "assets/folder_asset.png";
  static String AUTHOR_ASSET = "assets/author.png";

//App colors
  static Color SECONDARY_COLOR = Color(0xFF5F607E);
  static Color SIGNINBUTTON_COLOR = Color(0xFF706CFF);

//sharedPreference
  static String APPDATA_GETSTORAGE = "appStorage";
  static String APPDATA_DISPLAYNAME = "displayName";
  static String APPDATA_USERNAME = "userName";
  static String APPDATA_ORGURL = "orgUrl";
  static String APPDATA_ACCESS_TOKEN = "accessToken";
  static String APPDATA_ISLOGGEDIN = "isLoggedIn";
  static String APPDATA_PHOTOURL = "photoURL";
}
