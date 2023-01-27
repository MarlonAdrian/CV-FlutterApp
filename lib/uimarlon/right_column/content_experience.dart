import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui/right_column/title_description.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContentExperience extends StatelessWidget {
  const ContentExperience({
    Key? key,
    required this.contentTitle,
    required this.sizingInformation,
  }) : super(key: key);

  final SizingInformation sizingInformation;
  final String contentTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 50),
          padding:
              sizingInformation.deviceScreenType != DeviceScreenType.desktop
                  ? const EdgeInsets.symmetric(horizontal: 16)
                  : const EdgeInsets.all(0),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      contentTitle.toUpperCase(),
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 50,
                          color: Colors.black87),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        TitleDescriptionWidget(
            title: 'Unidad educativa “María Angélica Idrobo”',
            description: '2012 - 2018',
            sizingInformation: sizingInformation),
        TitleDescriptionWidget(
            title: 'Escuela Politécnica Nacional (EPN) - ESFOT',
            description: '2020 (actual) ',
            sizingInformation: sizingInformation),
        TitleDescriptionWidget(
            title: 'CEC-EPN (English Language)',
            description: '2020 (actual) ',
            sizingInformation: sizingInformation),
      ],
    );
  }
}
