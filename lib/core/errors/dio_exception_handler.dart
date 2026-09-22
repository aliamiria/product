import 'package:dio/dio.dart';

import 'exceptions.dart';

class DioExceptionHandler {
  static Exception handle(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout||
   e.type == DioExceptionType.sendTimeout||
    e.type == DioExceptionType.receiveTimeout) {
      return RequestTimeoutException();
    }

    if (e.type == DioExceptionType.connectionError) {
      return NetworkException();
    }

    if (e.type == DioExceptionType.badResponse) {
      final statusCode = e.response?.statusCode;

      if (statusCode == 400) {
        return BadRequestException();
      }

      if (statusCode == 401) {
        return UnauthorizedException();
      }

      if (statusCode == 404) {
        return NotFoundException();
      }

      if (statusCode != null && statusCode >= 500) {
        return ServerException();
      }
    }

    return UnknownException();
  }
}