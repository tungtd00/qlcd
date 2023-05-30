import 'package:oauth2/oauth2.dart' as oauth2;

class ApiConstants {
  String username = "tientung";
  String password = "admin";
  static Uri authorizationEndpoint = Uri.parse(
      'https://auth.dev.buildingtenant.masflex.vn/identity/connect/token');
  static const String clientId = "bhs.account.client";
  static const String clientSecret = "g2RAXgZenebyybWmmfyDWprGhxe5CLAJ";
  static const String scope = "api openid profile offline_access";
  static const String baseURL =
      "https://api.dev.buildingtenant.masflex.vn/graphql";
  static const String uploadURL =
      'https://api.dev.buildingtenant.masflex.vn/headless/stream/upload';
  static const String host = 'dev.buildingtenant.masflex.vn';

  Future<String> getAccessToken() async {
    final cli = await oauth2.resourceOwnerPasswordGrant(
      authorizationEndpoint,
      username,
      password,
      identifier: clientId,
      secret: clientSecret,
      scopes: [scope],
    );
    return cli.credentials.accessToken;
  }
}
