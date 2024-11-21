import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nbrb_curs/blocs/current_courses_bloc/current_courses_bloc.dart';
import 'package:nbrb_curs/blocs/localizatio_bloc/localizatio_cubit.dart';
import 'package:nbrb_curs/config/constants.dart';
import 'package:nbrb_curs/config/router_config.dart';
import 'package:nbrb_curs/generated/l10n.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocalizationBloc()),
        BlocProvider(
            create: (_) => CurrentCoursesBloc()..add(LoadCurrentCourses())),
      ],
      child: BlocBuilder<LocalizationBloc, Locale>(
        builder: (context, locale) {
          return MaterialApp.router(
            title: '123',
            theme: theme,
            debugShowCheckedModeBanner: false,
            routerConfig: routerConfig,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ru'),
              Locale('en'),
            ],
            locale: locale,
          );
        },
      ),
    );
  }
}
