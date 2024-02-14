import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:provider/provider.dart';
import 'package:recipes/firebase_options.dart';
import 'package:recipes/view/pages/splash.page.dart';
import 'package:recipes/provider/ad_provider.dart';
import 'package:recipes/provider/app_auth_provider.dart';
import 'package:recipes/provider/ingredients_provider.dart';
import 'package:recipes/provider/recipes_provider.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    var preference = await SharedPreferences.getInstance();

    GetIt.I.registerSingleton<SharedPreferences>(preference);

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {}
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AppAuthProvider()),
    ChangeNotifierProvider(create: (_) => AdsProvider()),
    ChangeNotifierProvider(create: (_) => IngredientsProvider()),
    ChangeNotifierProvider(create: (_) => RecipesProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlayKit(
      child: MaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        initialRoute: '/',
        // onGenerateRoute: (RouteSettings settings) {
        //   return MaterialPageRoute(builder: (context) {
        //     return BouncingScrollWrapper.builder(
        //         context, buildPage(settings.name ?? ''),
        //         dragWithMouse: true);
        //   });
        // },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Hellix',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xffF55A00),
            primary: const Color(0xffF55A00),
          ),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
