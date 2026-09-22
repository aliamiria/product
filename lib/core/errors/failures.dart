abstract class Failures {
  final String message;

  Failures({required this.message});

}
class ServerFailure extends Failures{
  ServerFailure({required super.message});
}
class NetworkFailure extends Failures{
  NetworkFailure({required super.message});
}
class ParsingFailure extends Failures{
  ParsingFailure({required super.message});
}