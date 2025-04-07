import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:static_screens/widgets/navbar.dart';
// import 'package:digit_ui_components/theme/spacers.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const Navbar(),
      body: ScrollableContent(
        backgroundColor: theme.colorTheme.generic.background,
        footer: ProceedButton(),
        children: [
          const Expanded(child: WelcomeContent()), // Scrollable body
          // ProceedButton(), // Bottom button
        ],
      ),
    );
  }
}

class MenuItem {
  final String title;
  final String description;
  final String imagePath;

  const MenuItem({required this.title, required this.description, required this.imagePath});
}

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    final List<MenuItem> menuItems = const [
      MenuItem(
        title: "View Health Facilities",
        description: "You can view the health facilities assigned to you for installation",
        imagePath: "assets/images/welcome_page_1.png",
      ),
      MenuItem(
        title: "Create Reports",
        description: "Create installation reports for the health facilities assigned to you (online and offline)",
        imagePath: "assets/images/welcome_page_2.png",
      ),
      MenuItem(
        title: "Save Reports",
        description: "Save installation reports offline until ready for submission",
        imagePath: "assets/images/welcome_page_2.png",
      ),
      MenuItem(
        title: "Submit for Approval",
        description: "Save installation reports offline until ready for submission",
        imagePath: "assets/images/welcome_page_2.png",
      ),
      MenuItem(
        title: "Edit Reports",
        description: "Save installation reports offline until ready for submission",
        imagePath: "assets/images/welcome_page_2.png",
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spacer5, horizontal: spacer3),
      child: DigitCard(
        // padding: const EdgeInsets.all(spacer4),
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: textTheme.headingL.copyWith(color: DigitColors().light.primary2)
            ),
            const SizedBox(height: spacer3),
            Text(
              'Through this application you will be able to:',
              style: textTheme.bodyS,
            ),
            // const SizedBox(height: spacer4),
            ...menuItems.map((item) => Container(
              margin: const EdgeInsets.symmetric(vertical: spacer5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(item.imagePath, height: 90, width: 90,),
                      const SizedBox(width: spacer6),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: textTheme.headingS.copyWith(color: DigitColors().light.primary2)
                            ),
                            const SizedBox(height: spacer1),
                            Padding(
                              padding: const EdgeInsets.only(right: spacer7),
                              child: Text(
                                item.description,
                                style: textTheme.headingXS.copyWith(color: DigitColors().light.textSecondary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: spacer5,),
                  DigitDivider(dividerType: DividerType.small,)
                ],
              ),
            ),
            ),
          ],
        ),
      ],
    ),
        );
  }
}

class ProceedButton extends StatelessWidget {
  const ProceedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DigitCard(
        margin: const EdgeInsets.only(top: spacer2),
        children: [  DigitButton(
          suffixIcon: Icons.arrow_forward_outlined,
          mainAxisSize: MainAxisSize.max,
          label: 'Proceed',
          type: DigitButtonType.primary,
          size: DigitButtonSize.large,
          onPressed: () {},
        ),]);
  }
}
