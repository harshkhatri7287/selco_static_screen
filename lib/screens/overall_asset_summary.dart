import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/atoms/upload_popUp.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:static_screens/widgets/header/back_navigation_helper_header.dart';
import 'package:static_screens/widgets/navbar.dart';
import 'package:digit_ui_components/widgets/atoms/upload_drag.dart';
import 'package:file_picker/file_picker.dart';

class OverallAssetSummary extends StatefulWidget {
  const OverallAssetSummary({super.key});

  @override
  State<OverallAssetSummary> createState() => _OverallAssetSummaryState();
}

class _OverallAssetSummaryState extends State<OverallAssetSummary> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
        appBar: Navbar(),
        body: ScrollableContent(
          backgroundColor: theme.colorTheme.generic.background,
          footer:
              DigitCard(margin: const EdgeInsets.only(top: spacer2), children: [
            DigitButton(
              mainAxisSize: MainAxisSize.max,
              label: 'Submit',
              type: DigitButtonType.primary,
              isDisabled: true,
              size: DigitButtonSize.large,
              onPressed: () {
                // context.router.replace(const EnterOtpRoute());
              },
            ),
          ]),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: spacer2),
              child: BackNavigationHelpHeaderWidget(
                showBackNavigation: true,
                showHelp: false,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(spacer4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Summary',
                    style: textTheme.headingXl
                        .copyWith(color: theme.colorTheme.primary.primary2),
                  ),
                  const SizedBox(
                    height: spacer4,
                  ),
                  DigitCard(children: [
                    ElementAssetSummary(type: 'Battery', count: 2),
                    ElementAssetSummary(type: 'Inverter', count: 0),
                    ElementAssetSummary(type: 'Panel', count: 0),
                    DigitCard(children: [
                      DigitButton(
                        mainAxisSize: MainAxisSize.max,
                          label: 'Add More Assets',
                          prefixIcon: Icons.add_box,
                          onPressed: () {},
                          type: DigitButtonType.primary,
                          size: DigitButtonSize.medium)
                    ]),
                    ]),
                  const SizedBox(
                    height: spacer4,
                  ),
                  DigitCard(children: [
                    Text(
                      'Installation Completion Report',
                      style: textTheme.headingM
                          .copyWith(color: theme.colorTheme.primary.primary2),
                    ),
                    Text(
                      'Please scan and upload the installation completion report',
                      style: textTheme.bodyS
                          .copyWith(color: theme.colorTheme.text.secondary),
                    ),
                    // FileUploadWidget2(
                    //     onFilesSelected: (List<DroppedFile> files) {
                    //       Map<DroppedFile, String?> fileError = {};
                    //       return fileError;
                    //     },
                    //     label: 'File Upload'),
                    FileUploadWidget(
                      label: 'Upload',
                      onFilesSelected: (List<PlatformFile> files) {
                        Map<PlatformFile, String?> fileErrors = {};

                        return fileErrors;
                      },
                      showPreview: true,
                    ),
                  ])
                ],
              ),
            )
          ],
        ));
  }
}

class ElementAssetSummary extends StatelessWidget {
  final String type;
  final int count;

  const ElementAssetSummary({
    super.key,
    required this.type,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                'Total batteries\ninstalled',
                style: textTheme.headingS,
              ),
            ),
            const SizedBox(width: spacer6*3,),
            Text(
              '$count',
              style: textTheme.bodyL,
            ),
          ],
        ),
        if (count > 0)
          DigitCard(children: [
            DigitButton(
              mainAxisSize: MainAxisSize.max,
              label: 'View $type Summary',
              type: DigitButtonType.secondary,
              size: DigitButtonSize.medium,
              onPressed: () {
                // context.router.replace(const EnterOtpRoute());
              },
            ),
          ]),
        const SizedBox(height: spacer2),
        DigitDivider(),
      ],
    );
  }
}
