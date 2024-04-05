import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/screens/app_view_model.dart';
import 'package:cozy_cove/screens/authentication/sign_in/pseudonym_input_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_up/sign_in_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/custom_border_button.dart';
import 'package:cozy_cove/widgets/new_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounsellorScreen extends StatefulHookConsumerWidget {
  static const routeName = '/CounsellorScreen';
  const CounsellorScreen({super.key});

  @override
  ConsumerState<CounsellorScreen> createState() => _CounsellorScreenState();
}

class _CounsellorScreenState extends ConsumerState<CounsellorScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const GetHelpRow(),
        Image.asset(
          ConstantString.meetConsellor,
        ),
        verticalSpacer(30),
        SizedBox(
          // height: 100,
          child: Column(
            children: [
              const AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Match with a Counsellor',
                    // key: ValueKey<String>(titleTexts[_currentPage]),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: CustomColors.blackTextColor),
                  ),
                ),
              ),
              verticalSpacer(10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Fill in a questionnaire to get the best match for your needs',
                        // key: ValueKey<String>(subTitleTexts[_currentPage]),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // fontWeight: FontWeight.w00,
                            fontSize: 14,
                            height: 1.4,
                            color: CustomColors.greyTextColor),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        verticalSpacer(40),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ref.watch(hasConnectedWalletProvider)
              ? NewCustomButton(
                  title: "Pay 10 USDC to continue",
                  onTap: () {
                    _showBottomModal(context);
                    // Navigator.pushNamed(context, PseudonyminputScreen.routeName);
                  })
              : NewCustomButton(
                  isLoading: isLoading,
                  title: "Connect Wallet",
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    // LOGIC TO CONNECT WALLET COMES HERE
                    await Future.delayed(const Duration(seconds: 2));
                    setState(() {
                      isLoading = false;
                    });
                    ref.read(hasConnectedWalletProvider.notifier).state = true;
                  }),
        ),
        verticalSpacer(30),
      ],
    );
  }

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 1.sh * 0.5,
          color: CustomColors.whiteColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    verticalSpacer(10),
                    Container(
                      height: 7,
                      width: 35,
                      decoration: BoxDecoration(
                          color: CustomColors.modalGreyColor,
                          borderRadius: BorderRadius.circular(12)),
                    )
                  ],
                ),
                Image.asset(
                  ConstantString.usdcImg,
                ),
                Column(
                  children: [
                    const Text(
                      'You’re about to pay 10 USDC',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.checkTextColor,
                      ),
                    ),
                    verticalSpacer(10),
                    const Text(
                      'A debit will occur on your wallet',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.modalLightColor),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomBorderButton(
                                      title: "Cancel",
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, SignInScreen.routeName);
                                      }),
                                ),
                              ],
                            ),
                          ),
                          horizontalSpacer(15),
                          Expanded(
                            flex: 2,
                            child: NewCustomButton(
                                title: "Proceed",
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, PseudonyminputScreen.routeName);
                                }),
                          ),
                        ],
                      ),
                      verticalSpacer(40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
