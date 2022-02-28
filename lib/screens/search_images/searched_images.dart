import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:wallapaper_app/providers/search_images_provider.dart';

import '../../models/curated_model.dart';
import '../../size_config.dart';
import '../home/components/tile.dart';
import '../image_display/image_display_screen.dart';


// ░██████╗███████╗░█████╗░██████╗░░█████╗░██╗░░██╗███████╗██████╗░
// ██╔════╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██║░░██║██╔════╝██╔══██╗
// ╚█████╗░█████╗░░███████║██████╔╝██║░░╚═╝███████║█████╗░░██║░░██║
// ░╚═══██╗██╔══╝░░██╔══██║██╔══██╗██║░░██╗██╔══██║██╔══╝░░██║░░██║
// ██████╔╝███████╗██║░░██║██║░░██║╚█████╔╝██║░░██║███████╗██████╔╝
// ╚═════╝░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚══════╝╚═════╝░

// ██╗███╗░░░███╗░█████╗░░██████╗░███████╗░██████╗
// ██║████╗░████║██╔══██╗██╔════╝░██╔════╝██╔════╝
// ██║██╔████╔██║███████║██║░░██╗░█████╗░░╚█████╗░
// ██║██║╚██╔╝██║██╔══██║██║░░╚██╗██╔══╝░░░╚═══██╗
// ██║██║░╚═╝░██║██║░░██║╚██████╔╝███████╗██████╔╝
// ╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚═════╝░╚══════╝╚═════╝░

class SearchedImages extends StatelessWidget {
  const SearchedImages({Key? key, required this.query}) : super(key: key);
  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(60)),
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: getProportionateScreenWidth(30),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(80)),
              Text(
                query,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(30),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Expanded(
              child: FutureBuilder(
            future: Provider.of<SearchImagesProvider>(context, listen: false)
                .fetchCustomSearchedImages(query),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              List<CuratedPhotos> searchedPhotosList =
                  snapshot.data as List<CuratedPhotos>;
              return MasonryGridView.builder(
                padding: EdgeInsets.zero,
                itemCount: searchedPhotosList.length,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                // crossAxisCount: 2,
                mainAxisSpacing: getProportionateScreenWidth(10),
                crossAxisSpacing: getProportionateScreenWidth(10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ImageDisplayScreen(
                        src: searchedPhotosList[index].src.large2X,
                        photographer: searchedPhotosList[index].photographer,
                        alt: searchedPhotosList[index].alt,
                      ),
                    )),
                    child: Tile(
                      index: index,
                      extent: (index % 6 + 1) * 100,
                      imageLink: searchedPhotosList[index].src.original,
                    ),
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
