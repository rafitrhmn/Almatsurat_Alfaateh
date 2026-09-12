import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/dzikir/dzikir_bloc.dart';
import '../../bloc/dzikir/dzikir_event.dart';
import '../../bloc/dzikir/dzikir_state.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class DzikirPagiPage extends StatefulWidget {
  const DzikirPagiPage({super.key});

  @override
  State<DzikirPagiPage> createState() => _DzikirPagiPageState();
}

class _DzikirPagiPageState extends State<DzikirPagiPage>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _resetScrollPosition() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: BlocBuilder<DzikirBloc, DzikirState>(
        builder: (context, state) {
          if (state is DzikirLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.pagiBackground),
            );
          }

          if (state is DzikirLoaded) {
            return _buildContent(context, state);
          }

          if (state is DzikirError) {
            return Center(
              child: Text(
                '${AppStrings.errorPrefix}${state.message}',
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.error,
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, DzikirLoaded state) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity == null) return;

        if (details.primaryVelocity! < 0) {
          // Geser kiri = item berikutnya
          context.read<DzikirBloc>().add(const NextDzikir());
          _resetScrollPosition();
        } else if (details.primaryVelocity! > 0) {
          // Geser kanan = item sebelumnya
          context.read<DzikirBloc>().add(const PrevDzikir());
          _resetScrollPosition();
        }
      },
      child: Container(
        color: AppColors.pagiBackground,
        width: double.infinity, // ← tambahkan ini
        height: double.infinity, // ← tambahkan ini
        child: Stack(
          fit: StackFit.expand,
          children: [
            // =====================
            // IKON MATAHARI
            // =====================
            Positioned(
              top: 55,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icon/sun_2.png',
                    width: 65,
                    height: 34,
                  ),
                ],
              ),
            ),

            // =====================
            // INDIKATOR HALAMAN
            // =====================
            Positioned(
              top: 90,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.currentIndex + 1} / ${state.totalItem}',
                    style: const TextStyle(
                      fontFamily: 'Dongle',
                      color: AppColors.textWhite,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),

            // =====================
            // KONTEN UTAMA
            // =====================
            Column(
              children: [
                // Nama Surah
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Text(
                    state.currentDzikir.surah,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Dongle',
                      color: AppColors.textWhite,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      height: 0.82,
                    ),
                  ),
                ),

                const SizedBox(height: 7),

                // Keterangan dibaca
                Text(
                  '${AppStrings.dibacaPrefix}${state.currentDzikir.dibaca}${AppStrings.dibacaSuffix}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Dongle',
                    color: AppColors.textWhite,
                    fontSize: 40.5,
                    fontWeight: FontWeight.bold,
                    height: 0.82,
                  ),
                ),

                const SizedBox(height: 15),

                // Teks Arab + Arti (scrollable)
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        // Teks Arab
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Text(
                            state.currentDzikir.dzikir,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontFamily: 'lpmq',
                              color: AppColors.textWhite,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              height: 2.32,
                            ),
                          ),
                        ),

                        const SizedBox(height: 5),

                        // Teks Arti
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Text(
                            state.currentDzikir.arti,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Dongle',
                              color: AppColors.textWhite,
                              fontSize: 33,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // =====================
            // TOMBOL KEMBALI
            // =====================
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
  }
}
