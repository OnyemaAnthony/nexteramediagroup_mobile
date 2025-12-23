import 'package:flutter/material.dart';
import 'package:nexteramediagroup_mobile/core/injection_container.dart'
    as injection;
import 'package:nexteramediagroup_mobile/core/logger.dart';
import 'package:nexteramediagroup_mobile/presentation/providers/user_provider.dart'
    show BusinessProvider, UserProvider;
import 'package:nexteramediagroup_mobile/presentation/screens/user_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.initializeDependence();
  logger.d('dependence initialized');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => injection.sl<UserProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const UserScreen(),
      ),
    );
  }
}
