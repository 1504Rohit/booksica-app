import 'package:booksica/apis/categoryApi.api.dart';
import 'package:booksica/apis/homeApi.api.dart';
import 'package:booksica/controller/filterPage.controller.dart';
import 'package:booksica/controller/navPage.controller.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/AppButtons.dart';
import 'package:booksica/utils/Cards.dart';
import 'package:booksica/utils/RouteTransition.dart';
import 'package:booksica/utils/text.dart';
import 'package:booksica/utils/textForm.dart';
import 'package:booksica/views/filterPage.dart';
import 'package:booksica/views/productDetailsPage.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NavPageController pageController = Get.put(NavPageController());
  CategoryApi categoryApi = Get.put(CategoryApi());
  TextEditingController search = TextEditingController();
  ScrollController controller = ScrollController();
  FilterController filterController = Get.put(FilterController());
  HomeApi homeApi = Get.put(HomeApi());
  double offset1 = 0.0;
  double _lastScrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    if (homeApi.data.length == 0) {
      homeApi.getHomeApi(context);
    }

    controller.addListener(() {
      if (controller.offset > _lastScrollOffset) {
        setState(() {
          pageController.countPixal.value = false;
        });
      } else if (controller.offset < _lastScrollOffset) {
        pageController.countPixal.value = true;
      }

      _lastScrollOffset = controller.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            controller: controller,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: AppColors.white,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: AppColors.primary,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  expandedHeight: h * .070,
                  floating: false,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: AppBar(
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: AppColors.primary,
                        statusBarIconBrightness: Brightness.light,
                      ),
                      backgroundColor: AppColors.white,
                      elevation: 0,
                      title: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * .020),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: w * .110,
                                  width: w * .110,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/dummyProfile.jpg"),
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(w * .020),
                                  ),
                                ),
                                SizedBox(width: w * .020),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    AppFonts.text(
                                        context,
                                        "Good morning 👋",
                                        w * .045,
                                        FontWeight.w600,
                                        AppColors.black),
                                    AppFonts.text(context, "India", w * .030,
                                        FontWeight.w400, Colors.grey),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: w * .110,
                              width: w * .110,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0.5,
                                    blurRadius: 2,
                                    offset: Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(w * .030),
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/icons/Bag.png",
                                  height: w * .060,
                                  width: w * .060,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: _SliverSearchBarDelegate(
                    minHeight: 60.0,
                    maxHeight: 60.0,
                    child: SafeArea(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: w * .040, vertical: w * .005),
                          child: Container(
                            height: h * .060,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(w * .015),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * .030),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/icons/search.png",
                                    height: w * .070,
                                    width: w * .070,
                                  ),
                                  SizedBox(
                                    width: w * .700,
                                    child: CustTextForm.custTextFormSearch(
                                      "Search your interested books",
                                      1,
                                      1000,
                                      null,
                                      null,
                                      TextInputType.text,
                                      context,
                                      (data) {},
                                      search,
                                      false,
                                      (data) {},
                                      () {},
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/icons/mice.png",
                                    height: w * .055,
                                    width: w * .055,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Obx(
              () => SingleChildScrollView(
                child: Skeletonizer(
                  enabled: homeApi.isLoading.value,
                  child: Container(
                    color: AppColors.white,
                    child: Column(
                      children: [
                        SizedBox(height: h * .020),
                        SizedBox(
                          height: w * .380,
                          child: Swiper(
                            onIndexChanged: (value) {},
                            itemBuilder: (BuildContext context, int i) {
                              return Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * .040),
                                child: Container(
                                  height: w * .430,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(w * .024),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: homeApi.data.length == 0
                                          ? const AssetImage(
                                              'assets/images/home1.png')
                                          : NetworkImage(
                                              "https://booksica.s3.ap-south-1.amazonaws.com/${homeApi.data[0].homeSlider[0].image}"),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: homeApi.data.length == 0
                                ? 2
                                : homeApi.data[0].homeSlider.length,
                            autoplay: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: w * .040, vertical: w * .030),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppFonts.text(context, "Categories", w * .045,
                                  FontWeight.w600, AppColors.black),
                              InkWell(
                                onTap: () {
                                  pageController.pageNo.value = 1;
                                },
                                child: AppFonts.text(
                                    context,
                                    "View All",
                                    w * .035,
                                    FontWeight.w400,
                                    AppColors.primary),
                              )
                            ],
                          ),
                        ),
                        categoryApi.data1.length != 0
                            ? SizedBox(
                                height: h * .120,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * .040),
                                  itemCount: categoryApi.data1.length,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding: i == 10 - 1
                                          ? EdgeInsets.only(right: 0)
                                          : EdgeInsets.only(right: w * .060),
                                      child: InkWell(
                                        onTap: () {
                                          filterController.pageNo.value = i;
                                          Navigator.push(
                                              context,
                                              SlideLeftRoute(
                                                  page: FilterPage()));
                                        },
                                        child: NavCard.categoryCard(
                                            context,
                                            "https://booksica.s3.ap-south-1.amazonaws.com/${categoryApi.data1[i].icon}",
                                            categoryApi.data1[i].name),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : SizedBox(
                                height: h * .120,
                                child: FutureBuilder(
                                    future: categoryApi.getCategories(context),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: w * .040),
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                              padding: i == 10 - 1
                                                  ? EdgeInsets.only(right: 0)
                                                  : EdgeInsets.only(
                                                      right: w * .060),
                                              child: NavCard.categoryCard(
                                                  context,
                                                  "https://booksica.s3.ap-south-1.amazonaws.com/${snapshot.data![i].icon}",
                                                  snapshot.data![i].name),
                                            );
                                          },
                                        );
                                      } else {
                                        return Skeletonizer(
                                          enabled: true,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: w * .040),
                                            itemCount: 10,
                                            itemBuilder: (context, i) {
                                              return Padding(
                                                padding: i == 10 - 1
                                                    ? EdgeInsets.only(right: 0)
                                                    : EdgeInsets.only(
                                                        right: w * .060),
                                                child: NavCard.categoryCard(
                                                    context,
                                                    "https://thumbs.dreamstime.com/b/tree-6324904.jpg",
                                                    "Self-help"),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    }),
                              ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * .040),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppFonts.text(context, "Mangas", w * .045,
                                  FontWeight.w600, AppColors.black),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * .280,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(
                                horizontal: w * .040, vertical: h * .010),
                            itemCount: homeApi.data.length == 0
                                ? 10
                                : homeApi.data[0].sections[0].products.length,
                            itemBuilder: (context, i) {
                              int length = homeApi.data.length == 0
                                  ? 10
                                  : homeApi.data[0].sections[0].products.length;
                              return Padding(
                                padding: i == length - 1
                                    ? EdgeInsets.only(right: 0)
                                    : EdgeInsets.only(right: w * .060),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ProductDetailsPage(
                                                productId: homeApi
                                                    .data[0]
                                                    .sections[0]
                                                    .products[i]
                                                    .id)));
                                  },
                                  child: NavCard.HomeBooksMainCard(
                                    context,
                                    homeApi.data.length != 0
                                        ? "https://booksica.s3.ap-south-1.amazonaws.com/${homeApi.data[0].sections[0].products[i].thumbnail}"
                                        : "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=pexels-souvenirpixels-414612.jpg&fm=jpg",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[0]
                                            .products[i].title
                                        : "nfkrbfu",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[0]
                                            .products[i].author.name
                                        : "nfkrbfu",
                                    homeApi.data.length != 0
                                        ? homeApi
                                            .data[0].sections[0].products[i].mrp
                                            .toString()
                                        : "nf",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[0]
                                            .products[i].price
                                            .toString()
                                        : "nf",
                                    homeApi.data.length != 0
                                        ? "5.0"
                                        : "nfkrbfu",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[0]
                                            .products[i].discount
                                            .toString()
                                        : "35",
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * .040),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppFonts.text(context, "Self-help books",
                                  w * .045, FontWeight.w600, AppColors.black),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * .280,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(
                                horizontal: w * .040, vertical: h * .010),
                            itemCount: homeApi.data.length == 0
                                ? 10
                                : homeApi.data[0].sections[1].products.length,
                            itemBuilder: (context, i) {
                              int length = homeApi.data.length == 0
                                  ? 10
                                  : homeApi.data[0].sections[1].products.length;
                              return Padding(
                                padding: i == length - 1
                                    ? EdgeInsets.only(right: 0)
                                    : EdgeInsets.only(right: w * .060),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ProductDetailsPage(
                                                productId: homeApi
                                                    .data[0]
                                                    .sections[1]
                                                    .products[i]
                                                    .id)));
                                  },
                                  child: NavCard.HomeBooksMainCard(
                                    context,
                                    homeApi.data.length != 0
                                        ? "https://booksica.s3.ap-south-1.amazonaws.com/${homeApi.data[0].sections[1].products[i].thumbnail}"
                                        : "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=pexels-souvenirpixels-414612.jpg&fm=jpg",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[1]
                                            .products[i].title
                                        : "nfkrbfu",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[1]
                                            .products[i].author.name
                                        : "nfkrbfu",
                                    homeApi.data.length != 0
                                        ? homeApi
                                            .data[0].sections[1].products[i].mrp
                                            .toString()
                                        : "nf",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[1]
                                            .products[i].price
                                            .toString()
                                        : "nf",
                                    homeApi.data.length != 0
                                        ? "5.0"
                                        : "nfkrbfu",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[1]
                                            .products[i].discount
                                            .toString()
                                        : "35",
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: h * .020,
                        ),
                        Container(
                          height: h * .010,
                          width: w * .300,
                          decoration: BoxDecoration(
                              color: AppColors.redPrice,
                              borderRadius: BorderRadius.circular(w * .030)),
                        ),
                        SizedBox(
                          height: h * .010,
                        ),
                        AppFonts.text(context, "Girlfriend Special", w * .040,
                            FontWeight.w500, Colors.grey),
                        SizedBox(
                          width: w * .700,
                          child: AppFonts.text(context, "World Best Girlfriend",
                              w * .100, FontWeight.w800, AppColors.black),
                        ),
                        SizedBox(
                          height: h * .010,
                        ),
                        SizedBox(
                          width: w * .780,
                          child: AppFonts.text(
                              context,
                              "This Valentine's Day, gift your girldfriend the World's Best Girlfriend book and tell her that she is the best girlfriend in the world.",
                              w * .040,
                              FontWeight.w500,
                              Colors.grey),
                        ),
                        SizedBox(
                          height: h * .030,
                        ),
                        SizedBox(
                          width: w * .550,
                          child: AppButtons.loginLike(
                              context,
                              () {},
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppFonts.text(
                                      context,
                                      "See More Offers",
                                      w * .035,
                                      FontWeight.w500,
                                      AppColors.white),
                                  SizedBox(
                                    width: w * .020,
                                  ),
                                  Image.asset(
                                    'assets/icons/arrowR.png',
                                    height: h * .020,
                                    width: w * .040,
                                  )
                                ],
                              ),
                              AppColors.black,
                              false,
                              h * .056,
                              w * .020),
                        ),
                        SizedBox(
                          height: h * .030,
                        ),
                        Image.asset(
                          'assets/images/book5.png',
                          height: h * .300,
                          width: w * .400,
                        ),
                        SizedBox(
                          height: h * .0200,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * .040),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppFonts.text(context, "Biography", w * .045,
                                  FontWeight.w600, AppColors.black),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * .280,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(
                                horizontal: w * .040, vertical: h * .010),
                            itemCount: homeApi.data.length == 0
                                ? 10
                                : homeApi.data[0].sections[2].products.length,
                            itemBuilder: (context, i) {
                              int length = homeApi.data.length == 0
                                  ? 10
                                  : homeApi.data[0].sections[2].products.length;
                              return Padding(
                                padding: i == length - 1
                                    ? EdgeInsets.only(right: 0)
                                    : EdgeInsets.only(right: w * .060),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ProductDetailsPage(
                                                productId: homeApi
                                                    .data[0]
                                                    .sections[2]
                                                    .products[i]
                                                    .id)));
                                  },
                                  child: NavCard.HomeBooksMainCard(
                                    context,
                                    homeApi.data.length != 0
                                        ? "https://booksica.s3.ap-south-1.amazonaws.com/${homeApi.data[0].sections[2].products[i].thumbnail}"
                                        : "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=pexels-souvenirpixels-414612.jpg&fm=jpg",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[2]
                                            .products[i].title
                                        : "nfkrbfu",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[2]
                                            .products[i].author.name
                                        : "nfkrbfu",
                                    homeApi.data.length != 0
                                        ? homeApi
                                            .data[0].sections[2].products[i].mrp
                                            .toString()
                                        : "nf",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[2]
                                            .products[i].price
                                            .toString()
                                        : "nf",
                                    homeApi.data.length != 0
                                        ? "5.0"
                                        : "nfkrbfu",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[2]
                                            .products[i].discount
                                            .toString()
                                        : "35",
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * .040),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppFonts.text(context, "Psychology Books",
                                  w * .045, FontWeight.w600, AppColors.black),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * .280,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(
                                horizontal: w * .040, vertical: h * .010),
                            itemCount: homeApi.data.length == 0
                                ? 10
                                : homeApi.data[0].sections[3].products.length,
                            itemBuilder: (context, i) {
                              int length = homeApi.data.length == 0
                                  ? 10
                                  : homeApi.data[0].sections[3].products.length;
                              return Padding(
                                padding: i == length - 1
                                    ? EdgeInsets.only(right: 0)
                                    : EdgeInsets.only(right: w * .060),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ProductDetailsPage(
                                                productId: homeApi
                                                    .data[0]
                                                    .sections[3]
                                                    .products[i]
                                                    .id)));
                                  },
                                  child: NavCard.HomeBooksMainCard(
                                    context,
                                    homeApi.data.length != 0
                                        ? "https://booksica.s3.ap-south-1.amazonaws.com/${homeApi.data[0].sections[3].products[i].thumbnail}"
                                        : "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=pexels-souvenirpixels-414612.jpg&fm=jpg",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[3]
                                            .products[i].title
                                        : "nfkrbfu",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[3]
                                            .products[i].author.name
                                        : "nfkrbfu",
                                    homeApi.data.length != 0
                                        ? homeApi
                                            .data[0].sections[3].products[i].mrp
                                            .toString()
                                        : "nf",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[3]
                                            .products[i].price
                                            .toString()
                                        : "nf",
                                    homeApi.data.length != 0
                                        ? "5.0"
                                        : "nfkrbfu",
                                    homeApi.data.length != 0
                                        ? homeApi.data[0].sections[3]
                                            .products[i].discount
                                            .toString()
                                        : "35",
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: h * .020,
                        ),
                        Container(
                          height: h * .010,
                          width: w * .300,
                          decoration: BoxDecoration(
                              color: AppColors.redPrice,
                              borderRadius: BorderRadius.circular(w * .030)),
                        ),
                        SizedBox(
                          height: h * .010,
                        ),
                        AppFonts.text(context, "Valentine's Day Special",
                            w * .040, FontWeight.w500, Colors.grey),
                        SizedBox(
                          width: w * .700,
                          child: AppFonts.text(context, "8 Rules of Love",
                              w * .100, FontWeight.w800, AppColors.black),
                        ),
                        SizedBox(
                          height: h * .010,
                        ),
                        SizedBox(
                          width: w * .780,
                          child: AppFonts.text(
                              context,
                              "This Valentine's Day, read this 8 Rules of love",
                              w * .040,
                              FontWeight.w500,
                              Colors.grey),
                        ),
                        SizedBox(
                          height: h * .030,
                        ),
                        SizedBox(
                          width: w * .550,
                          child: AppButtons.loginLike(
                              context,
                              () {},
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppFonts.text(
                                      context,
                                      "See More Offers",
                                      w * .035,
                                      FontWeight.w500,
                                      AppColors.white),
                                  SizedBox(
                                    width: w * .020,
                                  ),
                                  Image.asset(
                                    'assets/icons/arrowR.png',
                                    height: h * .020,
                                    width: w * .040,
                                  )
                                ],
                              ),
                              AppColors.black,
                              false,
                              h * .056,
                              w * .020),
                        ),
                        SizedBox(
                          height: h * .030,
                        ),
                        Image.asset(
                          'assets/images/book5.png',
                          height: h * .300,
                          width: w * .400,
                        ),
                        SizedBox(
                          height: h * .300,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
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
