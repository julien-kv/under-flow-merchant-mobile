import 'dart:io' show Platform;

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  Config._();

  // base url
  static final String baseUrl = dotenv.get('BASE_URL');
  static final String baseAuthUrl = dotenv.get('AUTH_URL');

  // receiveTimeout
  static const int receiveTimeout = 30000;

  // connectTimeout
  static const int timeout = 30000;
  static const String TOKEN = 'authToken';
}
