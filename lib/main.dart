import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart'
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quizzoxo/routes.dart';
import 'package:quizzoxo/services/firestore.dart';
import 'package:quizzoxo/services/models.dart';
import 'package:quizzoxo/theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
      //   const ProviderScope(child: MyApp()),
      const MyApp());
}

final Future<FirebaseApp> _initialization = Firebase.initializeApp();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider(
              create: (_) => FirestoreService().streamReport(),
              initialData: Report(),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'quizzoxo',
                theme: appTheme,
                routes: appRoutes,
              ));
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
