class ApiResponse<T> {
  int statusCode;
  T? data;
  String? error;

  ApiResponse({required this.statusCode, this.data, this.error});
}