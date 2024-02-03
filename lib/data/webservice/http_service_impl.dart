import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:githublogin/app_config/app_constant.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';
import '../storage/app_data.dart';
import 'http_service.dart';
class HttpServiceImplementation extends HttpService {
  @override
  Future<Response> getRequest(String url) async {
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${Get.find<appdata>().box.read("${AppConstant.APPDATA_ACCESS_TOKEN}")}',
        'X-GitHub-Api-Version': '2022-11-28'
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return response;
  }
}
