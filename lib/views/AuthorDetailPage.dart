import 'package:booksica/apis/getAllBooksApi.dart';
import 'package:booksica/models/allBooks.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/Cards.dart';
import 'package:booksica/utils/text.dart';
import 'package:booksica/views/productDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AuthorDetailPage extends StatefulWidget {
  String authorImage;
  String authorName;
  String aboutAuthor;
  String authorId;
  AuthorDetailPage(
      {super.key,
      required this.authorName,
      required this.authorImage,
      required this.aboutAuthor,
      required this.authorId});

  @override
  State<AuthorDetailPage> createState() => _AuthorDetailPageState();
}

class _AuthorDetailPageState extends State<AuthorDetailPage> {
  GetAllBooksApi getAllBooksApi = Get.put(GetAllBooksApi());

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
  void initState() {
    // TODO: implement initState
    getAllBooksApi.getAllBooks(context, author: widget.authorId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          centerTitle: true,
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
              context, "Author", w * .045, FontWeight.w500, AppColors.black),
        ),
        body: SlidingUpPanel(
            minHeight: (h) - (w * 1.100),
            maxHeight: h,
            boxShadow: const [BoxShadow(color: Colors.white)],
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .040),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * .040,
                  ),
                  Container(
                    height: h * .240,
                    width: w * .800,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 228, 240, 250),
                              blurRadius: 6,
                              spreadRadius: 4)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(w * .030)),
                    child: Padding(
                      padding: EdgeInsets.all(w * .080),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: h * .085,
                                width: w * .180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(w * .050),
                                  border: Border.all(
                                      color: Colors.blue.shade300, width: 2),
                                ),
                                child: Center(
                                    child: Container(
                                  height: h * .070,
                                  width: w * .150,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              NetworkImage(widget.authorImage)),
                                      borderRadius:
                                          BorderRadius.circular(w * .045),
                                      color: AppColors.primary),
                                )),
                              ),
                              SizedBox(
                                width: w * .050,
                              ),
                              AppFonts.text(
                                  context,
                                  widget.authorName.toString().length > 13
                                      ? "${widget.authorName.toString().substring(0, 14)}.."
                                      : widget.authorName.toString(),
                                  w * .043,
                                  FontWeight.w600,
                                  Colors.black54),
                            ],
                          ),
                          SizedBox(
                            height: h * .020,
                          ),
                          AppFonts.text(context, "About author", w * .043,
                              FontWeight.w600, Colors.black54),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            panelBuilder: (ScrollController scrollController) =>
                SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * .040),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: h * .005,
                            width: w * .080,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w * .030),
                                color: AppColors.black),
                          ),
                        ),
                        SizedBox(
                          height: h * .010,
                        ),
                        AppFonts.text(context, "Books By ${widget.authorName}",
                            w * .043, FontWeight.w600, Colors.black),
                        SizedBox(
                          height: h * .010,
                        ),
                        Obx(() => getAllBooksApi.data1.isNotEmpty ||
                                !getAllBooksApi.isLoading.value
                            ? ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: getAllBooksApi.data1.length,
                                itemBuilder: (context, i) {
                                  int length = getAllBooksApi.data1.length;
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: h * .010),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetailsPage(
                                                            productId:
                                                                getAllBooksApi
                                                                    .data1[i]
                                                                    .id)));
                                          },
                                          child: NavCard.filterComponent(
                                              context, getAllBooksApi.data1[i]),
                                        ),
                                        i != length - 1
                                            ? Divider(
                                                color: AppColors.appGrey,
                                              )
                                            : const SizedBox()
                                      ],
                                    ),
                                  );
                                })
                            : Skeletonizer(
                                enabled: true,
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 15,
                                    itemBuilder: (context, i) {
                                      int length = 15;
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: h * .010),
                                        child: Column(
                                          children: [
                                            NavCard.filterComponent(
                                                context, data),
                                            i != length - 1
                                                ? Divider(
                                                    color: AppColors.appGrey,
                                                  )
                                                : const SizedBox()
                                          ],
                                        ),
                                      );
                                    }),
                              )),
                        SizedBox(
                          height: w * .400,
                        )
                      ],
                    ),
                  ),
                )));
  }
}
