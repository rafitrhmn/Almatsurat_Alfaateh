import 'package:flutter/material.dart';

class Pagipage extends StatefulWidget {
  const Pagipage({super.key});

  @override
  State<Pagipage> createState() => _PagipageState();
}

class _PagipageState extends State<Pagipage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      width: screenWidth,
      height: screenHeight,
      color: Color(0xFFE48D58),
      child: Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.065),
              child: Image.asset('assets/icon/sun_ligthts.png'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.103),
              child: Text(
                '1/30',
                style: TextStyle(
                    fontFamily: 'Dongle', color: Colors.white, fontSize: 30),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.192),
              child: Container(
                width: screenWidth * 0.9, // Mengatur lebar kontainer teks
                child: const Text(
                  "Surah Al-Baqarah ayat 7",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Dongle',
                      color: Colors.white,
                      fontSize: 58.5,
                      fontWeight: FontWeight.bold,
                      height: 0.7),
                  softWrap: true, // Mengizinkan teks membungkus ke bawah
                  overflow: TextOverflow.visible, // Menghindari teks terpotong
                ),
              ),
            )
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.only(top: screenHeight * 0.16),
        //       child: Text("Doa Al-matsurat Pagi",
        //           style: TextStyle(
        //               fontFamily: 'Dongle',
        //               color: Colors.white,
        //               fontSize: 75,
        //               fontWeight: FontWeight.bold)),
        //     )
        //   ],
        // ),
        Positioned(
          left: screenWidth * 0.045,
          top: screenHeight * 0.065,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.home_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
        )
      ]),
    ));
  }
}

// Color(0xFF1F0B0D)
// 0xFFE48D58