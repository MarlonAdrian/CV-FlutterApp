import 'package:flutter/material.dart';
import 'package:flutter_application_1/uijuan/left_column/about_me.dart';
import 'package:flutter_application_1/ui/left_column/heigh20.dart';
import 'package:flutter_application_1/uijuan/left_column/personal_avatar.dart';

import 'package:flutter_application_1/uijuan/left_column/skill_info.dart';
import 'package:flutter_application_1/ui/prueba.dart';

import 'package:responsive_builder/responsive_builder.dart';

import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class LeftColumn extends StatelessWidget {
  final SizingInformation sizingInformation;

  LeftColumn(this.sizingInformation);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 * 1,
      color: primaryColor,
      child: Column(
        children: [
          PersonalAvatar(),
          Height20(),
          AboutMe(sizingInformation: sizingInformation),
          Height20(),
          SkillInfo(sizingInformation: sizingInformation),
        ],
      ),
    );
  }
}
