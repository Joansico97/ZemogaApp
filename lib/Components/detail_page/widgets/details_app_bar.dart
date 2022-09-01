import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zemoga_app/Components/detail_page/riverpod/detail_page_state.dart';
import 'package:zemoga_app/Components/home_page/riverpod/home_page_state.dart';
import 'package:zemoga_app/services/services.dart';
import 'package:zemoga_app/utils/utils.dart';

class DetailsAppBar extends ConsumerWidget {
  const DetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailPageState);
    final notifierHome = ref.watch(homePageState.notifier);
    return Container(
      height: size.width(context, .2),
      padding: size.symmetric(context, 0.05, .05),
      color: const Color(0xff00C8B5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: size.width(context, .075),
            ),
          ),
          Text(
            '${AppLocalizationService.of(context).translate('detail_page_text', 'post_text')!} ${state.postInfo!.id}',
            style: styles.headerTwo(
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              notifierHome.makePostFavorite(position: state.postPosition!, isOnDetails: true);
            },
            icon: Icon(
              state.postInfo!.isFav! ? Icons.star_rounded : Icons.star_border_rounded,
              color: Colors.white,
              size: size.width(context, .075),
            ),
          ),
        ],
      ),
    );
  }
}
