class EndPoints {
  static const String baseUrl = 'https://mnsh.tech/wp-json/';
  static const String auth = '${baseUrl}jwt-auth/v1/token';
  static const String user = '${baseUrl}auth/v1/get-user';
  static const String login = '${baseUrl}auth/v1/login';
  static const String register = '${baseUrl}auth/v1/register';
  static const String role = '${baseUrl}role';
  static const String hotel = '${baseUrl}auth/v1/hotel';
  static const String hotelSearch = '${baseUrl}hotel/search/';
  static const String favorite = '$user/fav';
  static const String nearMe = '$user/near-hotels/';
  static const String recommended = '$user/recommended-hotels/';
}
