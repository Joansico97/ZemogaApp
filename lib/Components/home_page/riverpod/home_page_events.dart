part of './home_page_state.dart';

class _HomePageEvents extends StateNotifier<HomePageModelState> {
  _HomePageEvents(this.ref) : super(HomePageModelState.fromJson({}));

  final Ref ref;
  final _logger = Logger();

  Future<void> getAllPosts() async {
    state.isDeleted = false;
    state = HomePageModelState.fromJson(state.toJson());
    try {
      final response = await dioService.getData(url: '${Constants.baseUrl}${Constants.postsUrl}');
      state.postList = List<PostModel>.from(response.map((json) => PostModel.fromJson(json)));
      state = HomePageModelState.fromJson(state.toJson());
    } catch (e) {
      _logger.e('An error has occurred while bringing the information');
      rethrow;
    }
  }

  void goToPostDetail(BuildContext context, PostModel postInfo) {
    _logger.d('Go to detail of post ${postInfo.id}');
    _logger.w(postInfo.toJson());
    ref.read(detailPageState).postInfo = postInfo;
    ref.read(detailPageState).commentsPostList = [];
    context.push('/detailPost/${postInfo.id}');
  }

  void makePostFavorite({required int position, bool? isOnDetails = false}) {
    final List<PostModel> favoritePost = [];
    final List<PostModel> unfavoritePost = [];

    state.postList![position].isFav = !state.postList![position].isFav!;

    favoritePost.addAll(state.postList!.where((post) => post.isFav! == true));
    favoritePost.sort((a, b) => a.id!.compareTo(b.id!));
    unfavoritePost.addAll(state.postList!.where((post) => post.isFav! == false));
    unfavoritePost.sort((a, b) => a.id!.compareTo(b.id!));

    state.postList = favoritePost + unfavoritePost;

    state = HomePageModelState.fromJson(state.toJson());
    if (isOnDetails!) {
      ref.read(detailPageState.notifier).updateView();
    }
  }

  void deletePostFromList({required BuildContext context, required int pos, bool? isOnDetails = false}) {
    state.postList!.removeAt(pos);
    state = HomePageModelState.fromJson(state.toJson());
    if (isOnDetails!) context.pop();
  }

  void deleteAllPosts() {
    if (!state.isDeleted!) {
      state.postList = [];
      state.isDeleted = true;
      state = HomePageModelState.fromJson(state.toJson());
    }
  }
}
