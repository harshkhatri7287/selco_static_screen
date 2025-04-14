import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:static_screens/widgets/header/back_navigation_helper_header.dart';
import 'package:static_screens/widgets/navbar.dart';

class SelectHealthFacility extends StatefulWidget {
  const SelectHealthFacility({super.key});
  @override
  State<SelectHealthFacility> createState() {
    return _SelectHealthFacilityState();
  }
}

class _SelectHealthFacilityState extends State<SelectHealthFacility> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
        appBar: Navbar(),
        body: ScrollableContent(
            backgroundColor: theme.colorTheme.generic.background,
            children: [
              BackNavigationHelpHeaderWidget(
                showBackNavigation: true,
                showHelp: false,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: spacer4, vertical: spacer2),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DigitCard(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Select Health Facility',
                                  style: textTheme.bodyL.copyWith(
                                      color: theme.colorTheme.text.primary),
                                ),
                                SizedBox(
                                  height: spacer2,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: DigitSearchFormInput(
                                        suffixIcon: Icons.search,
                                      ),
                                    ),
                                    Icon(
                                      Icons.import_export,
                                      color: theme.colorTheme.primary.primary1,
                                      size: spacer8,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: spacer8),
                        InstallationReportCard(
                          title: 'Alkod',
                          dateAssigned: DateTime(2024, 1, 25),
                          status: 'Pending Installation',
                          solutionDocPath: 'Allepy Solution Doc',
                        ),
                        const SizedBox(
                          height: spacer5,
                        ),
                        InstallationReportCard(
                          title: 'Allepy',
                          dateAssigned: DateTime(2024, 1, 25),
                          status: 'Pending Installation',
                          solutionDocPath: 'Allepy Solution Doc',
                        )
                      ])),
            ]));
  }
}

class InstallationReportCard extends StatelessWidget {
  final String? title;
  final String? status;
  final DateTime dateAssigned;
  final String? solutionDocPath;

  const InstallationReportCard({
    super.key,
    this.title,
    this.status,
    required this.dateAssigned,
    this.solutionDocPath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    String formattedDate = DateFormat('dd/MM/yy').format(dateAssigned);

    return DigitCard(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: textTheme.headingL
                .copyWith(color: theme.colorTheme.text.primary),
          ),
          const SizedBox(
            height: spacer4,
          ),
          DigitDivider(
            dividerType: DividerType.small,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: spacer4),
                  Text(
                    'Status',
                    style: textTheme.headingS
                        .copyWith(color: theme.colorTheme.text.primary),
                  ),
                  const SizedBox(height: spacer4),
                  Text(
                    'Date Assigned',
                    style: textTheme.headingS
                        .copyWith(color: theme.colorTheme.text.primary),
                  ),
                  const SizedBox(height: spacer4),
                  Text(
                    'Solution Doc',
                    style: textTheme.headingS
                        .copyWith(color: theme.colorTheme.text.primary),
                  )
                ],
              ),
              const SizedBox(
                width: spacer12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: spacer4),
                  Text(
                    '$status',
                    style: textTheme.bodyL
                        .copyWith(color: theme.colorTheme.text.primary),
                  ),
                  const SizedBox(height: spacer4),
                  Text(
                    formattedDate,
                    style: textTheme.bodyL
                        .copyWith(color: theme.colorTheme.text.primary),
                  ),
                  const SizedBox(height: spacer4),
                  Row(
                    children: [
                      Icon(
                        Icons.picture_as_pdf,
                        color: theme.colorTheme.primary.primary1,
                      ),
                      Text(
                        '$solutionDocPath',
                        style: textTheme.bodyL
                            .copyWith(color: theme.colorTheme.text.secondary),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: spacer4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              // textBaseline: TextBaseline.ideographic,
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    backgroundColor: theme.colorTheme.generic.background,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      theme.colorTheme.alert.success,
                    ),
                    value: 0.4,
                    minHeight: spacer3,
                  ),
                ),
                Text(
                  '40%',
                  style: textTheme.bodyS
                      .copyWith(color: theme.colorTheme.text.secondary),
                )
              ],
            ),
          ),
          // Row(
          //   children: [
          //     ProgressIndicatorContainer(label: '', prefixLabel: '', suffixLabel: '', value: 0.4),
          //   ],
          // ),
          DigitButton(
              mainAxisSize: MainAxisSize.max,
              label: 'Start Installation Report',
              onPressed: () {},
              type: DigitButtonType.primary,
              size: DigitButtonSize.large),
          const SizedBox(
            height: spacer4,
          ),
          DigitButton(
              mainAxisSize: MainAxisSize.max,
              label: 'Submit For Approval',
              onPressed: () {},
              isDisabled: true,
              type: DigitButtonType.secondary,
              size: DigitButtonSize.large),
        ],
      )
    ]);
  }
}
