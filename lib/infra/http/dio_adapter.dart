import 'package:dio/dio.dart';
import 'package:test_app/infra/http/client_adapter.dart';
import 'package:test_app/infra/http/http_failures.dart';

class DioAdapter implements ClientAdapter {
  final Dio client;

  DioAdapter({required this.client});

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    Map<String, dynamic>? body,
    Map? headers,
    Map? params,
  }) async {
    final defaultParams = params?.cast<String, String>() ?? {};
    final defaultHeader = headers?.cast<String, String>() ?? {};

    Response response =
        Response(statusCode: 500, requestOptions: RequestOptions());

    Future<Response>? futureResponse;
    try {
      if (method == 'post') {
        futureResponse = client.post(url,
            data: body,
            queryParameters: defaultParams,
            options: Options(headers: defaultHeader));
      } else if (method == 'get') {
        futureResponse = client.get(url,
            queryParameters: defaultParams,
            options: Options(headers: defaultHeader));
      } else if (method == 'put') {
        futureResponse = client.put(url,
            data: body,
            queryParameters: defaultParams,
            options: Options(headers: defaultHeader));
      } else if (method == 'patch') {
        futureResponse = client.patch(url,
            data: body,
            queryParameters: defaultParams,
            options: Options(headers: defaultHeader));
      } else if (method == 'delete') {
        futureResponse =
            client.delete(url, options: Options(headers: defaultHeader));
      }
      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 10));
      }
    } on DioError catch (error) {
      response = error.response!;
    }
    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data.isEmpty ? null : response.data;
      case 204:
        return response.data ?? {"done": true};
      case 400:
        throw BadRequestFailure(response.data);
      case 401:
      case 403:
        throw UnauthorizedFailure(response.data);
      case 404:
        throw NotFoundFailure(response.data);
      case 500:
        throw ServerExeption(response.data);
      default:
        throw DefaultFailures({
          "error":
              "Nosso sistema está com problemas, tente novamente mais tarde"
        });
    }
  }
}
