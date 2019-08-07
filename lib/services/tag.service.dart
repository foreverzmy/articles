import '../model/index.dart';
import './graphql.dart';

class TagService {
  // 分页查询 tag list
  static Future<GraphqlModel> getTagList({int page = 1, int size = 30}) {
    final gpl = """
      {
        tags(page: $page, size: $size) {
          totalCount
          nodes {
            id
            name
            created
          }
        }
      }
    """;

    return Graphql.fetch(gpl);
  }

  // 查询 tag 下的 feed
  static Future<GraphqlModel> getTagFeedList(int id,
      {int page = 1, int size = 10}) {
    final gpl = """
      {
        tag(id: $id) {
          name
          feeds(page: $page, size: $size) {
            totalCount
            nodes {
              id
              name
              title
              link
              feedLink
              image
              updated
              published
              author
              isSubscribe
            }
          }
        }
      }
    """;

    return Graphql.fetch(gpl);
  }
}
