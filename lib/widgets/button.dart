import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? textcolor;
  final bool loading;

  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.textcolor,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height * 0.06,
        width: double.infinity,
        margin: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        decoration: BoxDecoration(
            color: Color.fromRGBO(143, 38, 130, 1),
            borderRadius: BorderRadiusDirectional.all(Radius.circular(10))),
        child: Center(
            child: loading
                ? Transform.scale(
                    scale: 0.75,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                : Text(
                    title.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 15),
                  )),
      ),
    );

    //   ElevatedButton(
    //
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    //   ),
    //   onPressed: onPressed,
    //   child: loading
    //       ? CircularProgressIndicator()
    //       : Text(
    //           title.toString(),
    //           style: TextStyle(color: textcolor),
    //         ),
    // );
    // ;
  }
}
