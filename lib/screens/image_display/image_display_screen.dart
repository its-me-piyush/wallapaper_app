import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallapaper_app/size_config.dart';

// ██╗███╗░░░███╗░█████╗░░██████╗░███████╗
// ██║████╗░████║██╔══██╗██╔════╝░██╔════╝
// ██║██╔████╔██║███████║██║░░██╗░█████╗░░
// ██║██║╚██╔╝██║██╔══██║██║░░╚██╗██╔══╝░░
// ██║██║░╚═╝░██║██║░░██║╚██████╔╝███████╗
// ╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚═════╝░╚══════╝

// ██████╗░██╗░██████╗██████╗░██╗░░░░░░█████╗░██╗░░░██╗
// ██╔══██╗██║██╔════╝██╔══██╗██║░░░░░██╔══██╗╚██╗░██╔╝
// ██║░░██║██║╚█████╗░██████╔╝██║░░░░░███████║░╚████╔╝░
// ██║░░██║██║░╚═══██╗██╔═══╝░██║░░░░░██╔══██║░░╚██╔╝░░
// ██████╔╝██║██████╔╝██║░░░░░███████╗██║░░██║░░░██║░░░
// ╚═════╝░╚═╝╚═════╝░╚═╝░░░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░

// ░██████╗░█████╗░██████╗░███████╗███████╗███╗░░██╗
// ██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝████╗░██║
// ╚█████╗░██║░░╚═╝██████╔╝█████╗░░█████╗░░██╔██╗██║
// ░╚═══██╗██║░░██╗██╔══██╗██╔══╝░░██╔══╝░░██║╚████║
// ██████╔╝╚█████╔╝██║░░██║███████╗███████╗██║░╚███║
// ╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚══════╝╚═╝░░╚══╝

class ImageDisplayScreen extends StatelessWidget {
  const ImageDisplayScreen(
      {Key? key,
      required this.src,
      required this.photographer,
      required this.alt})
      : super(key: key);
  final String src;
  final String photographer;
  final String alt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              src,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: getProportionateScreenHeight(60),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: getProportionateScreenWidth(30),
                ),
              ),
            ),
            Positioned(
              top: getProportionateScreenHeight(65),
              right: getProportionateScreenHeight(10),
              child: Icon(
                Icons.upload_rounded,
                color: Colors.white,
                size: getProportionateScreenWidth(30),
              ),
            ),
            Positioned(
                bottom: getProportionateScreenHeight(40),
                left: getProportionateScreenWidth(10),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Image Info',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(40),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Photographer: ',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: photographer,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Description: ',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: alt,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.cancel_rounded,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.info_rounded,
                    color: Colors.white,
                    size: getProportionateScreenWidth(30),
                  ),
                )),
            Positioned(
              bottom: getProportionateScreenHeight(40),
              right: getProportionateScreenWidth(10),
              child: Icon(
                FontAwesomeIcons.fileDownload,
                color: Colors.white,
                size: getProportionateScreenWidth(30),
              ),
            ),
            Positioned(
              bottom: getProportionateScreenHeight(100),
              right: getProportionateScreenWidth(10),
              child: Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
                size: getProportionateScreenWidth(30),
              ),
            ),
            Positioned(
              bottom: getProportionateScreenHeight(160),
              right: getProportionateScreenWidth(10),
              child: Icon(
                FontAwesomeIcons.solidHeart,
                color: Colors.pink,
                size: getProportionateScreenWidth(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
