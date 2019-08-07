import '../model/index.dart';
import './graphql.dart';

class ViewerService {
  static Future<GraphqlModel> getViewerFeed({int page = 1, int size = 30}) {
    final gpl = """
      {
        viewer {
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
            }
          }
        }
      }
    """;

    return Graphql.fetch(gpl);
  }
}
