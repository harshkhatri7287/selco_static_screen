import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:static_screens/widgets/header/back_navigation_helper_header.dart';
import 'package:static_screens/widgets/navbar.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';

class InstallationReport extends StatefulWidget {
  const InstallationReport({super.key});

  @override
  State<StatefulWidget> createState() {
    return _InstallationReportState();
  }
}

class _InstallationReportState extends State<InstallationReport> {
  
  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    
    return Scaffold(
      appBar: Navbar(),
      body: Container(
        color: theme.colorTheme.generic.background,
        padding: EdgeInsets.symmetric(horizontal: spacer4, vertical: spacer7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              DigitButton(label: 'Back',
                  prefixIcon: Icons.arrow_left,
                  onPressed: () {},
                  type: DigitButtonType.tertiary,
                  iconColor: theme.colorTheme.text.primary,
                  textColor: theme.colorTheme.text.primary,
                  size: DigitButtonSize.large)
              ,
              Spacer(),
              DigitButton(label: 'Help',
                  suffixIcon: Icons.help_outline,
                  onPressed: () {},
                  type: DigitButtonType.tertiary  ,
                  size: DigitButtonSize.large)
            ],
            ),
            // BackNavigationHelpHeaderWidget(showHelp: true, showBackNavigation: true,),
            const SizedBox(height: spacer6),
            Text('Installation Report',
            textAlign: TextAlign.start,
            style: textTheme.headingXl.copyWith(color: DigitColors().light.primary2,),
            ),
            const SizedBox(height: spacer6),
            ReportCard(
              icon: Icons.note_add,
              heading: 'New Report',
              description:
              'View list of assigned health facilities, search for health facility and create installation report',
            ),
            ReportCard(
              icon: Icons.menu,
              heading: 'Inbox',
              description:
              'View reports that have been approved/rejected',
            ),
            ReportCard(
              icon: Icons.assignment_turned_in,
              heading: 'Submitted Reports',
              description:
              'View reports that have been submitted',
            ),
            Spacer(),
            PoweredByDigit(version: '',)
          ],
        ),
      ),
    );
  }
}

class ReportCard extends StatelessWidget {

  // Add OnPressed function here

  final IconData icon;
  final String heading;
  final String description;

  const ReportCard({
    super.key,
    required this.icon,
    required this.heading,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return SizedBox(
      height: 3*spacer11,
      child : DigitCard(
        onPressed: () {},
        margin: const EdgeInsets.only(bottom: spacer4),
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: DigitColors().light.alertError),
                const SizedBox(width: 8),
                Text(
                  heading,
                  style: textTheme.headingM.copyWith(color: DigitColors().light.primary2,),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: textTheme.bodyS.copyWith(color: DigitColors().light.textSecondary),
            ),
          ],
        ),
      ],),
    );
  }
}