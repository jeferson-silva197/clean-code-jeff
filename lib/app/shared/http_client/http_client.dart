abstract class IHttpClient {
  Future<HttpResponse> get({String? path});
  Future<HttpResponse> post(
      {String path, Map<String, dynamic> data, Map<String, String> headers});
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({this.data, required this.statusCode});
}
