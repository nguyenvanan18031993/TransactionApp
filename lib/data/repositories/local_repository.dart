import 'package:flutter/material.dart';
import 'package:transaction_app/data/local/local_services.dart';

class LocalRepository {
  final LocalService localService;

  LocalRepository(this.localService);

  Future<bool> checkIsLogedIn() async {
    try {
      final isLogedIn = await localService.checlIsLogedIn();
      if (isLogedIn == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('Error when get data local');
      return false;
    }
  }
}
