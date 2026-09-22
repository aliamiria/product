 import 'exceptions.dart';
import 'failures.dart';

class  ErrorHandler {
     static Failure mapExceptionToFailure(
         Exception exception,
         ) {
       if (exception is NetworkException) {
         return NetworkFailure(
           exception.message,
         );
       }

       if (exception is RequestTimeoutException) {
         return TimeoutFailure(
           exception.message,
         );
       }

       if (exception is UnauthorizedException) {
         return UnauthorizedFailure(
           exception.message,
         );
       }

       if (exception is NotFoundException) {
         return NotFoundFailure(
           exception.message,
         );
       }

       if (exception is BadRequestException) {
         return BadRequestFailure(
           exception.message,
         );
       }

       if (exception is ServerException) {
         return ServerFailure(
           exception.message,
         );
       }

       if (exception is UnknownException) {
         return UnknownFailure(
           exception.message,
         );
       }

       return const UnknownFailure(
         'Unexpected error occurred',
       );
     }
 }