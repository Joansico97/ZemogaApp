part of './home_page_state.dart';

class HomePageModelState {
  List<PostModel>? postList;
  bool? isDeleted;

  HomePageModelState({
    this.postList,
    this.isDeleted,
  });

  HomePageModelState.fromJson(Map<String, dynamic> json) {
    if (json['postList'] != null) {
      postList = <PostModel>[];
      json['postList'].forEach((value) {
        postList!.add(PostModel.fromJson(value));
      });
    } else {
      postList = <PostModel>[];
    }
    isDeleted = json['isDeleted'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (postList != null) {
      data['postList'] = postList!.map((value) => value.toJson()).toList();
    }
    data['isDeleted'] = isDeleted;
    return data;
  }
}
