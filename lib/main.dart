import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sneakerapp/firebase_options.dart';
import 'package:sneakerapp/provider/userprovider.dart';
import 'package:sneakerapp/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:sneakerapp/view/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider<CartProvider>(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoesly',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
