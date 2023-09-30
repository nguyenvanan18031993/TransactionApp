import 'package:flutter/material.dart';
import 'package:transaction_app/my_app.dart';
import 'package:transaction_app/services/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
  runApp(const MyApp());
}
