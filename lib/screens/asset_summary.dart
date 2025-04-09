import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:static_screens/widgets/header/back_navigation_helper_header.dart';
import 'package:static_screens/widgets/navbar.dart';

class AssetSummary extends StatefulWidget {
  const AssetSummary({super.key});

  @override
  State<AssetSummary> createState() {
    return _AssetSummaryState();
  }
}

class _AssetSummaryState extends State<AssetSummary> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final List<String> mediaItems = [
      'Video 1',
      'Video 2',
      'Image 1',
      'Image 2'
    ];

    return Scaffold(
      appBar: Navbar(),
      body: ScrollableContent(
        backgroundColor: theme.colorTheme.generic.background,
        footer:
            DigitCard(margin: const EdgeInsets.only(top: spacer2), children: [
          DigitButton(
            mainAxisSize: MainAxisSize.max,
            label: 'Next',
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
            onPressed: () {},
          ),
        ]),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: spacer4, horizontal: spacer3),
            child: BackNavigationHelpHeaderWidget(
              showBackNavigation: true,
              showHelp: false,
            ),
          ),
          Text(
            'Inverter Summary',
            style: textTheme.headingXl
                .copyWith(color: theme.colorTheme.primary.primary2),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: spacer3, horizontal: spacer3),
            child: DigitCard(children: [
              Text(
                'Health Facility Details',
                style: textTheme.headingM
                    .copyWith(color: theme.colorTheme.primary.primary2),
              ),
              Row(
                children: [
                  KeyColumn(keys: ['Health Facility Name', 'Status']),
                  const SizedBox(
                    width: spacer8,
                  ),
                  ValueColumn(values: ['Alkod', 'Pending Installation'])
                ],
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: spacer3, horizontal: spacer3),
            child: DigitCard(children: [
              Text(
                'Specifications',
                style: textTheme.headingM
                    .copyWith(color: theme.colorTheme.primary.primary2),
              ),
              Row(
                children: [
                  KeyColumn(keys: ['System', 'Capacity']),
                  const SizedBox(
                    width: spacer8,
                  ),
                  ValueColumn(values: ['AC', '1 KVA'])
                ],
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: spacer3, horizontal: spacer3),
            child: DigitCard(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Details',
                    style: textTheme.headingM
                        .copyWith(color: theme.colorTheme.primary.primary2),
                  ),
                  Icon(Icons.edit, color: theme.colorTheme.primary.primary1),
                ],
              ),
              Row(
                children: [
                  KeyColumn(keys: [
                    'Count',
                    'Warranty Start Date',
                    'Warranty Duration',
                    'Brand',
                    'Model No.'
                  ]),
                  const SizedBox(
                    width: spacer8,
                  ),
                  ValueColumn(values: [
                    '1',
                    '21/03/25',
                    '15 Years',
                    'Brand 1',
                    'Model 1'
                  ]),
                ],
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: spacer3, horizontal: spacer3),
            child: DigitCard(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Media',
                      style: textTheme.headingM
                          .copyWith(color: theme.colorTheme.primary.primary2),
                    ),
                    Icon(Icons.edit, color: theme.colorTheme.primary.primary1),
                  ],
                ),
                ...mediaItems.map((item) => Column(
                  children: [
                    MediaDownloadItem(
                      label: item,
                      onDownload: () {},
                    ),
                    const SizedBox(height: spacer1), // control space here
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class KeyColumn extends StatelessWidget {
  final List<String> keys;

  const KeyColumn({super.key, required this.keys});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: keys
          .map((key) => Padding(
                padding: const EdgeInsets.only(bottom: spacer2),
                child: Text(
                  key,
                  style: textTheme.headingS.copyWith(
                    color: theme.colorTheme.text.primary,
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class ValueColumn extends StatelessWidget {
  final List<String> values;

  const ValueColumn({super.key, required this.values});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: values
          .map((value) => Padding(
                padding: const EdgeInsets.only(bottom: spacer2),
                child: Text(
                  value,
                  style: textTheme.bodyS.copyWith(
                    color: theme.colorTheme.text.primary,
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class MediaDownloadItem extends StatelessWidget {
  final String label;
  final VoidCallback onDownload;

  const MediaDownloadItem({
    super.key,
    required this.label,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spacer1, horizontal: spacer1),
      child: Row(
        children: [
          Text(
            label,
            style: textTheme.bodyS.copyWith(
              color: theme.colorTheme.text.primary,
            ),
          ),
          IconButton(
            onPressed: onDownload,
            icon: const Icon(Icons.download_rounded),
            color: theme.colorTheme.text.secondary,
          ),
        ],
      ),
    );
  }
}
