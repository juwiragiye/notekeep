import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:notekeep/firebase_options.dart';
import 'package:notekeep/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: FlexThemeData.light(scheme: FlexScheme.blueWhale),
    // The Mandy red, dark theme.
    darkTheme: FlexThemeData.dark(scheme: FlexScheme.sakura),
    // Use dark or light theme based on system setting.
    themeMode: ThemeMode.system,
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                print(FirebaseAuth.instance.currentUser);
                return const Text("DONE");
              default:
                return const Text('Loading.....');
            }
          },
        ),
      ),
    );
  }
}
