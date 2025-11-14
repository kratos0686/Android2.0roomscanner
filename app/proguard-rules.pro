# Add any rules here by following the syntax below:
# -keep class com.example.MyClass { *; }

# Keep Room entities
-keep class com.roomscanner.app.data.** { *; }

# Keep Firebase models
-keepclassmembers class com.roomscanner.app.data.** {
    *;
}

# Keep ML Kit classes
-keep class com.google.mlkit.** { *; }
-keep class com.google.android.gms.** { *; }

# Keep ARCore classes  
-keep class com.google.ar.core.** { *; }

# RxJava
-dontwarn io.reactivex.rxjava3.**
-keep class io.reactivex.rxjava3.** { *; }

# Gson
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
