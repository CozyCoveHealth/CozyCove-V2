import 'package:cozy_cove/constants/custom_string.dart';
import 'package:cozy_cove/screens/authentication/sign_in/rate_health_screen.dart';
import 'package:cozy_cove/screens/authentication/sign_in/sign_up_success_screen.dart';
import 'package:cozy_cove/utils/spacers.dart';
import 'package:cozy_cove/widgets/authentication_screen.dart';
import 'package:flutter/material.dart';

class KnowYouScreen extends StatefulWidget {
  static const routeName = '/KnowYouScreen';
  const KnowYouScreen({super.key});

  @override
  State<KnowYouScreen> createState() => _KnowYouScreenState();
}

class _KnowYouScreenState extends State<KnowYouScreen> {
  final TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  String pseudonym = "";
  String mobileNumber = "";
  String completeMobileNumber = "";
  String password = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      resizeToAvoidBottomInset: true,
      topPadding: 0,
      onBackTap: () {
        Navigator.canPop(context) ? Navigator.pop(context) : null;
      },
      onSkipButtonTap: () {
        Navigator.pushNamed(context, SignUpSuccessScreen.routeName);
      },
      buttonText: "Continue",
      isButtonLoading: isLoading,
      onButtonTap: () async {
        FocusScope.of(context).unfocus();
        setState(() {
          isLoading = true;
        });

        setState(() {
          isLoading = false;
        });
        Navigator.pushNamed(context, RateHealthScreen.routeName);
      },
      title: "We want to get to know you",
      subTitle:
          "You are special! Please complete the simple steps to have a personalized experience.",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              ConstantString.knowYou,
            ),
          ),
          verticalSpacer(20),
        ],
      ),
    );
  }
}
