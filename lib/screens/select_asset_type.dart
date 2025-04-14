import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_stepper.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:static_screens/widgets/header/back_navigation_helper_header.dart';
import 'package:static_screens/widgets/navbar.dart';

class SelectAssetType extends StatefulWidget {
  const SelectAssetType({super.key});
  @override
  State<SelectAssetType> createState() {
    return _SelectAssetTypeState();
  }
}

class _SelectAssetTypeState extends State<SelectAssetType> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
        appBar: Navbar(),
        body: ScrollableContent(
            footer: DigitCard(
                margin: const EdgeInsets.only(top: spacer2),
                children: [
                  DigitButton(
                    mainAxisSize: MainAxisSize.max,
                    label: 'Next',
                    type: DigitButtonType.primary,
                    size: DigitButtonSize.large,
                    onPressed: () {},
                  ),
                ]),
            backgroundColor: theme.colorTheme.generic.background,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: spacer2, vertical: spacer4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackNavigationHelpHeaderWidget(
                      showBackNavigation: true,
                      showHelp: false,
                    ),
                    SizedBox(
                      height: spacer4,
                    ),
                    SizedBox(
                      height: spacer12,
                      width: MediaQuery.of(context).size.width,
                      child: DigitStepper(
                        activeIndex: 0,
                        stepperList: [
                          const StepperData(),
                          const StepperData(),
                          const StepperData(),
                          const StepperData(),
                          const StepperData(),
                        ],
                        stepperDirection: Axis.horizontal,
                        inverted: true,
                      ),
                    ),
                    DigitCard(children: [
                      Text(
                        'Asset Type',
                        style: textTheme.headingXl
                            .copyWith(color: theme.colorTheme.primary.primary2),
                      ),
                      Text(
                        'Choose the asset type',
                        style: textTheme.bodyL
                            .copyWith(color: theme.colorTheme.text.primary),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select Asset Type',
                            style: textTheme.headingM.copyWith(
                              color: theme.colorTheme.text.primary,
                            ),
                          ),
                          const SizedBox(height: spacer1), // Reduce gap here
                          DigitDropdown(
                            items: [
                              DropdownItem(name: 'Inverter', code: 'inverter'),
                              DropdownItem(name: 'Battery', code: 'Battery'),
                              DropdownItem(name: 'Panel', code: 'Panel'),
                            ],
                          ),
                        ],
                      )
                    ])
                  ],
                ),
              )
            ]));
  }
}
