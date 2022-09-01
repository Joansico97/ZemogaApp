part of './detail_page_state.dart';

class DetailPageModelState {
  PostModel? postInfo;
  UserModel? userInfo;
  List<CommentsModel>? commentsPostList;
  int? postPosition;

  DetailPageModelState({
    this.postInfo,
    this.userInfo,
    this.commentsPostList,
    this.postPosition,
  });

  DetailPageModelState.fromJson(Map<String, dynamic> json) {
    postInfo = PostModel.fromJson(json['postInfo'] ?? {});
    userInfo = UserModel.fromJson(json['userInfo'] ?? {});
    postPosition = json['posPostion'] ?? 0;
    if (json['commentsPostList'] != null) {
      commentsPostList = <CommentsModel>[];
      json['commentsPostList'].forEach((value) {
        commentsPostList!.add(CommentsModel.fromJson(value));
      });
    } else {
      commentsPostList = <CommentsModel>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postInfo'] = postInfo!.toJson();
    data['userInfo'] = userInfo!.toJson();
    data['postPosition'] = postPosition!;
    if (commentsPostList != null) {
      data['commentsPostList'] =
          commentsPostList!.map((value) => value.toJson()).toList();
    }
    return data;
  }
}
