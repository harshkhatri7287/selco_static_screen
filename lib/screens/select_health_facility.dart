import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:static_screens/widgets/header/back_navigation_helper_header.dart';
import 'package:static_screens/widgets/navbar.dart';
import 'package:static_screens/widgets/progress_indicator/progress_indicator.dart';

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
              Padding(
                  padding: EdgeInsets.all(spacer4),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DigitButton(
                            label: 'Back',
                            prefixIcon: Icons.arrow_left,
                            onPressed: () {},
                            type: DigitButtonType.tertiary,
                            iconColor: theme.colorTheme.text.primary,
                            textColor: theme.colorTheme.text.primary,
                            size: DigitButtonSize.medium),
                        SizedBox(
                          height: spacer4,
                        ),
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
                                  height: spacer4,
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
                        InstallationReportCard(title: 'Something', dateAssigned: DateTime(2024,1,25), status: 'Pending Installation', solutionDocPath: 'somedocumnet',),
                        const SizedBox(height: spacer5,),
                        InstallationReportCard(title: 'Something', dateAssigned: DateTime(2024,1,25), status: 'Pending Installation', solutionDocPath: 'somedocumnet',)
                      ])),
            ]));
  }
}

class InstallationReportCard extends StatelessWidget {
  final String? title;
  final String? status;
  final DateTime? dateAssigned;
  final String? solutionDocPath;

  const InstallationReportCard({
    super.key,
    this.title,
    this.status,
    this.dateAssigned,
    this.solutionDocPath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    return DigitCard(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: textTheme.headingL
                .copyWith(color: theme.colorTheme.text.primary),
          ),
          const SizedBox(height: spacer4,),
          DigitDivider(dividerType: DividerType.medium,),
          Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: spacer4),
              Text('Status', style: textTheme.headingS.copyWith(color: theme.colorTheme.text.primary),),
              const SizedBox(height: spacer4),
              Text('Date Assigned', style: textTheme.headingS.copyWith(color: theme.colorTheme.text.primary),),
              const SizedBox(height: spacer4),
              Text('Solution Doc', style: textTheme.headingS.copyWith(color: theme.colorTheme.text.primary),)
            ],),
            const SizedBox(width: spacer12,),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: spacer4),
              Text('$status', style: textTheme.bodyL.copyWith(color: theme.colorTheme.text.primary),),
              const SizedBox(height: spacer4),
              Text('$dateAssigned', style: textTheme.bodyL.copyWith(color: theme.colorTheme.text.primary),),
              const SizedBox(height: spacer4),
              Row(children: [
                Icon(Icons.picture_as_pdf, color: theme.colorTheme.primary.primary1,),
                Text('$solutionDocPath', style: textTheme.bodyL.copyWith(color: theme.colorTheme.text.primary),),
              ],)
            ],),
          ],),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: ProgressIndicatorContainer(
                  label: '', prefixLabel: '', suffixLabel: '', value: 0.4),
            ),
            Text('40%', style: textTheme.bodyL.copyWith(color: theme.colorTheme.text.secondary),)
          ],),
          SizedBox(
            height: spacer10,
            width: double.infinity,
            child: DigitButton(
                label: 'Start Insallation Report',
                onPressed: () {},
                type: DigitButtonType.primary,
                size: DigitButtonSize.large),
          ),
          const SizedBox(height: spacer6,),
          SizedBox(
            height: spacer10,
            width: double.infinity,
            child: DigitButton(
                label: 'Submit For Approval',
                onPressed: () {},
                isDisabled: true,
                type: DigitButtonType.secondary,
                size: DigitButtonSize.large),
          ),
        ],
      )
    ]);
  }
}
