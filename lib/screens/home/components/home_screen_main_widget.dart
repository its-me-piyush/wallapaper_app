import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:wallapaper_app/screens/home/components/tile.dart';

import '../../../models/curated_model.dart';
import '../../../providers/curated_provider.dart';
import '../../../size_config.dart';
import '../../image_display/image_display_screen.dart';


// ██╗░░██╗░█████╗░███╗░░░███╗███████╗
// ██║░░██║██╔══██╗████╗░████║██╔════╝
// ███████║██║░░██║██╔████╔██║█████╗░░
// ██╔══██║██║░░██║██║╚██╔╝██║██╔══╝░░
// ██║░░██║╚█████╔╝██║░╚═╝░██║███████╗
// ╚═╝░░╚═╝░╚════╝░╚═╝░░░░░╚═╝╚══════╝

// ░██████╗░█████╗░██████╗░███████╗███████╗███╗░░██╗
// ██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝████╗░██║
// ╚█████╗░██║░░╚═╝██████╔╝█████╗░░█████╗░░██╔██╗██║
// ░╚═══██╗██║░░██╗██╔══██╗██╔══╝░░██╔══╝░░██║╚████║
// ██████╔╝╚█████╔╝██║░░██║███████╗███████╗██║░╚███║
// ╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚══════╝╚═╝░░╚══╝

// ███╗░░░███╗░█████╗░██╗███╗░░██╗
// ████╗░████║██╔══██╗██║████╗░██║
// ██╔████╔██║███████║██║██╔██╗██║
// ██║╚██╔╝██║██╔══██║██║██║╚████║
// ██║░╚═╝░██║██║░░██║██║██║░╚███║
// ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝╚═╝░░╚══╝

// ░██╗░░░░░░░██╗██╗██████╗░░██████╗░███████╗████████╗
// ░██║░░██╗░░██║██║██╔══██╗██╔════╝░██╔════╝╚══██╔══╝
// ░╚██╗████╗██╔╝██║██║░░██║██║░░██╗░█████╗░░░░░██║░░░
// ░░████╔═████║░██║██║░░██║██║░░╚██╗██╔══╝░░░░░██║░░░
// ░░╚██╔╝░╚██╔╝░██║██████╔╝╚██████╔╝███████╗░░░██║░░░
// ░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░░╚═════╝░╚══════╝░░░╚═╝░░░

class HomeScreenMainWidget extends StatelessWidget {
  const HomeScreenMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getProportionateScreenWidth(60),
        left: getProportionateScreenWidth(20),
        right: getProportionateScreenWidth(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(40),
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Text(
            'Your Recommendations',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              color: Colors.white,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: Provider.of<CuratedProvider>(context, listen: false)
                  .fetchCuratedImages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                }
                List<CuratedPhotos> curatesPhotosList =
                    snapshot.data as List<CuratedPhotos>;
                return MasonryGridView.builder(
                  itemCount: curatesPhotosList.length,
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
                          src: curatesPhotosList[index].src.large2X,
                          photographer: curatesPhotosList[index].photographer,
                          alt: curatesPhotosList[index].alt,
                        ),
                      )),
                      child: Tile(
                        index: index,
                        extent: (index % 5 + 1) * 100,
                        imageLink: curatesPhotosList[index].src.original,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
