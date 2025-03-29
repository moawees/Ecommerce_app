import 'package:carto/core/cache/cache_helper.dart';
import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Ensure token is retrieved dynamically
    String? token = CacheHelper().getDataString(key: "token");

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['Content-Type'] = 'application/json';

    print('Request: ${options.method} ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      print("Unauthorized! Token expired.");
      // Handle token refresh logic here if applicable
    }
    super.onError(err, handler);
  }
}
