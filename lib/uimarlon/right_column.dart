import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui/left_column/about_me.dart';
import 'package:flutter_application_1/ui/left_column/personal_avatar.dart';
import 'package:flutter_application_1/ui/left_column/skill_info.dart';
import 'package:flutter_application_1/uimarlon/right_column/content_experience.dart';
import 'package:flutter_application_1/uimarlon/right_column/content_widget.dart';
import 'package:flutter_application_1/uimarlon/right_column/nameWitget.dart';
import 'package:flutter_application_1/uimarlon/right_column/personalInfo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';


import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'mobile.dart' if (dart.library.html) 'web.dart';
import 'package:flutter_application_1/marlon.dart';

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
              contentTitle: 'EXPERIENCIAS',
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
                Navigator.pushNamed(context, '/');
              },
              child: const Text('CV_BRYAN')),
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

    page.graphics.drawString('\t\t\tMARLON TUQUERRES\n\n\n',PdfStandardFont(PdfFontFamily.helvetica, 30));
     
    page.graphics.drawImage(
      PdfBitmap(await _readImageData('assets/images/marlon.png')),
      Rect.fromLTWH(150, 100, 220, 220));

    page.graphics.drawString('\n\nEcuador - Quito \nTeléfono: 0992310253\nmarlon.tuquerres@epn.edu.ec',PdfStandardFont(PdfFontFamily.timesRoman, 15));

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
    row.cells[0].value='Desarrollador de software';
    row.cells[1].value='Unidad Educativa Maria Angélica Idrobo';
    row.cells[2].value='Aplicación web Encargada en el manejo y control de contratos para la EPN-TECH';

    /*second value*/
    row= grid.rows.add();
    row.cells[0].value='Conocimientos en Laravel';
    row.cells[1].value='Escuela Politécnica Nacional';
    row.cells[2].value='Asistente polifuncional en restaurantes y Eventos';    

    /*third value*/
    row= grid.rows.add();
    row.cells[0].value='Idiomas: Español(Nativo) e Inglés(C1)';
    row.cells[1].value='Centro de Educación Continua';  
    row.cells[2].value='Charla de Mentoria con el Ministerio de Educación';  


    grid.draw(
      page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0,0)
    );


    List<int> bytes=document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'CV-TuquerresMarlon.pdf');
    
  }
}

Future<Uint8List> _readImageData(String name)async{
  final data=await rootBundle.load('assets/images/marlon.png');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
