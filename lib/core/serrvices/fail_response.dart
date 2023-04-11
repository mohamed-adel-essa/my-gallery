class FailResponse {
  String? message;
  Errors? errors;

  FailResponse({this.message, this.errors});

  FailResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
}

class Errors {
  List? erros;

  Errors({this.erros});

  Errors.fromJson(Map<String, dynamic> json) {
    erros = [];
    for (var element in json.entries) {
      erros?.add(element.value);
    }
  }
}
