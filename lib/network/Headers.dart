class Headers {
  String _token = "";

  Headers({String? token}) {
    if (token != null) {
      this._token = token;
    }
  }

  String get token => _token;
  set token(String token) => _token = token;

  Headers.fromJson(Map<String, dynamic> json) {
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this._token;
    return data;
  }
}
