import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure({required this.errMessage});
}

class NetworkFailure extends Failure {
  NetworkFailure({required String message}) : super(errMessage: message);
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(errMessage: message);
}

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
          return NetworkFailure(
              message: 'Connection error. Please check your internet.');

        case DioExceptionType.sendTimeout:
          return NetworkFailure(message: 'Send timeout.');

        case DioExceptionType.receiveTimeout:
          return NetworkFailure(message: 'Receive timeout.');

        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);

        case DioExceptionType.cancel:
          return NetworkFailure(message: 'Request cancelled.');

        case DioExceptionType.unknown:
          return NetworkFailure(message: 'Unknown network error.');

        default:
          return NetworkFailure(
              message: 'Something went wrong, please try again later.');
      }
    } else {
      return ServerFailure(message: 'Unexpected error occurred.');
    }
  }

  static Failure _handleError(dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data.containsKey('message') && data['message'] is String) {
        return ServerFailure(message: data['message']);
      }

      if (data.containsKey('errors') && data['errors'] is List) {
        List<String> errorMessages = (data['errors'] as List)
            .where((e) =>
                e is Map<String, dynamic> &&
                e.containsKey('msg') &&
                e['msg'] is String)
            .map((e) => e['msg'] as String)
            .toList();

        if (errorMessages.isNotEmpty) {
          return ServerFailure(message: errorMessages.join("\n"));
        }
      }
    }
    return ServerFailure(message: 'Unexpected error format.');
  }
}
