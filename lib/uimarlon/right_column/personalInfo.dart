import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Infor nose ine
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Ecuador - Quito',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w200,
                  fontSize: 30,
                  color: primaryColor),
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Telefono: 0992310253',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w200,
                  fontSize: 30,
                  color: primaryColor),
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'marlontuquerres70@gmail.com',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w200,
                  fontSize: 30,
                  color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
