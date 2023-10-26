class ApiUrl {
  static const String baseUrl = 'https://responsi1a.dalhaqq.xyz/';

  static const String listData = baseUrl + '/ikan';
  static const String createData = baseUrl + '/ikan';

  static String updateData(int id) {
    return baseUrl + '/ikan/' + id.toString();
  }

  static String showData(int id) {
    return baseUrl + '/ikan/' + id.toString();
  }

  static String deleteData(int id) {
    return baseUrl + '/ikan/' + id.toString();
  }
}
