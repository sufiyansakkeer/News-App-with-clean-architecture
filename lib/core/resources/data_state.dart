import 'package:dio/dio.dart';

/// network call response. we have success and error when we calling APIs etc
abstract class DataState<T> {
  final T? data;
  final DioException? error;

  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(DioException error) : super(error: error);
}
