import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


// ████████╗██╗██╗░░░░░███████╗
// ╚══██╔══╝██║██║░░░░░██╔════╝
// ░░░██║░░░██║██║░░░░░█████╗░░
// ░░░██║░░░██║██║░░░░░██╔══╝░░
// ░░░██║░░░██║███████╗███████╗
// ░░░╚═╝░░░╚═╝╚══════╝╚══════╝


class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
    required this.imageLink,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: extent,
      margin: EdgeInsets.all(
        getProportionateScreenWidth(5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(20),
        ),
        child: CachedNetworkImage(
          imageUrl: imageLink,
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          placeholder: (context, url) => SizedBox(
            width: getProportionateScreenWidth(10),
            height: getProportionateScreenHeight(5),
            child: Container(
              color: waBgColor,
              height: extent,
              child: Lottie.asset(
                'assets/images/shimmer.json',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // error widgit
          errorWidget: (context, url, error) => Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(''), // find a nice image
              ),
            ),
          ),
        ),
      ),
    );
  }
}
