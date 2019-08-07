import 'package:rxdart/rxdart.dart';
import './base.dart';
import 'package:articlest/model/index.dart';
import 'package:articlest/db/index.dart';
import 'package:articlest/services/viewer.dart';

class ViewerBloc extends BaseBloc {
  Subject<FeedsModel> _subject$ = BehaviorSubject<FeedsModel>();
  Subject<FeedsModel> get stream => _subject$.stream;
  Function(FeedsModel) get add => _subject$.sink.add;

  ViewerBloc() {
    getFeedsFromDB();
    getFeedList(1);
  }

  ///
  /// Singleton factory
  ///
  // static final ViewerBloc _bloc = ViewerBloc._internal();
  // factory ViewerBloc() {
  //   return _bloc;
  // }
  // ViewerBloc._internal(); // 命名构造函数

  void dispose() {
    _subject$?.close();
  }

  void getFeedsFromDB() {
    subscribeFeedTable.queryAll().then((res) {
      var nodes = res.map((feedJson) => FeedModel.fromJson(feedJson)).toList();
      var feeds = FeedsModel(totalCount: null, nodes: nodes);
      _subject$.add(feeds);
    });
  }

  /// 存到数据啦
  void saveFeedsToDB(List<FeedModel> feeds) {
    var jsonArray = feeds.map((feed) => feed.toJson());
    subscribeFeedTable.batchInsert(jsonArray);
  }

  /// 从服务起获取订阅的 feed 列表
  void getFeedList([int page = 1]) {
    ViewerService.getViewerFeed(page: page, size: 30).then((res) async {
      var feeds = res?.data?.viewer?.feeds;
      _subject$.add(feeds);
      if (page == 1) {
        await subscribeFeedTable.deleteAll();
        saveFeedsToDB(feeds.nodes);
      }
    });
  }
}

// 全剧单例
ViewerBloc viewbloc = ViewerBloc();
