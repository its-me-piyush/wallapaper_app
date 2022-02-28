import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/curated_model.dart';


// ░██████╗███████╗░█████╗░██████╗░░█████╗░██╗░░██╗
// ██╔════╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██║░░██║
// ╚█████╗░█████╗░░███████║██████╔╝██║░░╚═╝███████║
// ░╚═══██╗██╔══╝░░██╔══██║██╔══██╗██║░░██╗██╔══██║
// ██████╔╝███████╗██║░░██║██║░░██║╚█████╔╝██║░░██║
// ╚═════╝░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝

// ██╗███╗░░░███╗░█████╗░░██████╗░███████╗░██████╗
// ██║████╗░████║██╔══██╗██╔════╝░██╔════╝██╔════╝
// ██║██╔████╔██║███████║██║░░██╗░█████╗░░╚█████╗░
// ██║██║╚██╔╝██║██╔══██║██║░░╚██╗██╔══╝░░░╚═══██╗
// ██║██║░╚═╝░██║██║░░██║╚██████╔╝███████╗██████╔╝
// ╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚═════╝░╚══════╝╚═════╝░

// ██████╗░██████╗░░█████╗░██╗░░░██╗██╗██████╗░███████╗██████╗░
// ██╔══██╗██╔══██╗██╔══██╗██║░░░██║██║██╔══██╗██╔════╝██╔══██╗
// ██████╔╝██████╔╝██║░░██║╚██╗░██╔╝██║██║░░██║█████╗░░██████╔╝
// ██╔═══╝░██╔══██╗██║░░██║░╚████╔╝░██║██║░░██║██╔══╝░░██╔══██╗
// ██║░░░░░██║░░██║╚█████╔╝░░╚██╔╝░░██║██████╔╝███████╗██║░░██║
// ╚═╝░░░░░╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝╚═════╝░╚══════╝╚═╝░░╚═╝

class SearchImagesProvider with ChangeNotifier {
  fetchCustomSearchedImages(String query) async {
    try {
      var url = Uri.parse('$baseUrl/search?query=$query&per_page=10');
      var response = await http.get(url, headers: {
        'Authorization':
            '563492ad6f9170000100000104002763c46640ceaa4a75384d9f6614',
      });
      var results = curatedImagesFromJson(response.body);
      return results.photos;
    } catch (e) {
      rethrow;
    }
  }
}
