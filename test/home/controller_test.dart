import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_test/features/home/controller.dart';
import 'package:mocktail_test/features/repositories/repository.dart';
import 'package:mocktail/mocktail.dart';

class SharedPreferencesMock extends Mock implements Repository {}

void main() {
  final SharedPreferencesMock mock = SharedPreferencesMock();
  final HomeController controller = HomeController(mock);

  setUpAll(() {
    when(() => mock.getInt(any())).thenAnswer((invocation) => Future.value(0));
    when(() => mock.saveInt(any(), any()))
        .thenAnswer((invocation) => Future.value(true));
  });

  test('counter is 0', () {
    expect(0, controller.counter);
  });

  test('getCounter should throw Exception', () {
    when(() => mock.getInt(any())).thenAnswer((invocation) => throw Exception());
    expect(() => controller.getCounter(), throwsA(isA<Exception>()));
  });

  test('getCounter should return 0', () async {
    when(() => mock.getInt(any())).thenAnswer((invocation) => Future.value(0));
    await controller.getCounter();
    expect(controller.counter, 0);
  });

  test('saveCounter should return true', () async {
    expect(await controller.saveCounter(), isTrue);
  });
}
