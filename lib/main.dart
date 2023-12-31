import 'package:art_of_event/Core/Network/APIS/my_dio.dart';
import 'package:art_of_event/Core/Shared%20Preferences/shared_preferences.dart';
import 'package:art_of_event/Features/Main%20Screen/Presentation/main_screen.dart';
import 'package:art_of_event/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyShared.init();
  await MyDio.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale(MyShared.getCurrentLanguage()),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'poppins',
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MainScreen(),
          builder: EasyLoading.init(),

        );
      }
    );
  }
}


