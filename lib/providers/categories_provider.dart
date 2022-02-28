import 'package:flutter/material.dart';
import 'package:wallapaper_app/models/categories_model.dart';


// ░█████╗░░█████╗░████████╗███████╗░██████╗░░█████╗░██████╗░██╗███████╗░██████╗
// ██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔════╝░██╔══██╗██╔══██╗██║██╔════╝██╔════╝
// ██║░░╚═╝███████║░░░██║░░░█████╗░░██║░░██╗░██║░░██║██████╔╝██║█████╗░░╚█████╗░
// ██║░░██╗██╔══██║░░░██║░░░██╔══╝░░██║░░╚██╗██║░░██║██╔══██╗██║██╔══╝░░░╚═══██╗
// ╚█████╔╝██║░░██║░░░██║░░░███████╗╚██████╔╝╚█████╔╝██║░░██║██║███████╗██████╔╝
// ░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚══════╝░╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚══════╝╚═════╝░

// ██████╗░██████╗░░█████╗░██╗░░░██╗██╗██████╗░███████╗██████╗░
// ██╔══██╗██╔══██╗██╔══██╗██║░░░██║██║██╔══██╗██╔════╝██╔══██╗
// ██████╔╝██████╔╝██║░░██║╚██╗░██╔╝██║██║░░██║█████╗░░██████╔╝
// ██╔═══╝░██╔══██╗██║░░██║░╚████╔╝░██║██║░░██║██╔══╝░░██╔══██╗
// ██║░░░░░██║░░██║╚█████╔╝░░╚██╔╝░░██║██████╔╝███████╗██║░░██║
// ╚═╝░░░░░╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝╚═════╝░╚══════╝╚═╝░░╚═╝

class CategoriesProvider with ChangeNotifier {
  final List<CategoriesModel> _list = [
    CategoriesModel(
      title: 'Abstract',
      imgUrl:
          'https://images.pexels.com/photos/3573555/pexels-photo-3573555.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    ),
    CategoriesModel(
      title: 'Trending',
      imgUrl:
          'https://images.pexels.com/photos/6044266/pexels-photo-6044266.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
    ),
    CategoriesModel(
      title: 'Animals',
      imgUrl:
          'https://images.pexels.com/photos/567540/pexels-photo-567540.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    ),
    CategoriesModel(
      title: 'Nature',
      imgUrl:
          'https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=750&w=1260',
    ),
    CategoriesModel(
      title: 'Architecture',
      imgUrl:
          'https://images.pexels.com/photos/137594/pexels-photo-137594.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    ),
    CategoriesModel(
      title: 'Art',
      imgUrl:
          'https://images.pexels.com/photos/161154/stained-glass-spiral-circle-pattern-161154.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    ),
    CategoriesModel(
      title: 'Portrait',
      imgUrl:
          'https://images.pexels.com/photos/4203842/pexels-photo-4203842.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    ),
    CategoriesModel(
      title: 'Plants',
      imgUrl:
          'https://images.pexels.com/photos/1407305/pexels-photo-1407305.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    ),
  ];

  List<CategoriesModel> get getCategotiesList {
    return [..._list];
  }
}
