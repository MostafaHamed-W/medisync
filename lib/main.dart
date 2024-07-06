import 'package:flutter/material.dart';
import 'package:medisync/core/routing/app_router.dart';
import 'package:medisync/medisync.dart';

void main() {
  runApp(
    MediSync(
      appRouter: AppRouter(),
    ),
  );
}
