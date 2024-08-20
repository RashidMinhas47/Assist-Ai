import 'package:assist_ai/components/app_theme.dart';
import 'package:assist_ai/provider/theme_provider.dart';
import 'package:assist_ai/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,ref) {
    final appThemePro = ref.watch(appThemeStateNotifier);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appThemePro.isDarkModeEnabled ?ThemeMode.dark :ThemeMode.light,
      home: const Home(),
    );
  }
}


// ThemeData.light(        useMaterial3: true,
// ).copyWith(
// //TODO:theme sets colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// )