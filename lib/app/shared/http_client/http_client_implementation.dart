import 'package:http/http.dart' as http;

import 'http_client.dart';

class HttpClientImpl implements IHttpClient {
  final http.Client httpClient;
  HttpClientImpl({required this.httpClient});

  @override
  Future<HttpResponse> get({String? path}) async {
    final response = await httpClient.get(Uri.parse(path!));
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(
      {String? path,
      Map<String, dynamic>? data,
      Map<String, String>? headers}) async {
    final response =
        await httpClient.post(Uri.parse(path!), body: data, headers: headers);
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}
