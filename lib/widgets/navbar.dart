import 'package:digit_ui_components/digit_components.dart';
// import 'package:digit_ui_components/theme/colors.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(spacer12);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    return AppBar(
      foregroundColor: theme.colorTheme.paper.primary,
      backgroundColor: theme.colorTheme.primary.primary2,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white, size: spacer6),
        onPressed: () {},
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/digit_logo.png',
            height: spacer4,
          ),
          const SizedBox(width: spacer2),
          Container(
            width: 1, //Need to ask about this vertical line
            height: spacer6,
            color: DigitColors().light.paperPrimary,
          ),
          const SizedBox(width: spacer2), // Reduced spacing
          Text(
            'SELCO',
            style: textTheme.bodyS.copyWith(  color: const DigitColors().light.paperPrimary,)
          ),
        ],
      ),
    );
  }
}
