// To parse this JSON data, do
//
//     final curatedImages = curatedImagesFromJson(jsonString);

import 'dart:convert';


// ░█████╗░██╗░░░██╗██████╗░░█████╗░████████╗███████╗██████╗░
// ██╔══██╗██║░░░██║██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
// ██║░░╚═╝██║░░░██║██████╔╝███████║░░░██║░░░█████╗░░██║░░██║
// ██║░░██╗██║░░░██║██╔══██╗██╔══██║░░░██║░░░██╔══╝░░██║░░██║
// ╚█████╔╝╚██████╔╝██║░░██║██║░░██║░░░██║░░░███████╗██████╔╝
// ░╚════╝░░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═════╝░

// ██╗███╗░░░███╗░█████╗░░██████╗░███████╗░██████╗
// ██║████╗░████║██╔══██╗██╔════╝░██╔════╝██╔════╝
// ██║██╔████╔██║███████║██║░░██╗░█████╗░░╚█████╗░
// ██║██║╚██╔╝██║██╔══██║██║░░╚██╗██╔══╝░░░╚═══██╗
// ██║██║░╚═╝░██║██║░░██║╚██████╔╝███████╗██████╔╝
// ╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚═════╝░╚══════╝╚═════╝░

// ███╗░░░███╗░█████╗░██████╗░███████╗██╗░░░░░
// ████╗░████║██╔══██╗██╔══██╗██╔════╝██║░░░░░
// ██╔████╔██║██║░░██║██║░░██║█████╗░░██║░░░░░
// ██║╚██╔╝██║██║░░██║██║░░██║██╔══╝░░██║░░░░░
// ██║░╚═╝░██║╚█████╔╝██████╔╝███████╗███████╗
// ╚═╝░░░░░╚═╝░╚════╝░╚═════╝░╚══════╝╚══════╝

CuratedImages curatedImagesFromJson(String str) =>
    CuratedImages.fromJson(json.decode(str));

String curatedImagesToJson(CuratedImages data) => json.encode(data.toJson());

class CuratedImages {
  int page;
  int perPage;
  List<CuratedPhotos> photos;
  int totalResults;
  String nextPage;
  CuratedImages({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
    required this.nextPage,
  });

  factory CuratedImages.fromJson(Map<String, dynamic> json) => CuratedImages(
        page: json["page"],
        perPage: json["per_page"],
        photos: List<CuratedPhotos>.from(json["photos"].map((x) => CuratedPhotos.fromJson(x))),
        totalResults: json["total_results"],
        nextPage: json["next_page"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "total_results": totalResults,
        "next_page": nextPage,
      };
}

class CuratedPhotos {
  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  String avgColor;
  Src src;
  String alt;
  CuratedPhotos({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.alt,
  });

  factory CuratedPhotos.fromJson(Map<String, dynamic> json) => CuratedPhotos(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        photographer: json["photographer"],
        photographerUrl: json["photographer_url"],
        photographerId: json["photographer_id"],
        avgColor: json["avg_color"],
        src: Src.fromJson(json["src"]),
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "photographer": photographer,
        "photographer_url": photographerUrl,
        "photographer_id": photographerId,
        "avg_color": avgColor,
        "src": src.toJson(),
        "alt": alt,
      };
}

class Src {
  String original;
  String large2X;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;
  Src({
    required this.original,
    required this.large2X,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"],
        large2X: json["large2x"],
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
        portrait: json["portrait"],
        landscape: json["landscape"],
        tiny: json["tiny"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
        "large2x": large2X,
        "large": large,
        "medium": medium,
        "small": small,
        "portrait": portrait,
        "landscape": landscape,
        "tiny": tiny,
      };
}
