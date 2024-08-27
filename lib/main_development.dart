import 'package:flutter/material.dart';
import 'package:medisync/core/di/dependency_injection.dart';
import 'package:medisync/core/routing/app_router.dart';
import 'package:medisync/medisync.dart';

void main() {
  setupGetIt();
  runApp(
    MediSync(
      appRouter: AppRouter(),
    ),
  );
}
