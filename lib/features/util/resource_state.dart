abstract class ResourceState<T> {
  final T? data;
  final String? error;
  const ResourceState({this.data, this.error});
}

class SuccessResource<T> extends ResourceState<T> {
  const SuccessResource(T data) : super(data: data);
}

class FailureResource<T> extends ResourceState<T> {
  const FailureResource(String error) : super(error: error);
}