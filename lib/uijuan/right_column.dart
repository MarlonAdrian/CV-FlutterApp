import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/uijuan/right_column/content_experience.dart';
import 'package:flutter_application_1/uijuan/right_column/content_widget.dart';
import 'package:flutter_application_1/uijuan/right_column/nameWitget.dart';
import 'package:flutter_application_1/uijuan/right_column/personalInfo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RightColumn extends StatelessWidget {
  final SizingInformation sizingInformation;

  RightColumn(this.sizingInformation);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Nombre
              NameWidget(sizingInformation),
              // Informaicon de contacto
              PersonalInfo()
            ],
          ),
          ContentWidget(
              contentTitle: 'EXPERIENCIA',
              sizingInformation: sizingInformation),
          ContentExperience(
              contentTitle: 'EDUCACION', sizingInformation: sizingInformation),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('CV_BRYAN')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/marlon');
              },
              child: const Text('CV_MARLON')),
        ]),
      ),
    ));
  }
}
