import 'package:booksica/apis/categoryApi.api.dart';
import 'package:booksica/controller/filterPage.controller.dart';
import 'package:booksica/models/subCategories.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/Cards.dart';
import 'package:booksica/utils/RouteTransition.dart';
import 'package:booksica/utils/text.dart';
import 'package:booksica/views/filterPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryApi categoryApi = Get.put(CategoryApi());
  FilterController filterController = Get.put(FilterController());

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primary,
          statusBarIconBrightness: Brightness.light,
        ),
        centerTitle: true,
        title: AppFonts.text(
            context, "Categories", w * .048, FontWeight.w500, AppColors.black),
      ),
      body: categoryApi.data1.length == 0
          ? FutureBuilder(
              future: categoryApi.getCategories(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data!.length);
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * .025, vertical: h * .020),
                    child: Wrap(
                        spacing: h * .010,
                        runSpacing: h * .015,
                        children: List.generate(snapshot.data!.length, (i) {
                          return InkWell(
                            onTap: () {
                              filterController.pageNo.value = i;
                              Navigator.push(
                                  context, SlideLeftRoute(page: FilterPage()));
                            },
                            child: NavCard.CategoryCard(
                                context, snapshot.data![i]),
                          );
                        })),
                  );
                } else {
                  return Skeletonizer(
                    enabled: true,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * .025, vertical: h * .020),
                      child: Wrap(
                          spacing: h * .010,
                          runSpacing: h * .015,
                          children: List.generate(10, (i) {
                            return NavCard.CategoryCard(
                                context,
                                SubCategories.fromJson({
                                  "_id": "6612449b8a7907145360bd8f",
                                  "name": "Crime",
                                  "parentCategory": "6593bad7ea5b55c2cd2ee666",
                                  "icon":
                                      "1712473323675crime-book-icon-flat-isolated-vector-38906619-removebg-preview.png",
                                  "disabled": false,
                                  "__v": 0,
                                  "books": 7
                                }));
                          })),
                    ),
                  );
                }
              })
          : Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * .025, vertical: h * .020),
              child: Wrap(
                  spacing: h * .010,
                  runSpacing: h * .015,
                  children: List.generate(categoryApi.data1.length, (i) {
                    return InkWell(
                        onTap: () {
                          filterController.pageNo.value = i;
                          Navigator.push(
                              context, SlideLeftRoute(page: FilterPage()));
                        },
                        child: NavCard.CategoryCard(
                            context, categoryApi.data1[i]));
                  })),
            ),
    );
  }
}
