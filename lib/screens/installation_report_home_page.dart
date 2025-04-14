import 'package:badges/badges.dart' as badges;
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:static_screens/widgets/header/back_navigation_helper_header.dart';
import 'package:static_screens/widgets/navbar.dart';

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
      body: ScrollableContent(
        footer: PoweredByDigit(version: ''),
        backgroundColor: theme.colorTheme.generic.background,
        children: [
          BackNavigationHelpHeaderWidget(
            showHelp: true,
            showBackNavigation: true,
          ),
          const SizedBox(height: spacer3),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: spacer4, vertical: spacer2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Installation Report',
                  textAlign: TextAlign.start,
                  style: textTheme.headingXl.copyWith(
                    color: DigitColors().light.primary2,
                  ),
                ),
                const SizedBox(height: spacer6),
                ReportCard(
                  icon: Icons.add_box_outlined,
                  heading: 'New Report',
                  description:
                      'View list of assigned health facilities, search for health facility and create installation report',
                ),
                ReportCard(
                  icon: Icons.toc,
                  heading: 'Inbox',
                  description: 'View reports that have been approved/rejected',
                ),
                ReportCard(
                  icon: Icons.assignment_late,
                  heading: 'Submitted Reports',
                  description: 'View reports that have been submitted',
                ),
              ],
            ),
          )
        ],
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
      height: 3 * spacer11,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: spacer2),
        child: DigitCard(
          onPressed: () {},
          margin: const EdgeInsets.only(bottom: spacer1),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: DigitColors().light.alertError,
                      size: spacer8,
                    ),
                    const SizedBox(width: spacer2),
                    Text(
                      heading,
                      style: textTheme.headingL.copyWith(
                        color: DigitColors().light.primary2,
                      ),
                    ),
                    const Spacer(),
                    badges.Badge(
                      badgeStyle: badges.BadgeStyle(
                        shape: badges.BadgeShape.square,
                        badgeColor: theme.colorTheme.alert.error,
                        padding: const EdgeInsets.symmetric(
                            horizontal: spacer3, vertical: spacer1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      badgeContent: Text('05',
                          style: textTheme.bodyS
                              .copyWith(color: theme.colorTheme.paper.primary)),
                    ),
                  ],
                ),
                const SizedBox(height: spacer3),
                Text(
                  description,
                  style: textTheme.bodyS
                      .copyWith(color: DigitColors().light.textPrimary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
