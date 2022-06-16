import 'package:book_app/src/core/shared/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const String initialRoute = '/';
  const routeSetting = RouteSettings(name: '/');
  const routeSettingNull = RouteSettings(name: null);

  group('Routers - initialRoute', () {
    test('Should return initial route', () async {
      final result = Routers.initialRoute;

      expect(result, initialRoute);
    });
  });
  group('Routers - routes', () {
    test('Should return routes', () async {
      final result = Routers.routes;

      expect(
          result, isA<Map<String, Widget Function(BuildContext, dynamic)>>());
    });
  });

  group('Routers - generateRoutes', () {
    test('Should return Route', () async {
      const result = Routers.generateRoutes;

      expect(result, isA<Route<dynamic>? Function(RouteSettings)>());
    });
    test('Should return MaterialPageRoute', () async {
      final result = Routers.generateRoutes(routeSetting);

      expect(result, isA<MaterialPageRoute>());
    });

    test('Should return  null', () async {
      final result = Routers.generateRoutes(routeSettingNull);

      expect(result, null);
    });
  });
}
