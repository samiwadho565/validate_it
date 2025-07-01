class FormValidators {
  /// Validates that the field is not empty
  static String? Function(String?) required([String field = 'This field']) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return '$field is required';
      }
      return null;
    };
  }

  /// Validates email format
  static String? Function(String?) email([String message = 'Invalid email']) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      return regex.hasMatch(value.trim()) ? null : message;
    };
  }

  /// Validates phone number format (basic international support)
  static String? Function(String?) phone([String message = 'Invalid phone number']) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      final regex = RegExp(r'^\+?[0-9]{7,15}$');
      return regex.hasMatch(value.trim()) ? null : message;
    };
  }

  /// Validates password with minimum length
  static String? Function(String?) password({int minLength = 6, String? message}) {
    return (value) {
      if (value == null || value.trim().length < minLength) {
        return message ?? 'Password must be at least $minLength characters';
      }
      return null;
    };
  }

  /// Validates minimum length
  static String? Function(String?) minLength(int min, [String? message]) {
    return (value) {
      if (value == null || value.length < min) {
        return message ?? 'Minimum $min characters required';
      }
      return null;
    };
  }

  /// Validates maximum length
  static String? Function(String?) maxLength(int max, [String? message]) {
    return (value) {
      if (value != null && value.length > max) {
        return message ?? 'Maximum $max characters allowed';
      }
      return null;
    };
  }

  /// Validates match with another field (like confirm password)
  static String? Function(String?) match(String otherValue, [String message = 'Values do not match']) {
    return (value) => value == otherValue ? null : message;
  }

  /// Allows only alphabets
  static String? Function(String?) onlyAlphabets([String message = 'Only alphabets allowed']) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      final regex = RegExp(r'^[a-zA-Z\s]+$');
      return regex.hasMatch(value.trim()) ? null : message;
    };
  }

  /// Allows only numbers
  static String? Function(String?) onlyNumbers([String message = 'Only numbers allowed']) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      final regex = RegExp(r'^[0-9]+$');
      return regex.hasMatch(value.trim()) ? null : message;
    };
  }

  /// Custom RegExp validator
  static String? Function(String?) pattern(RegExp regex, String message) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      return regex.hasMatch(value.trim()) ? null : message;
    };
  }

  /// Username validation: letters, numbers, underscores
  static String? Function(String?) username([String message = 'Invalid username']) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      final regex = RegExp(r'^[a-zA-Z0-9_]+$');
      return regex.hasMatch(value.trim()) ? null : message;
    };
  }

  /// Combine multiple validators
  static String? Function(String?) combine(List<String? Function(String?)> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}
