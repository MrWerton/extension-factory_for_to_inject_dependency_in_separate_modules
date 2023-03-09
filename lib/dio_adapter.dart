import 'package:dio/dio.dart';
import 'package:test_app/client_adapter.dart';
import 'package:test_app/http_failures.dart';

class DioHttpAdapter implements ClientAdapter<Response> {
  final Dio _dio;

  DioHttpAdapter({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Response> request({
    required String url,
    required String method,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _dio.request(
        url,
        data: body,
        queryParameters: params,
        options: Options(
          method: method,
        ),
      );
      return response;
    } on DioError catch (e) {
      final errorResponse = e.response;

      if (errorResponse != null) {
        final statusCode = errorResponse.statusCode;
        final error = errorResponse.data;

        switch (statusCode) {
          case 400:
            throw BadRequestFailure(error);
          case 401:
            throw UnauthorizedFailure(error);
          case 404:
            throw NotFoundFailure(error);
          case 500:
            throw ServerExeption(error);
        }
      }

      throw DefaultFailures({
        "error": "Nosso sistema está com problemas, tente novamente mais tarde"
      });
    }
  }
}
