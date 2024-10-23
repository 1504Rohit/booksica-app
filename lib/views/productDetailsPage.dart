import 'package:booksica/apis/Cart.api.dart';
import 'package:booksica/apis/getBookById.api.dart';
import 'package:booksica/apis/relatedProduct.api.dart';
import 'package:booksica/config/userPreference.dart';
import 'package:booksica/controller/productDetails.controller.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/Cards.dart';
import 'package:booksica/utils/RouteTransition.dart';
import 'package:booksica/utils/text.dart';
import 'package:booksica/views/AuthorDetailPage.dart';
import 'package:booksica/views/ShoppingCartPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsPage extends StatefulWidget {
  String productId;
  ProductDetailsPage({super.key, required this.productId});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());
  GetRelatedPRoducts getRelatedPRoducts = Get.put(GetRelatedPRoducts());
  GetBookById getBookById = Get.put(GetBookById());

  CartApis cartApis = Get.put(CartApis());

  double _topPosition = 0;
  double _leftPosition = 0;
  double _containerHeight = 0;
  double _containerWidth = 0;

  // Initial and final positions and sizes
  double initialTop = 0;
  double initialLeft = 0;
  double finalTop = 0;
  double finalLeft = 0;

  double initialHeight = 0;
  double initialWidth = 0;
  double finalHeight = 0;
  double finalWidth = 0;

  bool isAtFinalPosition = false;

  @override
  void initState() {
    // Fetch book data on init
    productDetailsController.addedToCart.value = false;
    productDetailsController.quantity.value = 1;
    getBookById.getBookById(context, id: widget.productId);
    getRelatedPRoducts.getRelatedProduct(context, widget.productId);
    for (int i = 0; i < cartApis.CartData.length; i++) {
      if (cartApis.CartData[i].product.id == widget.productId) {
        productDetailsController.addedToCart.value = true;
      }
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Screen size
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    // Set initial and final positions
    initialTop = h * .950;
    initialLeft = w * .080;
    finalTop = -h * .20;
    finalLeft = w * .900;

    // Set initial and final sizes
    initialHeight = h * .300;
    initialWidth = w * .400;
    finalHeight = 0;
    finalWidth = 0;

    // Initialize the current position and size to the initial values
    _topPosition = initialTop;
    _leftPosition = initialLeft;
    _containerHeight = initialHeight;
    _containerWidth = initialWidth;
  }

  // Function to move from initial to final and back to initial
  void _animateContainer() {
    setState(() {
      _topPosition = finalTop;
      _leftPosition = finalLeft;
      _containerHeight = finalHeight;
      _containerWidth = finalWidth;
    });

    // After animation completes, instantly move back to the initial position and size
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        // _topPosition = initialTop;
        // _leftPosition = initialLeft;
        // _containerHeight = initialHeight;
        // _containerWidth = initialWidth;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.white,
          body: Obx(
            () => getBookById.isLoading.value
                ? Center(
                    child: Container(
                      height: h * .060,
                      width: w * .130,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: AppColors.appGrey,
                            blurRadius: 4,
                            spreadRadius: 3)
                      ], shape: BoxShape.circle, color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.all(w * .040),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                            strokeWidth: 3,
                          ),
                        ),
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: h * .100,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * .040),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: h * .450,
                                      width: w,
                                      child: PageView.builder(
                                        itemCount: getBookById
                                            .data.value.photos.length,
                                        itemBuilder: (context, index) {
                                          return Image.network(
                                            "https://booksica.s3.ap-south-1.amazonaws.com/${getBookById.data.value.photos[index]}",
                                            height: h * .450,
                                            width: w * .700,
                                            fit: BoxFit.contain,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              // Fallback to dummy image if there's an error
                                              return Image.asset(
                                                'assets/images/default.png',
                                                height: h * .450,
                                                width: w * .700,
                                                fit: BoxFit.contain,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * .030,
                                  ),
                                  AppFonts.text(
                                      context,
                                      getBookById.data.value.title,
                                      w * .045,
                                      FontWeight.w600,
                                      AppColors.black),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: h * .005),
                                        child: AppFonts.text(
                                            context,
                                            "₹ ${getBookById.data.value.price}",
                                            w * .055,
                                            FontWeight.w600,
                                            AppColors.primary),
                                      ),
                                      SizedBox(
                                        width: w * .020,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(bottom: h * .005),
                                        child: AppFonts.text(
                                            context,
                                            "M.R.P:₹ ",
                                            w * .035,
                                            FontWeight.w600,
                                            Colors.grey.shade500),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(bottom: h * .005),
                                        child: Text(
                                          getBookById.data.value.mrp.toString(),
                                          style: GoogleFonts.poppins(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: w * .035,
                                              color: Colors.grey.shade500,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                        width: w * .020,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(bottom: h * .005),
                                        child: Container(
                                          height: h * .030,
                                          width: w * .160,
                                          decoration: BoxDecoration(
                                              color: AppColors.primary,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      w * .014)),
                                          child: Center(
                                            child: AppFonts.text(
                                                context,
                                                "${getBookById.data.value.discount}% off",
                                                w * .030,
                                                FontWeight.w500,
                                                AppColors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: h * .020,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: h * .055,
                                            width: w * .116,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: getBookById
                                                                .data
                                                                .value
                                                                .author
                                                                .photo ==
                                                            ""
                                                        ? const AssetImage(
                                                            "assets/images/default.png")
                                                        : NetworkImage(
                                                            "https://booksica.s3.ap-south-1.amazonaws.com/${getBookById.data.value.author.photo}")),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        w * .020)),
                                          ),
                                          SizedBox(
                                            width: w * .025,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppFonts.text(
                                                  context,
                                                  'Author',
                                                  w * .030,
                                                  FontWeight.w500,
                                                  Colors.grey.shade500),
                                              AppFonts.text(
                                                  context,
                                                  getBookById
                                                      .data.value.author.name,
                                                  w * .040,
                                                  FontWeight.w500,
                                                  Colors.grey.shade500)
                                            ],
                                          )
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              SlideLeftRoute(
                                                  page: AuthorDetailPage(
                                                authorImage:
                                                    "https://booksica.s3.ap-south-1.amazonaws.com/${getBookById.data.value.author.photo}",
                                                authorName: getBookById
                                                    .data.value.author.name,
                                                aboutAuthor: "",
                                                authorId: getBookById
                                                    .data.value.author.id,
                                              )));
                                        },
                                        child: Text(
                                          "See About Author",
                                          style: GoogleFonts.poppins(
                                              fontSize: w * .030,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primary,
                                              decorationColor:
                                                  AppColors.primary,
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h * .015,
                            ),
                            Divider(
                              color: AppColors.appGrey,
                              height: h * .005,
                            ),
                            SizedBox(
                              height: h * .010,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * .040),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                      spacing: h * .010,
                                      runSpacing: h * .015,
                                      children: List.generate(
                                          getBookById
                                              .data.value.metaTags.length, (i) {
                                        return IntrinsicWidth(
                                          child: Container(
                                            height: h * .040,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey.shade500,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        w * .060)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: w * .030),
                                              child: Center(
                                                child: AppFonts.text(
                                                    context,
                                                    getBookById
                                                        .data.value.metaTags[i],
                                                    w * .030,
                                                    FontWeight.w500,
                                                    Colors.grey.shade600),
                                              ),
                                            ),
                                          ),
                                        );
                                      })),
                                  SizedBox(
                                    height: h * .030,
                                  ),
                                  Text(
                                    getBookById.data.value.description,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.poppins(
                                        fontSize: w * .035,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade500),
                                  ),
                                  SizedBox(
                                    height: h * .010,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: getBookById
                                          .data.value.specifications.length,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * .005),
                                          child: Row(
                                            children: [
                                              AppFonts.text(
                                                  context,
                                                  "${getBookById.data.value.specifications[i].key} :  ",
                                                  w * .035,
                                                  FontWeight.w600,
                                                  Colors.black54),
                                              AppFonts.text(
                                                  context,
                                                  " ${getBookById.data.value.specifications[i].value}",
                                                  w * .035,
                                                  FontWeight.w500,
                                                  Colors.grey.shade500),
                                            ],
                                          ),
                                        );
                                      }),
                                  SizedBox(
                                    height: h * .020,
                                  ),
                                  Row(
                                    children: [
                                      AppFonts.text(
                                          context,
                                          "   Qty:",
                                          w * .035,
                                          FontWeight.w500,
                                          Colors.grey.shade500),
                                      SizedBox(
                                        width: w * .020,
                                      ),
                                      Obx(
                                        () => Container(
                                          height: h * .060,
                                          width: w * .140,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.appGrey),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      w * .011)),
                                          child: Center(
                                            child: AppFonts.text(
                                                context,
                                                productDetailsController
                                                    .quantity.value
                                                    .toString(),
                                                w * .040,
                                                FontWeight.w600,
                                                AppColors.black),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: w * .020,
                                      ),
                                      SizedBox(
                                        height: h * .060,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (productDetailsController
                                                        .quantity.value >=
                                                    0) {
                                                  productDetailsController
                                                      .quantity.value++;
                                                }
                                              },
                                              child: Container(
                                                height: h * .025,
                                                width: w * .060,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color:
                                                            AppColors.appGrey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w * .005)),
                                                child: Center(
                                                  child: AppFonts.text(
                                                      context,
                                                      "+",
                                                      w * .030,
                                                      FontWeight.w600,
                                                      AppColors.black),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (productDetailsController
                                                        .quantity.value >
                                                    0) {
                                                  productDetailsController
                                                      .quantity.value--;
                                                }
                                              },
                                              child: Container(
                                                height: h * .025,
                                                width: w * .060,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color:
                                                            AppColors.appGrey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            w * .005)),
                                                child: Center(
                                                  child: AppFonts.text(
                                                      context,
                                                      "-",
                                                      w * .030,
                                                      FontWeight.w600,
                                                      AppColors.black),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: h * .035,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * .040),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppFonts.text(
                                          context,
                                          "Similar books",
                                          w * .045,
                                          FontWeight.w600,
                                          AppColors.black),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: h * .280,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.symmetric(
                                        vertical: h * .010,
                                        horizontal: w * .040),
                                    itemCount: getRelatedPRoducts.data1.length,
                                    itemBuilder: (context, i) {
                                      int length = 10;
                                      return Padding(
                                        padding: i == length - 1
                                            ? EdgeInsets.only(right: 0)
                                            : EdgeInsets.only(right: w * .060),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        ProductDetailsPage(
                                                            productId:
                                                                getRelatedPRoducts
                                                                    .data1[i]
                                                                    .id)));
                                          },
                                          child: NavCard.HomeBooksMainCard(
                                            context,
                                            "https://booksica.s3.ap-south-1.amazonaws.com/${getRelatedPRoducts.data1[i].thumbnail}",
                                            getRelatedPRoducts.data1[i].title,
                                            getRelatedPRoducts
                                                .data1[i].author['name'],
                                            getRelatedPRoducts.data1[i].mrp
                                                .toString(),
                                            getRelatedPRoducts.data1[i].price
                                                .toString(),
                                            "5.0",
                                            getRelatedPRoducts.data1[i].discount
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            UserPreferences.userId == ""
                                ? SizedBox()
                                : Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: w * .040),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppFonts.text(
                                                context,
                                                "Similar books",
                                                w * .045,
                                                FontWeight.w600,
                                                AppColors.black),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * .280,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * .010,
                                              horizontal: w * .040),
                                          itemCount: 10,
                                          itemBuilder: (context, i) {
                                            int length = 10;
                                            return Padding(
                                              padding: i == length - 1
                                                  ? EdgeInsets.only(right: 0)
                                                  : EdgeInsets.only(
                                                      right: w * .060),
                                              child: NavCard.HomeBooksMainCard(
                                                context,
                                                "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=pexels-souvenirpixels-414612.jpg&fm=jpg",
                                                "nfkrbfu",
                                                "nfkrbfu",
                                                "nf",
                                                "nf",
                                                "5.0",
                                                "35",
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: IntrinsicHeight(
                          child: Container(
                            color: AppColors.white,
                            child: AppBar(
                              centerTitle: false,
                              forceMaterialTransparency: true,
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
                              title: AppFonts.text(
                                  context,
                                  getBookById.data.value.title,
                                  w * .045,
                                  FontWeight.w500,
                                  AppColors.black),
                              actions: [
                                SizedBox(
                                  height: h * .035,
                                  width: w * .070,
                                  child: Image.asset(
                                    "assets/icons/shopcart.png",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(w * .035),
                                  child: Image.asset(
                                    "assets/icons/share.png",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: Duration(seconds: 1),
                        left: _leftPosition,
                        top: _topPosition,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: _containerHeight,
                          width: _containerWidth,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://booksica.s3.ap-south-1.amazonaws.com/${getBookById.data.value.thumbnail}"))),
                        ),
                      )
                    ],
                  ),
          ),
          bottomNavigationBar: Container(
            height: h * .070,
            decoration: BoxDecoration(
              color: AppColors.white,
            ),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: InkWell(
                      onTap: () {
                        if (!productDetailsController.addedToCart.value) {
                          cartApis.addItemsToCart(context, data: {
                            "product": widget.productId,
                            "qty": productDetailsController.quantity.value,
                            "update": false,
                            "userId": UserPreferences.userId
                          }).then((Value) {
                            productDetailsController.addedToCart.value = true;
                            _animateContainer();
                          });
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ShoppingCartPage()));
                        }
                        // _animateContainer(); // Call the function to move the container
                      },
                      child: Container(
                        height: h * .070,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border:
                              Border.all(width: 1, color: AppColors.appGrey),
                        ),
                        child: Obx(() => Center(
                              child: AppFonts.text(
                                  context,
                                  productDetailsController.addedToCart.value
                                      ? "View Cart"
                                      : "Add to cart",
                                  w * .035,
                                  FontWeight.w600,
                                  Colors.black54),
                            )),
                      )),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      height: h * .070,
                      color: AppColors.primary,
                      child: Center(
                        child: AppFonts.text(context, "Buy Now", w * .035,
                            FontWeight.w600, Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
