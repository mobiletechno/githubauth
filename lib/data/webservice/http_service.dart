import 'package:http/http.dart';
abstract class HttpService {
  Future<Response> getRequest(String url);
}
