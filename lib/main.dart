import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/random_facts/providers/facts_provider.dart';
import 'package:flutter_application_1/features/random_facts/pages/random_facts_screen.dart';
import 'package:flutter_application_1/global/constants.dart';
import 'package:flutter_application_1/global/pages/home_page.dart';
import 'package:flutter_application_1/global/providers/router_provider.dart';
import 'package:provider/provider.dart';

import 'global/components/botttomNavBar.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => RouterProvider()),
      ChangeNotifierProvider(create: (_) => FactsProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alego App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NavigationHandler(),
    );
  }
}

class NavigationHandler extends StatefulWidget {
  const NavigationHandler({Key? key}) : super(key: key);

  @override
  State<NavigationHandler> createState() => _NavigationHandlerState();
}

class _NavigationHandlerState extends State<NavigationHandler> {
  final curIndex = 0;

  final pages = const [
    HomePage(),
    FactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: IndexedStack(
        children: pages,
        index: context.watch<RouterProvider>().curIndex,
      ),
    );
  }
}
