import 'package:FreshNest/common/color_extension.dart';
import 'package:FreshNest/common_widget/round_button.dart';
import 'package:FreshNest/view/login/verification_view.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  // --------------------------------------------------------------------------------------------------------------------------
  // Basically for the country code and the country picker. It is important to notice the place where it is written right now!!!
  TextEditingController txtMobile = TextEditingController();
  FlCountryCodePicker countryPicker = const FlCountryCodePicker();
  late CountryCode countryCode;

  // Another thing worth noticing!!!
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryCode = countryPicker.countryCodes
        .firstWhere((element) => element.name == "India");
  }
  // --------------------------------------------------------------------------------------------------------------------------

  // Here now comes the actual codes.
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "assets/img/bottom_bg.png",
                  height: media.height,
                  width: media.width,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Image.asset(
              "assets/img/sign_in_top.png",
              height: media.height,
              width: media.width,
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: media.width * 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Get your groceries\nwith FreshNest",
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 26,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          //* --------------------------------------------
                          //* -------- Main Working Code of this Screen --------
                          TextField(
                            controller: txtMobile,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixIcon: GestureDetector(
                                onTap: () async {
                                  final code = await countryPicker.showPicker(
                                      context: context);

                                  if (code != null) {
                                    countryCode = code;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  }
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      width: 35,
                                      height: 35,
                                      child: countryCode.flagImage(),
                                    ),
                                    Text(
                                      "${countryCode.dialCode}",
                                      style: TextStyle(
                                          color: TColor.primaryText,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    )
                                  ],
                                ),
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Mobile Number",
                              hintStyle: TextStyle(
                                color: TColor.placeholder,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          //* -----------------------------------------
                          Container(
                            width: double.maxFinite,
                            height: 1,
                            color: const Color(0xffE2E2E2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Or connect with social media",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: RoundIconButton(
                        title: "Continue with Google",
                        icon: "assets/img/google_logo.png",
                        bgColor: const Color(0xff5383EC),
                        //! -------------------------------------
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VerificationView()));
                        },
                        //! -------------------------------------
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ), //to make space between the two boxes.
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: RoundIconButton(
                        title: "Continue with Facebook",
                        icon: "assets/img/fb_logo.png",
                        bgColor: const Color(0xff4A66AC),
                        //! -------------------------------------
                        onPressed: () {},
                        //! -------------------------------------
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
