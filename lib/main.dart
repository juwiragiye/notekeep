import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:notekeep/firebase_options.dart';

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
                final user = FirebaseAuth.instance.currentUser;
                if (user?.emailVerified ?? false) {
                  return const Text("Done");
                } else {
                  print("You need to verify your email");
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const VerfifyEmailView(),
                    ),
                  );
                }
                return const Text("Done");

              default:
                return const Text('Loading.....');
            }
          },
        ),
      ),
    );
  }
}

class VerfifyEmailView extends StatefulWidget {
  const VerfifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerfifyEmailView> createState() => _VerfifyEmailViewState();
}

class _VerfifyEmailViewState extends State<VerfifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verfify Email"),
      ),
    );
  }
}
