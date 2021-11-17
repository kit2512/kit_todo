import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toto_app/src/utils/theme.dart';

import './ui/screens/screens.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390.0, 844.0),
      builder: () {
        return MaterialApp(
          theme: AppTheme.light(),
          home: const HomeScreen(),
        );
      },
    );
  }
}
