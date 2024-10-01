import 'package:flutter/material.dart';
import 'package:medisync/core/di/dependency_injection.dart';
import 'package:medisync/core/helpers/constants.dart';
import 'package:medisync/core/helpers/extensions.dart';
import 'package:medisync/core/helpers/shared_preferences_helper.dart';
import 'package:medisync/core/routing/app_router.dart';
import 'package:medisync/medisync.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await checkLoggedInUser();
  runApp(
    MediSync(
      appRouter: AppRouter(),
    ),
  );
}

checkLoggedInUser() async {
  final String? userToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (userToken.isNullOrEmpty()) {
    isLoggedInUser = false;
  } else {
    isLoggedInUser = true;
  }
}
