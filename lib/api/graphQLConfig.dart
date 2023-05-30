import 'package:graphql/client.dart';
import 'package:qlcd/api/api_constants.dart';

class GraphConfig {
  Future<GraphQLClient> getClient() async {
    String token = await ApiConstants().getAccessToken();

    final _httpLink =
        HttpLink('https://api.dev.buildingtenant.masflex.vn/graphql');
    final _authLink = AuthLink(
      getToken: () async => 'Bearer $token',
    );
    Link _link = _authLink.concat(_httpLink);
    return GraphQLClient(link: _link, cache: GraphQLCache());
  }
}
