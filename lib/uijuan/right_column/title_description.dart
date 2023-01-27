import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TitleDescriptionWidget extends StatelessWidget {
  const TitleDescriptionWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.sizingInformation,
  }) : super(key: key);

  final SizingInformation sizingInformation;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: sizingInformation.deviceScreenType != DeviceScreenType.desktop
          ? const EdgeInsets.symmetric(horizontal: 16)
          : const EdgeInsets.all(0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title.toUpperCase(),
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600, fontSize: 20, color: primaryColor),
        ),
        Wrap(
          children: [
            Text(
              description,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                  color: primaryColor),
            ),
          ],
        )
      ]),
    );
  }
}
