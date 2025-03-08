import 'package:carto/app/carto_app.dart';
import 'package:carto/core/router/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) =>  CartoApp(
      appRouter: AppRouter(),
    ),
  ));
}
