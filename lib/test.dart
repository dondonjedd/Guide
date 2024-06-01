import 'dart:developer';

class MySingleton {
  static MySingleton? _instance;
  MySingleton._internal() {
    log('instance of MySingleton created');
    _instance = this;
  }
  factory MySingleton() => _instance ?? MySingleton._internal();
}
