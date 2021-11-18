import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toto_app/src/ui/providers/providers.dart';
import 'package:toto_app/src/utils/theme.dart';
import 'package:provider/provider.dart';

import './ui/screens/screens.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390.0, 844.0),
      builder: () {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => TodoManager())
          ],
          child: MaterialApp(
            theme: AppTheme.light(),
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}
