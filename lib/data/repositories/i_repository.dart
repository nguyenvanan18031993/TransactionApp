import 'package:transaction_app/data/exceptions/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IRepository {
  Future<Either<ApiException, Map<String, dynamic>>> fetchData();

  Future<Either<ApiException, Map<String, dynamic>>> postData();
}
