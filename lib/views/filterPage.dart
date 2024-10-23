import 'package:booksica/apis/categoryApi.api.dart';
import 'package:booksica/apis/getAllBooksApi.dart';
import 'package:booksica/apis/homeApi.api.dart';
import 'package:booksica/controller/filterPage.controller.dart';
import 'package:booksica/models/allBooks.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/BottomSheet.dart';
import 'package:booksica/utils/Cards.dart';
import 'package:booksica/utils/text.dart';
import 'package:booksica/views/productDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  CategoryApi categoryApi = Get.put(CategoryApi());
  FilterController filterController = Get.put(FilterController());
  GetAllBooksApi getAllBooksApi = Get.put(GetAllBooksApi());
  HomeApi homeApi = Get.put(HomeApi());

  @override
  void initState() {
    // TODO: implement initState
    getAllBooksApi.getAllBooks(context,
        category: categoryApi.data1[filterController.pageNo.value].id);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    filterController.pageNo.value = 0;
    super.dispose();
  }

  Product data = Product.fromJson({
    "dimensions": {"length": null, "breadth": null, "height": null},
    "seoAuthors": [],
    "_id": "6593bf3dea5b55c2cd2ee6ca",
    "title": "Riich Dad Poor Dad",
    "description":
        "Rich Dad Poor Dad is a 1997 book written by Robert T. Kiyosaki and Sharon Lechter. It advocates the importance of financial literacy (financial education), financial independence and building wealth through investing in assets, real estate investing, starting and owning businesses, as well as increasing one's financial intelligence (financial IQ).                                                                                                                                                               Rich Dad Poor Dad is written in the style of a set of parables, ostensibly based on Kiyosaki's life. The titular \"rich dad\" is his best friend's father who accumulated wealth due to entrepreneurship and savvy investing, while the \"poor dad\" is claimed to be Kiyosaki's own father who he says worked hard all his life but never obtained financial security.",
    "discount": 65,
    "thumbnail": "1711696076423Rich Dad Poor Dad.png",
    "photos": [
      "1708765327557KMyZ@Ln3k (15).png",
      "17116995002373a41b9e857b86e967962263cfdb3f85b.jpg"
    ],
    "specifications": [
      {
        "key": "Publisher",
        "value": "PLATA PUBLISHING",
        "_id": "6606762cde17e77d6a619e89"
      },
      {
        "key": "Language",
        "value": "English",
        "_id": "6606762cde17e77d6a619e8a"
      },
      {
        "key": "ISBN-10",
        "value": "1612681131",
        "_id": "6606762cde17e77d6a619e8b"
      },
      {
        "key": "Item Weight",
        "value": "240 g",
        "_id": "6606762cde17e77d6a619e8c"
      },
      {
        "key": "Dimensions",
        "value": "19.7 x 12.9 x 2.03 cm",
        "_id": "6606762cde17e77d6a619e8d"
      },
      {
        "key": "Country of Origin",
        "value": "India",
        "_id": "6606762cde17e77d6a619e8e"
      },
      {
        "key": "Reading age",
        "value": "Suggested age: 14 years and up",
        "_id": "6606762cde17e77d6a619e8f"
      }
    ],
    "weight": 0.24,
    "mrp": 399,
    "rentPrice": 40,
    "stock": 2088,
    "conditionalPrices": [],
    "subCategory": {
      "_id": "6593bb85ea5b55c2cd2ee66a",
      "name": "Finance",
      "parentCategory": {
        "_id": "6593bad7ea5b55c2cd2ee666",
        "name": "Novel",
        "parentCategory": null,
        "icon": "17041804392941024px-Closed_Book_Icon.svg.png",
        "disabled": false,
        "__v": 0
      },
      "icon": "17041806136628733285.png",
      "disabled": false,
      "__v": 0
    },
    "metaTags": [],
    "author": {
      "_id": "6593b934ea5b55c2cd2ee65b",
      "name": "Robert T. Kiyosaki",
      "aboutAuthor":
          "Robert Toru Kiyosaki (born April 8, 1947) is a Japanese-American businessman and author.[1] Kiyosaki is the founder of Rich Global LLC and the Rich Dad Company, a private financial education company that provides personal finance and business education to people through books and videos. The company's main revenues come from franchisees of the Rich Dad seminars that are conducted by independent individuals using Kiyosaki's brand name.",
      "photo": "1704180039134robert-kiyosaki.jpg",
      "disabled": true,
      "display": true,
      "__v": 0
    },
    "disabled": false,
    "publisher": {
      "_id": "6593bd8bea5b55c2cd2ee685",
      "name": "PLATA PUBLISHING",
      "about": "PLATA PUBLISHING",
      "disabled": false,
      "photo": "170418113145285726093.jpg",
      "createdAt": "2024-01-02T07:38:51.526Z",
      "updatedAt": "2024-01-02T07:38:51.526Z",
      "__v": 0
    },
    "__v": 1,
    "price": 139,
    "returnableDays": 7,
    "cancellation": false,
    "returnable": false,
    "sold": 296,
    "bestSeller": true,
    "updatedAt": "2024-09-28T08:09:59.802Z"
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    centerTitle: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: AppColors.primary,
                      statusBarIconBrightness: Brightness.light,
                    ),
                    backgroundColor: AppColors.white,
                    leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(w * .045),
                        child: Image.asset(
                          "assets/icons/arrowleft.png",
                        ),
                      ),
                    ),
                    title: AppFonts.text(context, "Filter", w * .050,
                        FontWeight.w500, AppColors.black),
                    actions: [
                      Padding(
                        padding: EdgeInsets.all(w * .030),
                        child: Image.asset(
                          "assets/icons/shopcart.png",
                        ),
                      ),
                    ],
                  ),
                  SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: _SliverSearchBarDelegate(
                        minHeight: 60.0,
                        maxHeight: 60.0,
                        child: Container(
                          height: h * .070,
                          color: AppColors.white,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                                vertical: h * .008, horizontal: w * .040),
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(w * .020),
                                onTap: () {
                                  CustBottomSheet.bottomSheet(context);
                                },
                                child: Container(
                                  height: h * .030,
                                  width: w * .270,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(w * .020),
                                      border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 2)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/filter.png',
                                        height: h * .030,
                                        width: w * .060,
                                      ),
                                      SizedBox(
                                        width: w * .030,
                                      ),
                                      AppFonts.text(context, "Filter", w * .040,
                                          FontWeight.w500, AppColors.black)
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: h * .002),
                                child: SizedBox(
                                  width: w - w * .270,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: w * .010),
                                      itemCount: categoryApi.data1.length,
                                      itemBuilder: (context, i) {
                                        return Obx(() => Padding(
                                              padding: EdgeInsets.only(
                                                  left: w * .010,
                                                  right: i ==
                                                          categoryApi.data1
                                                                  .length -
                                                              1
                                                      ? w * .050
                                                      : 0),
                                              child: Container(
                                                height: h * .030,
                                                decoration: BoxDecoration(
                                                    color: filterController
                                                                .pageNo.value ==
                                                            i
                                                        ? AppColors.primary
                                                        : AppColors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w * .020)),
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          w * .020),
                                                  onTap: () {
                                                    filterController
                                                        .pageNo.value = i;
                                                    getAllBooksApi.getAllBooks(
                                                        context,
                                                        category: categoryApi
                                                            .data1[i].id);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                w * .030),
                                                    child: Center(
                                                      child: AppFonts.text(
                                                          context,
                                                          categoryApi
                                                              .data1[i].name,
                                                          w * .040,
                                                          FontWeight.w500,
                                                          filterController
                                                                      .pageNo
                                                                      .value ==
                                                                  i
                                                              ? AppColors.white
                                                              : AppColors
                                                                  .black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ));
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ];
              },
              body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Obx(() => !getAllBooksApi.isLoading.value &&
                        getAllBooksApi.data1.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: w * .040),
                        shrinkWrap: true,
                        itemCount: getAllBooksApi.data1.length,
                        // itemCount: 1,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: h * .010),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ProductDetailsPage(
                                                productId: getAllBooksApi
                                                    .data1[i].id)));
                                  },
                                  child: NavCard.filterComponent(
                                      context,
                                      getAllBooksApi.isLoading.value
                                          ? data
                                          : getAllBooksApi.data1[i]),
                                ),
                                i != getAllBooksApi.data1.length - 1
                                    ? Divider(
                                        color: AppColors.appGrey,
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          );
                        })
                    : getAllBooksApi.data1.isNotEmpty ||
                            getAllBooksApi.isLoading.value
                        ? Skeletonizer(
                            enabled: true,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * .040),
                                shrinkWrap: true,
                                itemCount: 10,
                                itemBuilder: (context, i) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: h * .010),
                                    child: Column(
                                      children: [
                                        NavCard.filterComponent(context, data),
                                        i != 9
                                            ? Divider(
                                                color: AppColors.appGrey,
                                              )
                                            : const SizedBox()
                                      ],
                                    ),
                                  );
                                }),
                          )
                        : Container(
                            height: h / 1.5,
                            width: w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/noBooks.png",
                                  height: h * .300,
                                  width: w * .600,
                                ),
                                AppFonts.text(context, "No books available !",
                                    w * .050, FontWeight.w600, AppColors.black)
                              ],
                            ),
                          )),
              )),
        ));
  }
}

class _SliverSearchBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverSearchBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
