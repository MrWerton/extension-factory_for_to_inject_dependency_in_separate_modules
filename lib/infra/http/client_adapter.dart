abstract class ClientAdapter<T> {
  Future<T?> request({
    required String url,
    required String method,
    Map<String, dynamic>? body,
    Map? headers,
    Map? params,
  });
}
