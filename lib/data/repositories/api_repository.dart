import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:transaction_app/data/api/api_services.dart';
import 'package:transaction_app/data/api/endpoint.dart';
import 'package:transaction_app/data/exceptions/api_exception.dart';

import 'i_repository.dart';

class ApiRepository implements IRepository {
  final ApiService apiService;

  ApiRepository(this.apiService);

  @override
  Future<Either<ApiException, Map<String, dynamic>>> fetchData() async {
    try {
      final response = await apiService.getData(Endpoints.transactionURI);
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left(ApiException.fromJson(json.decode(response.body)));
      }
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, Map<String, dynamic>>> postData() async {
    try {
      final response = await apiService.postData(Endpoints.transactionURI);
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left(ApiException.fromJson(json.decode(response.body)));
      }
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
