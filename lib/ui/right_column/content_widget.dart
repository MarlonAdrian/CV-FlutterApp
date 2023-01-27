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
            title: 'Proyecto de un sistema de Bibliotecas',
            description: 'https://replit.com/@BryanTnz/EjercicioMB#main.c',
            sizingInformation: sizingInformation),
        TitleDescriptionWidget(
            title:
                'Proyecto de instalación de sistemas operativos usando VirtualBox y Esxi.',
            description:
                'https://drive.google.com/file/d/1nKjNN1-eiUu2HM9dLAsppkFeAsM7HfEz/view?usp=share_link',
            sizingInformation: sizingInformation),
        TitleDescriptionWidget(
            title: 'Proyecto Ionic y Firebase (Auth, Database, Storage)',
            description:
                'https://github.com/BryanTnz/Ionic_Firebase-Auth_Database_Storage',
            sizingInformation: sizingInformation),
        TitleDescriptionWidget(
            title: 'Recolección de datos (MongoDB, CouchDB, MySql)',
            description: 'https://www.youtube.com/watch?v=lhOvGPKmk2k',
            sizingInformation: sizingInformation),
      ],
    );
  }
}
