import 'package:cozy_cove/constants/custom_colors.dart';
import 'package:cozy_cove/screens/onboarding/onboading_page_view.dart';
import 'package:cozy_cove/screens/solana_wallet.dart';
import 'package:cozy_cove/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:solana_wallets_flutter/solana_wallets_flutter.dart';

void main() {
  // initSolanaWallets();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
        //
        // MaterialApp(
        //     home: Scaffold(
        //       appBar: AppBar(
        //         title: const Text('Solana Wallets Flutter'),
        //         actions: const [AboutButton()],
        //       ),
        //       body: const Center(child: SelectButton()),
        //     ),
        //   );

        ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Mulish',
          colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.whiteColor)
              .copyWith(background: CustomColors.whiteColor),
        ),
        home: const OnboardingPageViewScreen(),
        routes: appRoutes,
      ),
    );
  }
}
