class FieldValidation {
  final String? _value;
  String? _errorMessage;
  String _fieldName = 'Field';

  FieldValidation(this._value);

  FieldValidation fieldName(String fieldName) {
    _fieldName = fieldName;
    return this;
  }

  FieldValidation isRequired({String? message}) {
    if (_value == null || (_value.trim().isEmpty)) {
      _errorMessage = '$_fieldName ${message ?? 'is required'}';
    }
    return this;
  }

  String? validate() {
    return _errorMessage;
  }
}
