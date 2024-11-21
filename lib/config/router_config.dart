import 'package:go_router/go_router.dart';
import 'package:nbrb_curs/pages/converter_age.dart';
import 'package:nbrb_curs/pages/home_page.dart';

final GoRouter routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'converter',
          builder: (context, state) => const CurrencyConverterPage(),
        ),
      ],
    ),
  ],
);
