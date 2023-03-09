abstract class ClientAdapter<R> {
  Future<R> request({
    required String url,
    required String method,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
  });
}
