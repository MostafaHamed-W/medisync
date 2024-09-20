import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medisync/core/routing/app_router.dart';
import 'package:medisync/core/routing/routes.dart';
import 'package:medisync/core/theming/colors.dart';

class MediSync extends StatelessWidget {
  final AppRouter appRouter;
  const MediSync({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'MediSync',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.homeScreen,
      ),
    );
  }
}
