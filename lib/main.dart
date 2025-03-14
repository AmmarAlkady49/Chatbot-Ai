import 'package:chatbot_ai/utils/route/app_router.dart';
import 'package:chatbot_ai/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Chatbot AI',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
