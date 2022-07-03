import 'package:flutter/material.dart';
import 'package:mocktail_test/features/repositories/repository.dart';

class HomeController {
  final ValueNotifier<int> _counterNotifier = ValueNotifier<int>(0);
  final Repository repository;

  int get counter => _counterNotifier.value;

  ValueNotifier<int> get counterNotifier => _counterNotifier;

  HomeController(this.repository);

  void incrementCounter() {
    _counterNotifier.value++;
  }

  Future<bool> saveCounter() async {
    return repository.saveInt('counter', counter);
  }

  Future<void> getCounter() async {
    _counterNotifier.value =  await repository.getInt('counter');
  }
}
