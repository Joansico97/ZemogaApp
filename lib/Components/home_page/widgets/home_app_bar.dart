import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zemoga_app/Components/home_page/riverpod/home_page_state.dart';
import 'package:zemoga_app/services/services.dart';
import 'package:zemoga_app/utils/utils.dart';

class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(homePageState.notifier);
    return Container(
      padding: size.symmetric(context, 0.05, .05),
      color: const Color(0xff00C8B5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizationService.of(context).translate('home_page_text', 'posts_text')!,
            style: styles.headerTwo(
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => notifier.getAllPosts(),
            icon: Icon(
              Icons.replay_rounded,
              color: Colors.white,
              size: size.width(context, .075),
            ),
          ),
        ],
      ),
    );
  }
}
