import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_sample/app/routes/router.gr.dart';
import 'package:rick_and_morty_sample/generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    child: RickAndMortyApp(),
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('de', 'DE'),
    ],
    path: 'assets/translations',
    fallbackLocale: const Locale('en', 'US'),
    assetLoader: const CodegenLoader(),
    saveLocale: true,
  ));
}

class RickAndMortyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  RickAndMortyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
