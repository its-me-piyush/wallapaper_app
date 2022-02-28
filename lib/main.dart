import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallapaper_app/providers/categories_provider.dart';
import 'package:wallapaper_app/providers/curated_provider.dart';
import 'package:wallapaper_app/providers/search_images_provider.dart';
import 'package:wallapaper_app/screens/home/home_screen.dart';
import 'package:wallapaper_app/theme.dart';


// ░░░██╗░██╗░  ███╗░░░███╗░█████╗░██╗███╗░░██╗
// ██████████╗  ████╗░████║██╔══██╗██║████╗░██║
// ╚═██╔═██╔═╝  ██╔████╔██║███████║██║██╔██╗██║
// ██████████╗  ██║╚██╔╝██║██╔══██║██║██║╚████║
// ╚██╔═██╔══╝  ██║░╚═╝░██║██║░░██║██║██║░╚███║
// ░╚═╝░╚═╝░░░  ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝╚═╝░░╚══╝

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CuratedProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CategoriesProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SearchImagesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Wallpaper App',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const HomeScreen(),
      ),
    );
  }
}
