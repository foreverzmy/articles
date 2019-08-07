import 'dart:async';
import '../model/index.dart';
import './graphql.dart';

class ItemService {
  static Future<GraphqlModel> getItemList(int id,
      {int page = 1, int size = 10}) async {
    final gpl = """
      {
        feed(id: $id) {
          name
          items(page: $page, size: $size) {
            totalCount
            nodes {
              id
              title
              link
              content
              updated
              pubtime
              author
            }
          }
        }
      }
      """;

    return await Graphql.fetch(gpl);
  }

  static Future<GraphqlModel> getItemDetail(int id) async {
    final gpl = '''
    {
      item(id: $id){
        title
        description
        content
        author
        read
        guid
        link
        pubtime
        updated
      }
    }
    ''';

    return await Graphql.fetch(gpl);
  }
}
