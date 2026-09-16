import 'package:clean_arch/core/errors/failure.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: 'connection timeout with API server',
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'send timeout with API server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'badCertificate with API server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: e.response?.statusCode ?? 0,
          response: e.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          errorMessage: 'Request to API server was cancelled',
        );
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: 'Unexpected error occurred');
      case DioExceptionType.transformTimeout:
        return ServerFailure(errorMessage: 'transformTimeout with API server');
    }
  }

  factory ServerFailure.fromResponse({
    required int statusCode,
    required dynamic response,
  }) {
    if (statusCode == 404) {
      return ServerFailure(errorMessage: 'request not found, please try later'); 
    }
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 429) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 500) {
      return ServerFailure(errorMessage: 'internal server error');
    } else {
      return ServerFailure(errorMessage: 'Oops there was an error');
    }
  }
}
