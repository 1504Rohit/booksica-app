import 'package:booksica/apis/address.api.dart';
import 'package:booksica/models/address.dart';
import 'package:booksica/styles/colors.dart';
import 'package:booksica/utils/AppButtons.dart';
import 'package:booksica/utils/text.dart';
import 'package:booksica/utils/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddressFormPage extends StatefulWidget {
  Address data;
  AddressFormPage({super.key, required this.data});

  @override
  State<AddressFormPage> createState() => _AddressFormPageState();
}

class _AddressFormPageState extends State<AddressFormPage> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController address3 = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController state = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  AddressApi addressApi = Get.put(AddressApi());

  @override
  void initState() {
    // TODO: implement initState
    if (widget.data.id.toString().length > 0) {
      name.text = widget.data.name;
      phone.text = widget.data.phone.toString();
      address1.text = widget.data.address;
      address2.text = widget.data.area;
      address3.text = widget.data.landmark;
      pincode.text = widget.data.pincode.toString();
      district.text = widget.data.city;
      state.text = widget.data.state;
    }
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
        title: AppFonts.text(context, "Edit Address", w * .045, FontWeight.w500,
            AppColors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .040, vertical: h * .030),
        child: IntrinsicHeight(
          child: Container(
            width: w,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade500),
                borderRadius: BorderRadius.circular(w * .020)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * .040, vertical: h * .020),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppFonts.text(context, "Contact Details", w * .038,
                          FontWeight.w500, AppColors.black),
                      SizedBox(
                        height: h * .010,
                      ),
                      CustomFormField.custTextFormAddress(
                          context,
                          "Name*",
                          1,
                          100,
                          null,
                          null,
                          TextInputType.text,
                          (value) {},
                          name, (value) {
                        if (value!.isEmpty) {
                          return 'This Field is required';
                        }
                        return null;
                      }, false, (value) {}, () {}),
                      SizedBox(
                        height: h * .010,
                      ),
                      CustomFormField.custTextFormAddress(
                          context,
                          "Mobile Number*",
                          1,
                          10,
                          null,
                          null,
                          TextInputType.number,
                          (value) {},
                          phone, (value) {
                        if (value!.isEmpty) {
                          return 'This Field is required';
                        }
                        return null;
                      }, false, (value) {}, () {}),
                      SizedBox(
                        height: h * .030,
                      ),
                      AppFonts.text(context, "Address", w * .038,
                          FontWeight.w500, AppColors.black),
                      SizedBox(
                        height: h * .010,
                      ),
                      CustomFormField.custTextFormAddress(
                          context,
                          "Address*",
                          1,
                          100,
                          null,
                          null,
                          TextInputType.text,
                          (value) {},
                          address1, (value) {
                        if (value!.isEmpty) {
                          return 'This Field is required';
                        }
                        return null;
                      }, false, (value) {}, () {}),
                      SizedBox(
                        height: h * .010,
                      ),
                      CustomFormField.custTextFormAddress(
                          context,
                          "Area*",
                          1,
                          100,
                          null,
                          null,
                          TextInputType.text,
                          (value) {},
                          address2, (value) {
                        if (value!.isEmpty) {
                          return 'This Field is required';
                        }
                        return null;
                      }, false, (value) {}, () {}),
                      SizedBox(
                        height: h * .010,
                      ),
                      CustomFormField.custTextFormAddress(
                          context,
                          "Landmark*",
                          1,
                          100,
                          null,
                          null,
                          TextInputType.text,
                          (value) {},
                          address3, (value) {
                        if (value!.isEmpty) {
                          return 'This Field is required';
                        }
                        return null;
                      }, false, (value) {}, () {}),
                      SizedBox(
                        height: h * .010,
                      ),
                      CustomFormField.custTextFormAddress(
                          context,
                          "Pin Code*",
                          1,
                          100,
                          null,
                          null,
                          TextInputType.number,
                          (value) {},
                          pincode, (value) {
                        if (value!.isEmpty) {
                          return 'This Field is required';
                        }
                        return null;
                      }, false, (value) {}, () {}),
                      SizedBox(
                        height: h * .010,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: w / 2.5,
                            child: CustomFormField.custTextFormAddress(
                                context,
                                "City*",
                                1,
                                100,
                                null,
                                null,
                                TextInputType.text,
                                (value) {},
                                district, (value) {
                              if (value!.isEmpty) {
                                return 'This Field is required';
                              }
                              return null;
                            }, false, (value) {}, () {}),
                          ),
                          SizedBox(
                            width: w / 2.5,
                            child: CustomFormField.custTextFormAddress(
                                context,
                                "State*",
                                1,
                                100,
                                null,
                                null,
                                TextInputType.text,
                                (value) {},
                                state, (value) {
                              if (value!.isEmpty) {
                                return 'This Field is required';
                              }
                              return null;
                            }, false, (value) {}, () {}),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * .020,
                      ),
                      Obx(() => AppButtons.loginLike(context, () {
                            final isValid = _formKey.currentState!.validate();
                            if (!isValid) {
                              return;
                            }
                            if (widget.data.id.toString().length > 0) {
                              addressApi.updateAddress(context,
                                  id: widget.data.id,
                                  data: {
                                    "name": name.text,
                                    "address": address1.text,
                                    "area": address2.text,
                                    "pincode": int.parse(pincode.text),
                                    "city": district.text,
                                    "state": state.text,
                                    "phone": int.parse(phone.text),
                                    "landmark": address3.text
                                  }).then((Value) {
                                addressApi.getAllAddress(context).then((Value) {
                                  Navigator.pop(context);
                                });
                              });
                            } else {
                              addressApi.addAddress(context, data: {
                                "name": name.text,
                                "address": address1.text,
                                "area": address2.text,
                                "pincode": pincode.text,
                                "city": district.text,
                                "state": state.text,
                                "phone": phone.text,
                                "landmark": address3.text
                              }).then((value) {
                                addressApi.getAllAddress(context).then((Value) {
                                  Navigator.pop(context);
                                });
                              });
                            }
                          },
                              Center(
                                child: AppFonts.text(context, "Add Address",
                                    w * .038, FontWeight.w500, AppColors.white),
                              ),
                              AppColors.primary,
                              widget.data.id.toString().length > 0
                                  ? addressApi.updateLoading.value
                                  : addressApi.addAddressLoading.value,
                              h * .056,
                              w * .020))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
