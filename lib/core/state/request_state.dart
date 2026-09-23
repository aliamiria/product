enum Status {
  initial,
  loading,
  success,
  error,
}
class RequestState<T>{
  final Status status ;
  final String error ;
  final T?   data ;

 const RequestState({ this.status=Status.initial,  this.error='',  this.data});

  RequestState copyWith({
    Status? status,
    String? error,
    T? data,
  }) {
    return RequestState(
      status: status ?? this.status,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

}