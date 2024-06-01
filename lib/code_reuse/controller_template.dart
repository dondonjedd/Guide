import 'dart:developer';

class LazySingleton {
  static LazySingleton? _instance;
  LazySingleton._internal() {
    log('instance of LazySingleton created');
    _instance = this;
  }
  factory LazySingleton() => _instance ?? LazySingleton._internal();
}
