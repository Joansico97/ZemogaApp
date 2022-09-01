import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zemoga_app/Components/detail_page/riverpod/detail_page_state.dart';
import 'package:zemoga_app/Components/detail_page/widgets/details_app_bar.dart';
import 'package:zemoga_app/Components/home_page/riverpod/home_page_state.dart';
import 'package:zemoga_app/models/models.dart';
import 'package:zemoga_app/services/services.dart';
import 'package:zemoga_app/utils/utils.dart';

part './views/detail_view_mobile.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailPageState);
    final notifierHome = ref.watch(homePageState.notifier);

    _detailInit(ref: ref);

    return WillPopScope(
      onWillPop: () async {
        GoRouter.of(context).pop();
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              notifierHome.deletePostFromList(pos: state.postPosition!, context: context, isOnDetails: true),
          backgroundColor: Colors.red,
          child: const Icon(
            Icons.delete_rounded,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            height: size.fullHeight(context),
            width: size.fullWidth(context),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= 1280) {
                  //TODO: Hacer desktop and tablet view
                  return Container();
                } else {
                  return _DetailViewMobile(
                    postInfo: state.postInfo!,
                    userInfo: state.userInfo!,
                    commentsList: state.commentsPostList!,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void _detailInit({required WidgetRef ref}) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (ref.watch(detailPageState).userInfo!.id != ref.watch(detailPageState).postInfo!.userId) {
        await ref.watch(detailPageState.notifier).getUserInfo();
      }
      if (ref.watch(detailPageState).commentsPostList!.isEmpty) {
        await ref.watch(detailPageState.notifier).getPostListComments();
      }
    });
  }
}
