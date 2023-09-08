import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:simple_webapp/app/core/providers/services_providers.dart';

import 'core/providers/services_providers.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appService = ref.read(appServiceProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: appService.appRouter.routerDelegate,
      routeInformationParser: appService.appRouter.routeInformationParser,
      routeInformationProvider: appService.appRouter.routeInformationProvider,
      theme: ThemeData(fontFamily: 'NotoSansKR'),
    );
  }
}
