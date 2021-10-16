import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guides_app/Theme/color.dart';
import 'package:pokemon_guides_app/Theme/shadows.dart';
import 'package:pokemon_guides_app/Theme/sizes.dart';
import 'package:pokemon_guides_app/Theme/text_styles.dart';


class GuideElementButton extends StatelessWidget {
  const GuideElementButton({Key? key, required this.title, required this.page, required this.image}) : super(key: key);
  final title;
  final page;
  final image;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          //TODO: 버튼 클릭 애니메이션 만들기
          Get.to(page, transition: Transition.fadeIn);
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    Shadows.whiteBackgroundShadow
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.backgroundColorWhite
              ),
              child: image,
              padding: EdgeInsets.all(10),
            ),
            SizedBox(height: MarginSizes.xs,),
            Text(title, style: getRegularKrFont(AppColors.fontColorGrey, FontSizes.h3),)
          ],
        )
    );
  }
}
