import 'package:apk_almatsurat/screen/pagi_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenWidth2 = screenWidth / 2;
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Pagipage()),
              );
            },
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/gambar_pagi.png',
                  width: screenWidth,
                  height: screenHeight * 0.5,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: screenHeight * 0.08,
                  left: screenWidth * 0.25,
                  child: Text(
                    'Dzikir Sugro',
                    style: TextStyle(
                        fontFamily: 'Dongle',
                        color: Color(0xFF1F0B0D),
                        fontSize: 63,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.102,
                  left: screenWidth * 0.3,
                  child: Text(
                    'Pagi',
                    style: TextStyle(
                        fontFamily: 'Dongle',
                        color: Color(0xFF1F0B0D),
                        fontSize: 133,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/gambar_petang.png',
                  width: screenWidth,
                  height: screenHeight * 0.5,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: screenHeight * 0.051,
                  left: screenWidth * 0.25,
                  child: Text(
                    'Dzikir Sugro',
                    style: TextStyle(
                        fontFamily: 'Dongle',
                        color: Color(0xFF401C48),
                        fontSize: 63,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.07,
                  left: screenWidth * 0.18,
                  child: Text(
                    'Petang',
                    style: TextStyle(
                        fontFamily: 'Dongle',
                        color: Color(0xFF401C48),
                        fontSize: 133,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
