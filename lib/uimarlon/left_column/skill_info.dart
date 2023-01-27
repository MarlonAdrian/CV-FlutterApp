import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../main.dart';

class SkillInfo extends StatelessWidget {
  const SkillInfo({
    Key? key,
    required this.sizingInformation,
  }) : super(key: key);

  final SizingInformation sizingInformation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Row(
              children: [
                Row(
                  children: [
                    Text(
                      'Skills'.toUpperCase(),
                      style: GoogleFonts.montserrat(
                          fontSize: 50,
                          color: sizingInformation.deviceScreenType ==
                                  DeviceScreenType.desktop
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
          ),
          // AQUI VA las habilidadews_ Skill progresa bar
          DetailSkill(
              skillName: 'COLABORATIVO',
              skillValue: 0.8,
              sizingInformation: sizingInformation),
          DetailSkill(
              skillName: 'COMUNICACION',
              skillValue: 0.5,
              sizingInformation: sizingInformation),
          DetailSkill(
              skillName: 'EMPATIA',
              skillValue: 0.2,
              sizingInformation: sizingInformation),
          DetailSkill(
              skillName: 'DETALLISTA',
              skillValue: 0.9,
              sizingInformation: sizingInformation),
        ],
      ),
    );
  }
}

class DetailSkill extends StatelessWidget {
  const DetailSkill({
    Key? key,
    required this.skillValue,
    required this.skillName,
    required this.sizingInformation,
  }) : super(key: key);

  final SizingInformation sizingInformation;
  final String skillName;
  final double skillValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Text(
            skillName.toUpperCase(),
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop
                    ? Colors.white
                    : primaryColor,
                fontWeight: FontWeight.w100),
          ),
          SizedBox(
            width: 50,
          ),
          Expanded(
            child: LinearPercentIndicator(
              percent: skillValue,
              backgroundColor: primaryColor,
              progressColor: Colors.white70,
            ),
          )
        ],
      ),
    );
  }
}
