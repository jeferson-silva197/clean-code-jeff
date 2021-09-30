import 'package:dio/dio.dart';

import 'package:comercio_clean_architecture/app/shared/http_client/http_client.dart';

class DioImpl implements IHttpClient {
  final Dio dio;
  DioImpl({
    required this.dio,
  });

  @override
  Future<HttpResponse> get({String? path}) async {
    final response = await dio.get(path!);
    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(
      {String? path,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers}) async {
    final response =
        await dio.post(path!, data: data, options: Options(headers: headers));
    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }
}
