abstract class CustomException implements Exception {
  final String? _message;
  final String title;
  CustomException(this.title, this._message);
  @override
  String toString() => "Exception : $title : $message";
  String get message => _message ?? "---No message provided---";
}
