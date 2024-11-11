import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../shared_prefrences/shared_prefrence.dart';
import '../../../../../utils/animations/fade_in_animation/animation_design.dart';
import '../../../../../utils/animations/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../../utils/animations/fade_in_animation/fade_in_animation_model.dart';
import '../signup/signup_screen.dart';
import 'service_card.dart'; // Import the ServiceCard widget

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.animationIn();

    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
        body: Stack(
          children: [
            TFadeInAnimation(
              isTwoWayAnimation: false,
              durationInMs: 1200,
              animate: TAnimatePosition(
                bottomAfter: 0,
                bottomBefore: -100,
                leftBefore: 0,
                leftAfter: 0,
                topAfter: 0,
                topBefore: 0,
                rightAfter: 0,
                rightBefore: 0,
              ),
              child: Container(
                padding: const EdgeInsets.all(tDefaultSpace),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: 'welcome-image-tag',
                      child: Image(
                        image: const AssetImage(tLogoImage),
                        width: width * 0.5,
                        height: height * 0.2,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          tWelcomeTitle,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          tWelcomeSubTitle,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ServiceCard(
                            imagePath: tPatientImage,
                            title: 'Patient',
                            onTap: () async {
                              await saveUserType("Patient");
                              Get.to(() => const SignupScreen());
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: ServiceCard(
                            imagePath: tMedicalStoreImage,
                            title: 'Medi-Store',
                            onTap: () async {
                              await saveUserType("Medical-Store");
                              Get.to(() => const SignupScreen());
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ServiceCard(
                            imagePath: tNurseImage,
                            title: 'Nurse',
                            onTap: () async {
                              await saveUserType("Nurse");
                              Get.to(() => const SignupScreen());
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: ServiceCard(
                            imagePath: tLabImage,
                            title: 'Lab',
                            onTap: () async {
                              await saveUserType("Lab");
                              Get.to(() => const SignupScreen());
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
