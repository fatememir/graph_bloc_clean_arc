import 'package:flutter/material.dart';

import '../../../../core/components/buttons/blue_text_button.dart';
import '../../../../core/components/buttons/wide_blue_button.dart';
import '../../../../core/components/jaan_logo_with_text.dart';
import '../../../../core/components/tab_page_selector.dart';
import '../../../../core/components/texts/extra_bold_title.dart';
import '../../../../core/components/texts/small_description_text.dart';
import '../../../../core/routes/const.dart';


class GratitudeScreen extends StatefulWidget {
  const GratitudeScreen({Key? key}) : super(key: key);

  @override
  State<GratitudeScreen> createState() => _GratitudeScreenState();
}

class _GratitudeScreenState extends State<GratitudeScreen>
    with SingleTickerProviderStateMixin {
  final PageController controller = PageController();
  final int _numDots = 3;
  late final TabController _controller;

  @override
  void initState() {
    _controller = TabController(
      length: _numDots,
      vsync: this,
    );
    controller.addListener(() {
      setState(() {
        _controller.index = controller.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/gratitude_illustration.png'),
              Image.asset(
                'assets/images/light_line_logo.png',
                alignment: Alignment.center,
                height: 196,
                width: 196,
              )
            ],
          ),
          const SizedBox(height: 48),
          const JaanLogoWithText(),
          const SizedBox(height: 24),
          SizedBox(
            height: 200,
            child: PageView(
              controller: controller,
              children: <Widget>[
                pageViewItem(
                  "آرامش حضور\nدر اینجا و اکنون",
                  "لمس حضور در لحظه‌ی حال، همینجا؛ همین الآن",
                ),
                pageViewItem(
                  "تمرین\nذهن آگاهی و مدیتیشن",
                  "کاهش اضطراب و استرس، کاهش شلوغی ذهنی، افزایش تمرکز، افزایش کیفیت خواب و بهبود سلامت ذهن",
                ),
                pageViewItem(
                  "محتوای\nاصولی و علمی",
                  "همراهی در مسیر توسط مربی‌های با تجربه‌ی سال‌ها تمرین و زندگی آموزه‌ها و تکنیک‌هایی که اثرگذاریشان از لحاظ علمی اثبات‌ شده است.",
                ),
              ],
            ),
          ),
          MyTabPageSelector(
            color: const Color(0xFFD8D8D8),
            selectedColor: const Color(0xFF2FA4ED),
            controller: _controller,
            indicatorSize: 8,
          ),
          const SizedBox(height: 24),
          WideBlueButton(
            text: "ورود به جآن",
            onPressed: () {
              Navigator.of(context).pushNamed(RouteName.login);
            },
            status: true,
          ),
          const SizedBox(height: 8),
          BlueTextButton(
            text: "ورود به عنوان مهمان",
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(RouteName.onboarding);
            },
          )
        ],
      ),
    );
  }

  Widget pageViewItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          ExtraBoldTitle(title: title),
          const SizedBox(height: 16),
          SmallDescriptionText(text: description),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
