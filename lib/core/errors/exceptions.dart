class ServerException implements Exception {
  final String message;

  ServerException({
    this.message = 'Server error',
  });
}

class NetworkException implements Exception {
  final String message;

  NetworkException({
    this.message = 'No internet connection',
  });
}

class RequestTimeoutException implements Exception {
  final String message;

  RequestTimeoutException({
    this.message = 'Request timeout',
  });
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException({
    this.message = 'Data not found',
  });
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException({
    this.message = 'Unauthorized',
  });
}

class BadRequestException implements Exception {
  final String message;

  BadRequestException({
    this.message = 'Bad request',
  });
}

class UnknownException implements Exception {
  final String message;

  UnknownException({
    this.message = 'Unexpected error',
  });
}