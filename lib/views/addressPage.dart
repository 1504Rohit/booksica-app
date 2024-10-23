import 'package:booksica/apis/address.api.dart';
import 'package:booksica/models/address.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/AppButtons.dart';
import 'package:booksica/utils/text.dart';
import 'package:booksica/views/AddressFormPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  AddressApi addressApi = Get.put(AddressApi());
  Address data = Address.fromJson({
    "_id": "",
    "name": "Rohit",
    "address": "33, kandoya gali shree ram bhavan",
    "area": "kila",
    "pincode": 458001,
    "city": "Mandsaur",
    "state": "Madhya Pradesh",
    "phone": 8770764651,
    "landmark": "sitla maata mandir",
    "defaultAddress": true,
    "disabled": false,
    "userId": "65c8e502d4b66a0499b99701",
    "__v": 0
  });

  @override
  void initState() {
    // TODO: implement initState
    // addressApi.getAllAddress(context).then((Value) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
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
            context, "Address", w * .045, FontWeight.w500, AppColors.black),
        actions: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * .040, vertical: h * .005),
            child: SizedBox(
              width: w * .350,
              child: AppButtons.loginLike(context, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddressFormPage(data: data)));
              },
                  Center(
                    child: AppFonts.text(context, 'Add Address', w * .030,
                        FontWeight.w400, AppColors.white),
                  ),
                  AppColors.primary,
                  false,
                  h * .040,
                  w * .010),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * .040),
          child: Column(
            children: [
              SizedBox(
                height: h * .020,
              ),
              Obx(() => ListView.builder(
                  itemCount: addressApi.addressData.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: h * .020),
                      child: InkWell(
                        onTap: () {
                          addressApi.updateAddress(context,
                              id: addressApi.addressData[i].id,
                              data: {"defaultAddress": true}).then((value) {
                            addressApi.getAllAddress(context);
                          });
                        },
                        child: Container(
                          height: h * .140,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 2,
                                    blurRadius: 6)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(w * .035)),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * .040, vertical: w * .050),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppFonts.text(
                                        context,
                                        addressApi.addressData[i].name,
                                        w * .038,
                                        FontWeight.w500,
                                        Colors.black87),
                                    AppFonts.text(
                                        context,
                                        addressApi.addressData[i].phone
                                            .toString(),
                                        w * .028,
                                        FontWeight.w400,
                                        Colors.black87),
                                    SizedBox(
                                      height: h * .010,
                                    ),
                                    SizedBox(
                                      width: w * .600,
                                      child: Text(
                                        "${addressApi.addressData[i].address} ${addressApi.addressData[i].landmark} ${addressApi.addressData[i].area} ${addressApi.addressData[i].city} ${addressApi.addressData[i].pincode}",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                            fontSize: w * .028,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    addressApi.addressData[i].defaultAddress
                                        ? Container(
                                            height: h * .030,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppColors.primary,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        w * .008)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: w * .020),
                                              child: Center(
                                                  child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: w * .008,
                                                    backgroundColor:
                                                        Colors.green,
                                                  ),
                                                  SizedBox(
                                                    width: w * .010,
                                                  ),
                                                  AppFonts.text(
                                                      context,
                                                      "Active",
                                                      w * .028,
                                                      FontWeight.w500,
                                                      AppColors.primary),
                                                ],
                                              )),
                                            ),
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      width: w * .015,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => AddressFormPage(
                                                      data: addressApi
                                                          .addressData[i],
                                                    )));
                                      },
                                      child: Image.asset(
                                        'assets/icons/addEdit.png',
                                        height: h * .060,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
