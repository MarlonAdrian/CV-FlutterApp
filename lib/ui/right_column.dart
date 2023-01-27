

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui/right_column/content_experience.dart';
import 'package:flutter_application_1/ui/right_column/content_widget.dart';
import 'package:flutter_application_1/ui/right_column/nameWitget.dart';
import 'package:flutter_application_1/ui/right_column/personalInfo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';


import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'mobile.dart' if (dart.library.html) 'web.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

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
                Navigator.pushNamed(context, '/juan');
              },
              child: const Text('CV_IVAN')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/marlon');
              },
              child: const Text('CV_MARLON')),
          ElevatedButton(
            child: Text('GUARDAR_PDFS'),
            onPressed: _createPdf,),
          
        ]),
      ),
    ));
  }

  Future<void> _createPdf() async{
    PdfDocument document=PdfDocument();
    final page=document.pages.add();

    page.graphics.drawString('\t\t\tBRYAN TANDAZO\n\n\n',PdfStandardFont(PdfFontFamily.helvetica, 30));

    page.graphics.drawImage(
      PdfBitmap(await _readImageData('assets/images/avatar.jpg')),
      Rect.fromLTWH(150, 100, 220, 220));


    page.graphics.drawString('\n\nEcuador - Quito \nTeléfono: 0967771185\nbryan.tandazo@epn.edu.ec',PdfStandardFont(PdfFontFamily.timesRoman, 15));

    PdfGrid grid=PdfGrid();
    grid.style =PdfGridStyle(
      font: PdfStandardFont(PdfFontFamily.timesRoman, 30),
      cellPadding: PdfPaddings(left: 5,right: 3, top: 3, bottom: 3),
    );

    grid.columns.add(count: 3);
    grid.headers.add(1);


    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'PERFIL';
    header.cells[1].value = 'EDUCACIÓN';
    header.cells[2].value = 'EXPERIENCIA';    

    PdfGridRow row= grid.rows.add();
    /*firt value*/
    row.cells[0].value='Soy un estudiante universitario con una gran pasión por todas las cosas relacionadas con el desarrollo desoftware.';
    row.cells[1].value='Unidad Educativa Bicentenario';
    row.cells[2].value='Proyecto de un sistema de bibliotecas';

    /*second value*/
    row= grid.rows.add();
    row.cells[0].value='Me gusta aprender sobre las nuevas tecnologías como el Internet de las cosas (IOT) usando Arduino en conjunto de thingsboard para mostrar los datos obtenidos, Virtualización de sistemas operativos como Ubuntu y Windows utilizando Virtual Box, lenguajes de programación como C,C++, JAVA, PHP y el Framework Laravel. ';
    row.cells[1].value='Escuela Politécnica Nacional';
    row.cells[2].value='Proyecto de instalación de sistemas operativos usando VirtualBox';    

    /*third value*/
    row= grid.rows.add();
    row.cells[0].value='';
    row.cells[1].value='Centro de Educación Continua-Inglés';  
    row.cells[2].value='Recolección de datos (MongoDb, CouchDB, MYSQL)';  


    grid.draw(
      page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0,0)
    );


    List<int> bytes=document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'CV-TandazoBryan.pdf');
    
  }
}

Future<Uint8List> _readImageData(String name)async{
  final data=await rootBundle.load('assets/images/avatar.jpg');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}