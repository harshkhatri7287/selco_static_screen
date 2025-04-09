import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:static_screens/widgets/navbar.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';

class DataSaveSuccessPage extends StatelessWidget {
  const DataSaveSuccessPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: Navbar(),
      body: Container(
        color: theme.colorTheme.generic.background,
        padding: EdgeInsets.all(spacer2),
        child: PanelCard(
          type: PanelType.success,
          title: 'Data Saved Successfully',
          description: 'The data has been saved successfully on your device. Please click submit to submit the report for approval on the health facility summary page.',
          actions: [
            DigitButton(
              type: DigitButtonType.primary,
              size: DigitButtonSize.large,
              label: 'Next',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}