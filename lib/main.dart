import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
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
    home: const LoginView(),
  ));
}

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
