import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

/// Logger yang HANYA aktif saat debug mode.
/// Di production build, semua log otomatis dimatikan.
/// Gunakan ini sebagai pengganti print() di seluruh aplikasi.
class AppLogger {
  AppLogger._(); // mencegah instansiasi

  /// Log informasi umum
  static void info(String message, {String name = 'AlMatsurat'}) {
    if (kDebugMode) {
      developer.log(
        message,
        name: name,
        level: 0,
      );
    }
  }

  /// Log peringatan
  static void warning(String message, {String name = 'AlMatsurat'}) {
    if (kDebugMode) {
      developer.log(
        '⚠️ WARNING: $message',
        name: name,
        level: 900,
      );
    }
  }

  /// Log error beserta stack trace
  static void error(
    String message, {
    Object? exception,
    StackTrace? stackTrace,
    String name = 'AlMatsurat',
  }) {
    if (kDebugMode) {
      developer.log(
        '❌ ERROR: $message',
        name: name,
        level: 1000,
        error: exception,
        stackTrace: stackTrace,
      );
    }
  }

  /// Log event BLoC — pengganti print() di BlocObserver
  static void bloc(String message, {String name = 'BLoC'}) {
    if (kDebugMode) {
      developer.log(
        '🔷 $message',
        name: name,
        level: 0,
      );
    }
  }
}
