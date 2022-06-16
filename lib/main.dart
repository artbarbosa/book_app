import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app_widget.dart';
import 'src/core/shared/inject/inject.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  Inject.initialize();

  runApp(const AppWidget());
}
