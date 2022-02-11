import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/services/firestore.dart';
import 'package:test/services/models.dart';
import 'firebase_options.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:test/routes.dart';
import 'package:test/theme.dart';

import 'shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Text('error', textDirection: TextDirection.ltr);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider(
            create: (_) => FirestoreService().streamReport(),
            catchError: (_, __) => null,
            initialData: Report(),
            child: MaterialApp(
              debugShowCheckedModeBanner: true,
              routes: appRoutes,
              theme: appTheme,
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Loader();
      },
    );
  }
}
