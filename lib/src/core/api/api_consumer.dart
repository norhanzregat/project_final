abstract class ApiConsumer {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});

  Future<dynamic> post(
      String path, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? body, required Map<String, String> headers,
      });

  Future<dynamic> put(
      String path, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? body,
      });
}
