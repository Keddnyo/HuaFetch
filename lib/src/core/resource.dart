abstract class Resource<T> {
  const Resource({this.data, this.error});

  final T? data;
  final Object? error;
}

class DataResource<T> extends Resource<T> {
  const DataResource(T data) : super(data: data);
}

class ErrorResource<T> extends Resource<T> {
  const ErrorResource(Object? error) : super(error: error);
}
