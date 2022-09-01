import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zemoga_app/Components/home_page/riverpod/home_page_state.dart';

import 'package:zemoga_app/Components/home_page/widgets/post_card.dart';
import 'package:zemoga_app/models/post_model.dart';

import 'package:zemoga_app/services/app_localization_service.dart';

import 'package:zemoga_app/utils/utils.dart';

import 'widgets/home_app_bar.dart';

part './views/home_view_mobile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageState);
    final notifier = ref.watch(homePageState.notifier);

    _homeInit(ref: ref);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => notifier.deleteAllPosts(),
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.delete_rounded,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.fullHeight(context),
          width: size.fullHeight(context),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1280) {
                //TODO: Hacer desktop and tablet view
                return Container();
              } else {
                return _HomeViewMobile(
                  postList: state.postList!,
                  deletePost: notifier.deletePostFromList,
                  isDeleted: state.isDeleted!,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void _homeInit({required WidgetRef ref}) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (ref.read(homePageState).postList!.isEmpty && !ref.read(homePageState).isDeleted!) {
        await ref.read(homePageState.notifier).getAllPosts();
      }
    });
  }
}
