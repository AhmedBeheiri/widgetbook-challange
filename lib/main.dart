import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:widgetbook_challenge/app.dart';
import 'package:widgetbook_challenge/injection_container.dart' as di;

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    log('${record.loggerName}: ${record.message}',
        level: record.level.value, name: record.level.name, time: record.time);
  });
  di.configureInjection();
  runApp(const App());
}
