class EndPoints {
  static const String baseUrl = 'https://mnsh-tech.preview-domain.com/wp-json/';
  static const String user = '${baseUrl}user';
  static const String login = '${baseUrl}jwt-auth/v1/token';
  static const String register = '${baseUrl}auth/register';
  static const String role = '${baseUrl}role';
  static const String hotel = '${baseUrl}hotel';
  static const String hotelSearch = '${baseUrl}hotel/search/';
  static const String favorite = '$user/fav/';
  static const String nearMe = '$user/near-hotels/';
  static const String recommended = '$user/recommended-hotels/';
}
