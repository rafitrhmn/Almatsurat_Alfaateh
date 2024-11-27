import 'package:flutter/material.dart';

class DzikirPagiPage extends StatefulWidget {
  const DzikirPagiPage({super.key});

  @override
  State<DzikirPagiPage> createState() => _DzikirPagiPageState();
}

class _DzikirPagiPageState extends State<DzikirPagiPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
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
                        fontFamily: 'Dongle',
                        color: Colors.white,
                        fontSize: 30),
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
                      overflow:
                          TextOverflow.visible, // Menghindari teks terpotong
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.33),
                  child: Container(
                    width: screenWidth * 0.93, // Mengatur lebar kontainer teks
                    child: const Text(
                      "يَا رَبِّي لَكَ الْحَمْدُ كَمَا يَنْبَغِي لِجَلَالِ وَجْهِكَ وَلِعَظِيمِ سُلْطَانِكَ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // fontFamily: 'Amiri',
                          fontFamily: 'lpmq',
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          height: 2.32),
                      softWrap: true, // Mengizinkan teks membungkus ke bawah
                      overflow:
                          TextOverflow.visible, // Menghindari teks terpotong
                    ),
                  ),
                )
              ],
            ),
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
        ),
      ),
    );
  }
}

// import 'package:apk_almatsurat/bloc/dzikir_bloc.dart';
// import 'package:apk_almatsurat/bloc/dzikir_event.dart';
// import 'package:apk_almatsurat/bloc/dzikir_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DzikirSwipeScreen extends StatefulWidget {
//   @override
//   _DzikirSwipeScreenState createState() => _DzikirSwipeScreenState();
// }

// class _DzikirSwipeScreenState extends State<DzikirSwipeScreen> {
//   int currentIndex = 0; // Menyimpan indeks data saat ini

//   void _onSwipeRight(BuildContext context, int maxIndex) {
//     // Geser ke kanan (data berikutnya)
//     setState(() {
//       currentIndex = (currentIndex + 1) % maxIndex;
//     });
//   }

//   void _onSwipeLeft(BuildContext context, int maxIndex) {
//     // Geser ke kiri (data sebelumnya)
//     setState(() {
//       currentIndex = (currentIndex - 1 + maxIndex) % maxIndex;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => DzikirBloc()..add(FetchDzikirPagiEvent()),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Dzikir Pagi'),
//         ),
//         body: BlocBuilder<DzikirBloc, DzikirState>(
//           builder: (context, state) {
//             if (state is DzikirLoadingState) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is DzikirLoadedState) {
//               final dzikirData = state.dzikirData;
//               final maxIndex = dzikirData.length;

//               return GestureDetector(
//                 onHorizontalDragEnd: (details) {
//                   if (details.primaryVelocity != null) {
//                     if (details.primaryVelocity! < 0) {
//                       // Geser ke kanan
//                       _onSwipeRight(context, maxIndex);
//                     } else if (details.primaryVelocity! > 0) {
//                       // Geser ke kiri
//                       _onSwipeLeft(context, maxIndex);
//                     }
//                   }
//                 },
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           dzikirData[currentIndex]['surah'],
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           'Ayat: ${dzikirData[currentIndex]['ayat']}',
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(fontSize: 18),
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           dzikirData[currentIndex]['arti'],
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(height: 30),
//                         Text(
//                           '${currentIndex + 1} / $maxIndex',
//                           style: const TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             } else if (state is DzikirErrorState) {
//               return Center(child: Text('Error: ${state.error}'));
//             }
//             return const SizedBox();
//           },
//         ),
//       ),
//     );
//   }
// }
