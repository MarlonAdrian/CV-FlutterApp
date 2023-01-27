import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
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
                      'PERFIL'.toUpperCase(),
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
          // AQUI VA EL MENSAJITOOOOO
          Text(
            'Desarrollador de software, conocimientos en Laravel, SQL Injection, java, C++, Idiomas: Español (Nativo) e Inglés (C1).',
            textAlign:
                sizingInformation.deviceScreenType == DeviceScreenType.mobile
                    ? TextAlign.justify
                    : TextAlign.left,
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop
                    ? Colors.white
                    : primaryColor,
                fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }
}
