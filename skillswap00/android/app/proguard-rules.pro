# Flutter ProGuard / R8 rules for shrinking and optimizing release builds
# Retains necessary Flutter engine and plugin bindings while shrinking bytecode

# Flutter Engine
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Prevent stripping of annotations and reflection metadata
-keepattributes *Annotation*,EnclosingMethod,Signature,InnerClasses
-dontwarn io.flutter.embedding.**

# Kotlin Coroutines and Reflection support
-dontwarn kotlin.**
-dontwarn kotlinx.**
