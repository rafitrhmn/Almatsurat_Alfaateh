# ===========================
# FLUTTER CORE
# ===========================
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.**

# ===========================
# KOTLIN
# ===========================
-keep class kotlin.** { *; }
-keep class kotlin.Metadata { *; }
-dontwarn kotlin.**
-keepclassmembers class **$WhenMappings {
    <fields>;
}
-keepclassmembers class kotlin.Metadata {
    public <methods>;
}

# ===========================
# FLUTTER BLOC & EQUATABLE
# ===========================
-keep class com.example.** { *; }
-keepclassmembers class * extends java.lang.Enum {
    <fields>;
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# ===========================
# SHARED PREFERENCES
# ===========================
-keep class androidx.datastore.** { *; }
-dontwarn androidx.datastore.**

# ===========================
# GOOGLE PLAY CORE & SERVICES
# ===========================
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

# ===========================
# FLUTTER LOCAL NOTIFICATIONS
# (persiapan Tahap 3)
# ===========================
-keep class com.dexterous.** { *; }
-dontwarn com.dexterous.**

# ===========================
# ANNOTATIONS & SIGNATURES
# (wajib untuk reflection)
# ===========================
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes InnerClasses
-dontwarn sun.misc.**

# ===========================
# MODEL CLASS PROTECTION
# mencegah obfuscation field model
# ===========================
-keepclassmembers class com.apk_almatsurat.** {
    <fields>;
    <methods>;
}