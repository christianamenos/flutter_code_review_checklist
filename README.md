# code_review_checklist

With this APP, users will be able to have an actionable checklist to help them review code from their partners with most common checks as a default template.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Useful commands

```bash
# Check Flutter version
flutter -v

# Update flutter version
flutter upgrade

# Clean dependencies
flutter clean

# Install dependencies
flutter packages get

# Check how to upgrade outdated dependencies (in pubspec.yaml)
flutter pub outdated
```

## Troubleshooting

### Error 1: Problems with dependencies after updating flutter version

**Error message:**

```
Target of URI doesn't exist: 'package:flutter/material.dart'.
```

**Solution:**

Install dependencies and upgrade outdated dependencies in `pubspec.yaml`.

```
flutter clean

flutter packages get

flutter pub outdated
```

Finally, restart Android Studio.

### Error 2: Problems with some core functionalities or types

**Error message:**

```
Future isn't a type
```

**Solution:**

Update Flutter SDK in Android Studio preferences, pointing to the SDK folder.

### Error 3:

**Error message:**

```
You are applying Flutter's app_plugin_loader Gradle plugin imperatively using the apply script method, which is deprecated and will be removed in a future release. Migrate to applying Gradle plugins with the declarative plugins block: https://flutter.dev/go/flutter-gradle-plugin-apply
```

**Solution:**



