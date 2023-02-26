class ApiResponse {
  final int? statusCode;
  final String? statusMessage;
  final dynamic rawResponse;
  final dynamic data;

  ApiResponse({
    this.statusCode,
    this.statusMessage,
    this.data,
    this.rawResponse,
  });

  @override
  String toString() {
    return '$data';
  }
}
