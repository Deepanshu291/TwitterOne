import 'package:flutter/material.dart';

import '../utils/pallate.dart';

class roundsmallbtn extends StatelessWidget {
  const roundsmallbtn({
    super.key,
    this.backgroundColor = Pallete.whiteColor,
    this.textcolor = Pallete.backgroundColor,
    required this.label,
    required this.ontap,
    required this.icon 
  });

  final VoidCallback ontap;
  final String label;
  final Color textcolor;
  final Color backgroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Chip(
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textcolor),
            SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: TextStyle(
                color: textcolor,
                fontSize: 16,
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        labelPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      ),
    );
  }
}
