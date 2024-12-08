import 'package:apk_almatsurat/bloc/dzikir_bloc.dart';
import 'package:apk_almatsurat/bloc/dzikir_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DzikirPetangPage extends StatefulWidget {
  const DzikirPetangPage({super.key});

  @override
  State<DzikirPetangPage> createState() => _DzikirPetangPageState();
}

class _DzikirPetangPageState extends State<DzikirPetangPage>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = 0; // Menyimpan indeks data saat ini
  final ScrollController _scrollController =
      ScrollController(); // Controller untuk scroll

  @override
  bool get wantKeepAlive => true;

  void _onSwipeRight(int maxIndex) {
    setState(() {
      currentIndex = (currentIndex + 1) % maxIndex; // Pindah ke data berikutnya
    });
    _resetScrollPosition(); // Reset posisi scroll ke atas
  }

  void _onSwipeLeft(int maxIndex) {
    setState(() {
      currentIndex =
          (currentIndex - 1 + maxIndex) % maxIndex; // Pindah ke data sebelumnya
    });
    _resetScrollPosition(); // Reset posisi scroll ke atas
  }

  void _resetScrollPosition() {
    // Kembalikan scroll ke posisi atas
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Untuk menjaga state tetap hidup

    return Scaffold(
      body: BlocBuilder<DzikirBloc, DzikirState>(
        builder: (context, state) {
          if (state is DzikirLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DzikirLoadedState) {
            final dzikirData = state.dzikirData;
            final maxIndex = dzikirData.length;

            return GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity != null) {
                  if (details.primaryVelocity! < 0) {
                    _onSwipeRight(maxIndex); // Geser ke kanan
                  } else if (details.primaryVelocity! > 0) {
                    _onSwipeLeft(maxIndex); // Geser ke kiri
                  }
                }
              },
              // Nonaktifkan gesture vertikal
              onVerticalDragUpdate: (_) {},

              child: Container(
                color: const Color(0xFFDE6378),
                child: Stack(
                  children: [
                    // Ikon Matahari
                    Positioned(
                      top: 55,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/sun3.png',
                            width: 65,
                            height: 34,
                          ),
                        ],
                      ),
                    ),

                    // Indikator Halaman
                    Positioned(
                      top: 90,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${currentIndex + 1} / $maxIndex',
                            style: const TextStyle(
                              fontFamily: 'Dongle',
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Konten Surah
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 150),
                            child: Text(
                              dzikirData[currentIndex]['surah'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Dongle',
                                color: Colors.white,
                                fontSize: 58.5,
                                fontWeight: FontWeight.bold,
                                height: 0.82,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // Dzikir (dapat di-scroll)
                          Expanded(
                            child: SingleChildScrollView(
                              controller:
                                  _scrollController, // Tambahkan controller
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13),
                                    child: Text(
                                      dzikirData[currentIndex]['dzikir'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontFamily: 'lpmq',
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        height: 2.32,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13),
                                    child: Text(
                                      dzikirData[currentIndex]['arti'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 33,
                                        fontFamily: 'Dongle',
                                        fontWeight: FontWeight.w400,
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Tombol Kembali
                    Positioned(
                      left: 13,
                      top: 60,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          'assets/icon/home_2.png',
                          width: 34,
                          height: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is DzikirErrorState) {
            return Center(
              child: Text(
                'Error: ${state.error}',
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
            );
          }
          return const SizedBox();
        },
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

// return Container(
//   color: Color(0xFFE48D58),
//   child: Stack(children: [
//     Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(top: 15),
//           child: Image.asset('assets/icon/sun_ligthts.png'),
//         ),
//       ],
//     ),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(top: 15),
//           child: Text(
//             '1/30',
//             style: TextStyle(
//                 fontFamily: 'Dongle',
//                 color: Colors.white,
//                 fontSize: 30),
//           ),
//         )
//       ],
//     ),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(top: 10),
//           child: Container(
//             // width: screenWidth * 0.9, // Mengatur lebar kontainer teks
//             child: const Text(
//               "Surah Al-Baqarah ayat 7",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontFamily: 'Dongle',
//                   color: Colors.white,
//                   fontSize: 58.5,
//                   fontWeight: FontWeight.bold,
//                   height: 0.7),
//               softWrap: true, // Mengizinkan teks membungkus ke bawah
//               overflow:
//                   TextOverflow.visible, // Menghindari teks terpotong
//             ),
//           ),
//         )
//       ],
//     ),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(top: 10),
//           child: Container(
//             // width: screenWidth * 0.93, // Mengatur lebar kontainer teks
//             child: const Text(
//               "يَا رَبِّي لَكَ الْحَمْدُ كَمَا يَنْبَغِي لِجَلَالِ وَجْهِكَ وَلِعَظِيمِ سُلْطَانِكَ",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   // fontFamily: 'Amiri',
//                   fontFamily: 'lpmq',
//                   color: Colors.white,
//                   fontSize: 30,
//                   fontWeight: FontWeight.w500,
//                   height: 2.32),
//               softWrap: true, // Mengizinkan teks membungkus ke bawah
//               overflow:
//                   TextOverflow.visible, // Menghindari teks terpotong
//             ),
//           ),
//         )
//       ],
//     ),
//     Positioned(
//       left: 10,
//       top: 10,
//       child: GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: const Icon(
//           Icons.home_rounded,
//           color: Colors.white,
//           size: 40,
//         ),
//       ),
//     )
//   ]),
// );

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: BlocBuilder<DzikirBloc, DzikirState>(
//       builder: (context, state) {
//         if (state is DzikirLoadingState) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is DzikirLoadedState) {
//           final dzikirData = state.dzikirData;
//           final maxIndex = dzikirData.length;

//           return GestureDetector(
//             onHorizontalDragEnd: (details) {
//               if (details.primaryVelocity != null) {
//                 if (details.primaryVelocity! < 0) {
//                   _onSwipeRight(maxIndex); // Geser ke kanan
//                 } else if (details.primaryVelocity! > 0) {
//                   _onSwipeLeft(maxIndex); // Geser ke kiri
//                 }
//               }
//             },
//             child: Stack(
//               children: [
//                 // Bagian konten yang dapat di-scroll
//                 SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         top: 150), // Geser konten ke bawah
//                     child: Column(
//                       children: [
//                         // Nama Surah
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: Text(
//                             dzikirData[currentIndex]['surah'],
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               fontFamily: 'Dongle',
//                               color: Colors.white,
//                               fontSize: 58.5,
//                               fontWeight: FontWeight.bold,
//                               height: 0.82,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),

//                         // Dzikir
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: Text(
//                             dzikirData[currentIndex]['dzikir'],
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               fontFamily: 'lpmq',
//                               color: Colors.white,
//                               fontSize: 30,
//                               fontWeight: FontWeight.w500,
//                               height: 2.32,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                 ),

//                 // Ikon Matahari
//                 Positioned(
//                   top: 55,
//                   left: 0,
//                   right: 0,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'assets/icon/sun_2.png',
//                         width: 65,
//                         height: 34,
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Indikator Halaman
//                 Positioned(
//                   top: 90,
//                   left: 0,
//                   right: 0,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         '${currentIndex + 1} / $maxIndex',
//                         style: const TextStyle(
//                           fontFamily: 'Dongle',
//                           color: Colors.white,
//                           fontSize: 30,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Tombol Kembali
//                 Positioned(
//                   left: 13,
//                   top: 60,
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Image.asset(
//                       'assets/icon/home_2.png',
//                       width: 34,
//                       height: 32,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else if (state is DzikirErrorState) {
//           return Center(
//             child: Text(
//               'Error: ${state.error}',
//               style: const TextStyle(fontSize: 16, color: Colors.red),
//             ),
//           );
//         }
//         return const SizedBox();
//       },
//     ),
//   );
// }
