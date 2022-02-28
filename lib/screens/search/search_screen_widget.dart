import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallapaper_app/constants.dart';
import 'package:wallapaper_app/providers/categories_provider.dart';
import 'package:wallapaper_app/screens/search_images/searched_images.dart';

import '../../size_config.dart';


// ░██████╗███████╗░█████╗░██████╗░░█████╗░██╗░░██╗
// ██╔════╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██║░░██║
// ╚█████╗░█████╗░░███████║██████╔╝██║░░╚═╝███████║
// ░╚═══██╗██╔══╝░░██╔══██║██╔══██╗██║░░██╗██╔══██║
// ██████╔╝███████╗██║░░██║██║░░██║╚█████╔╝██║░░██║
// ╚═════╝░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝

// ░██████╗░█████╗░██████╗░███████╗███████╗███╗░░██╗
// ██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝████╗░██║
// ╚█████╗░██║░░╚═╝██████╔╝█████╗░░█████╗░░██╔██╗██║
// ░╚═══██╗██║░░██╗██╔══██╗██╔══╝░░██╔══╝░░██║╚████║
// ██████╔╝╚█████╔╝██║░░██║███████╗███████╗██║░╚███║
// ╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚══════╝╚═╝░░╚══╝

// ░██╗░░░░░░░██╗██╗██████╗░░██████╗░███████╗████████╗
// ░██║░░██╗░░██║██║██╔══██╗██╔════╝░██╔════╝╚══██╔══╝
// ░╚██╗████╗██╔╝██║██║░░██║██║░░██╗░█████╗░░░░░██║░░░
// ░░████╔═████║░██║██║░░██║██║░░╚██╗██╔══╝░░░░░██║░░░
// ░░╚██╔╝░╚██╔╝░██║██████╔╝╚██████╔╝███████╗░░░██║░░░
// ░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░░╚═════╝░╚══════╝░░░╚═╝░░░

class SearchScreenMainWidget extends StatelessWidget {
  const SearchScreenMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Column(
      children: [
        Container(
          height: getProportionateScreenHeight(200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                getProportionateScreenWidth(40),
              ),
              bottomRight: Radius.circular(
                getProportionateScreenWidth(40),
              ),
            ),
            color: waBluishColor,
          ),
          child: Container(
            margin: EdgeInsets.only(
              top: getProportionateScreenWidth(60),
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
            ),
            child: Center(
              child: TextField(
                controller: textEditingController,
                onSubmitted: (value) {
                  textEditingController.clear();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchedImages(query: value.trim()),
                    ),
                  );
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(20),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: getProportionateScreenWidth(30),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(30)),
        Text(
          'Categories',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(30),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(30)),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
            ),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: getProportionateScreenWidth(10),
                mainAxisSpacing: getProportionateScreenHeight(10),
              ),
              itemCount: Provider.of<CategoriesProvider>(context, listen: false)
                  .getCategotiesList
                  .length,
              itemBuilder: (context, index) {
                var catList =
                    Provider.of<CategoriesProvider>(context, listen: false)
                        .getCategotiesList;
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SearchedImages(
                      query: catList[index].title,
                    ),
                  )),
                  child: Container(
                    height: getProportionateScreenHeight(150),
                    width: SizeConfig.screenWidth * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          catList[index].imgUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        catList[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(20),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
