part of './detail_page_state.dart';

class _DetailPageEvents extends StateNotifier<DetailPageModelState> {
  _DetailPageEvents(this.ref) : super(DetailPageModelState.fromJson({}));

  final Ref ref;
  final _logger = Logger();

  Future<void> getUserInfo() async {
    try {
      final response = await dioService.getData(
        url:
            '${Constants.baseUrl}${Constants.usersUrl}${state.postInfo!.userId}',
      );
      state.userInfo = UserModel.fromJson(response);
      state = DetailPageModelState.fromJson(state.toJson());
    } catch (e) {
      _logger.e('An error has occurred while bringing the information');
      rethrow;
    }
  }

  Future<void> getPostListComments() async {
    try {
      final response = await dioService.getData(
          url:
              '${Constants.baseUrl}${Constants.postsUrl}${state.postInfo!.id}/${Constants.commentsUrl}');
      state.commentsPostList = List<CommentsModel>.from(
          response.map((json) => CommentsModel.fromJson(json)));
      state = DetailPageModelState.fromJson(state.toJson());
    } catch (e) {
      _logger.e('An error has occurred while bringing the information');
      rethrow;
    }
  }

  void updateView() {
    state.postInfo!.isFav = !state.postInfo!.isFav!;
    state = DetailPageModelState.fromJson(state.toJson());
  }
}
