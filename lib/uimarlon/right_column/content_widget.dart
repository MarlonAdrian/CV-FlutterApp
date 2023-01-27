import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui/right_column/title_description.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({
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
            title: 'Asistente multifuncional en Restaurante y Eventos.',
            description: '',
            sizingInformation: sizingInformation),
        TitleDescriptionWidget(
            title: '“Sistema de Control y Documentación',
            description:
                'Aplicación web encargada en el manejo y control de contratos para la Empresa Pública de la Escuela Politécnica Nacional EPN-TECH EP (2022)',
            sizingInformation: sizingInformation),
      ],
    );
  }
}
