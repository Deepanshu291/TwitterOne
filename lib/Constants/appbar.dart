import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fwitter/Constants/assets_contants.dart';
import 'package:fwitter/utils/theme.dart';

class Uiconst {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsConstants.twitterLogo, 
      color: Pallete.blueColor,
      height: 35,
      ),
      centerTitle: true,
    );
  }
}
