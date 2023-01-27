import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/juan.dart';
import 'package:flutter_application_1/uimarlon/left_column.dart';
import 'package:flutter_application_1/uimarlon/left_column/about_me.dart';
import 'package:flutter_application_1/uimarlon/left_column/heigh20.dart';
import 'package:flutter_application_1/uimarlon/left_column/personal_avatar.dart';
import 'package:flutter_application_1/uimarlon/left_column/skill_info.dart';
import 'package:flutter_application_1/ui/prueba.dart';
import 'package:flutter_application_1/uimarlon/right_column.dart';
import 'package:flutter_application_1/uimarlon/right_column/content_experience.dart';
import 'package:flutter_application_1/uimarlon/right_column/content_widget.dart';
import 'package:flutter_application_1/uimarlon/right_column/nameWitget.dart';
import 'package:flutter_application_1/uimarlon/right_column/personalInfo.dart';
import 'package:responsive_builder/responsive_builder.dart';

final primaryColor = Colors.black;
final backgroundColor = Color(0xFFEDF1F4);

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Marlon(),
        '/prueba': (context) => prueba(),
        '/juan': (context) => Juan(),
      },
    );
  }
}

class Marlon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SingleChildScrollView(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? DesktopUI(
                  sizingInformation: sizingInformation,
                )
              : MobileUI(sizingInformation: sizingInformation);
        },
      ),
    )));
  }
}

class MobileUI extends StatelessWidget {
  const MobileUI({
    Key? key,
    required this.sizingInformation,
  }) : super(key: key);

  final SizingInformation sizingInformation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Izuierdo
        PersonalAvatar(),
        Height20(),
        AboutMe(sizingInformation: sizingInformation),
        Height20(),
        SkillInfo(
          sizingInformation: sizingInformation,
        ),

        // Drecho
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NameWidget(sizingInformation),
                PersonalInfo(),
              ],
            ),
            ContentWidget(
                contentTitle: 'EXPERIENCIA',
                sizingInformation: sizingInformation),
            ContentExperience(
                contentTitle: 'FORMACIÓN ACADEMICA',
                sizingInformation: sizingInformation)
          ],
        ),
      ],
    );
  }
}

class DesktopUI extends StatelessWidget {
  const DesktopUI({
    Key? key,
    required this.sizingInformation,
  }) : super(key: key);

  final SizingInformation sizingInformation;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        color: backgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeftColumn(sizingInformation),
            RightColumn(sizingInformation),
          ],
        ),
      ),
    );
  }
}
