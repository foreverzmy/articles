import 'package:articlest/model/index.dart';
import './graphql.dart';

class SubscrubeService {
  Future<GraphqlModel> subscribeFeed(int id) async {
    final gpl = """
      mutation {
        subscribeFeed(feedId: $id)
      }
      """;

    return await Graphql.fetch(gpl);
  }

  Future<GraphqlModel> unsubscribeFeed(int id) async {
    final gpl = """
      mutation {
        unsubscribeFeed(feedId: $id)
      }
      """;

    return await Graphql.fetch(gpl);
  }
}

final subscrubeService = SubscrubeService();
