import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import './Screens/Home_Page.dart';

bool isDark = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;

  void fun(){
    if(savedThemeMode==AdaptiveThemeMode.dark){
      isDark = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    fun();
    return AdaptiveTheme(
      light: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              },
            ),
      ),
      dark: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              },
            ),
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Donation Tracker',
        theme: theme,
        darkTheme: darkTheme,
        home: const HomePage(),
      ),
    );
  }
}

//*****************************************************************************

