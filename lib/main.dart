import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:insta/provider/themeProvider.dart';
import 'package:insta/screens/Signup.dart';
import 'package:insta/screens/chatboard.dart';
import 'package:insta/screens/home.dart';
import 'package:insta/screens/login.dart';
import 'package:insta/screens/password.dart';
import 'package:insta/screens/searchContainer.dart';
import 'package:insta/screens/stories.dart';
import 'package:insta/screens/storyPreview.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final camera = await availableCameras();
  final firstCamera = camera.first;

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(ThemeData.light()),
      child: MyApp(camera: firstCamera),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.camera});
  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: themeProvider.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(
              camera: camera,
            ),
        '/': (context) => Home(camera: camera),
        '/story': (context) => Stories(camera: camera),
        '/story_prev': (context) => StoryPreview(storyPic: []),
        '/signup': (context) => const Signup(),
        '/chatboard': (context) => const Chatboard(),
        '/password': (context) => const Password(),
        '/search': (context) => const SearchContainer(),
      },
    );
  }
}
