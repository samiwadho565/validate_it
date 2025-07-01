# validate_it

A lightweight, fast and ready-to-use form validation package for Flutter. Includes commonly used validators with customizable messages.

## ✅ Features

- Required field
- Email
- Phone number
- Password
- Min/Max length
- Match other field
- Only alphabets / numbers
- Custom regex
- Combine multiple validators

## 🚀 Usage

```dart
import 'package:validate_it/validate_it.dart';

TextFormField(
  validator: FormValidators.required('Email'),
)

TextFormField(
  validator: FormValidators.combine([
    FormValidators.required('Password'),
    FormValidators.password(minLength: 8),
  ]),
)
