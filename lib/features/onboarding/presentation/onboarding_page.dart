import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/routes.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacer.dart';
import '../../../core/widgets/personal_info_form.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.themeData.colorScheme.surface,
      body: Container(
        height: .infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding.jpeg'),
            fit: .cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Image.asset('assets/icons/icon_foreground.png'),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${context.locale.onboardingwelcome} ',
                        style: context.themeData.textTheme.titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                      TextSpan(
                        text: context.locale.appname,
                        style: context.themeData.textTheme.titleLarge!.copyWith(
                          color: context.themeData.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(12),
                Text(
                  context.locale.onboardingintro,
                  style: context.themeData.textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
                verticalSpace(24),
                PersonalInfoForm(
                  onDone: () {
                    context.go(Routes.homepage);
                  },
                ),
                Align(
                  alignment: .center,
                  child: Text(
                    context.locale.caneditlater,
                    style: context.themeData.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
