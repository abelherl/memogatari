import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:memogatari/pages/add_story.dart';
import 'package:memogatari/pages/edit_story.dart';
import 'package:memogatari/pages/home.dart';
import 'package:memogatari/pages/image_viewer.dart';
import 'package:memogatari/pages/splash.dart';
import 'package:memogatari/services/story.dart';
import 'package:memogatari/utils/theme.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(StoryAdapter());
  runApp(MaterialApp(
    initialRoute: '/',
    theme: mainTheme(),
    routes: {
      '/': (context) => Splash(),
      '/home': (context) {
        return FutureBuilder(
            future: Hive.openBox('stories'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(snapshot.error);
                }
                else {
                  return Home();
                }
              }
              else {
                return Splash();
              }
            }
        );
      },
      '/edit_story': (context) => EditStory(),
      '/add_story': (context) => AddStory(),
      '/image_viewer': (context) => ImageViewer()
    },
  ));
}