import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zemoga_app/Components/home_page/riverpod/home_page_state.dart';

import 'package:zemoga_app/models/models.dart';
import 'package:zemoga_app/utils/utils.dart';

class PostCard extends ConsumerWidget {
  const PostCard({
    Key? key,
    required this.post,
    required this.pos,
  }) : super(key: key);

  final PostModel post;
  final int pos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(homePageState.notifier);

    return Container(
      padding: size.all(context, .035),
      margin: size.bottom(context, .025),
      width: size.fullWidth(context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: size.borderRadius(context, .025),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF01003E).withOpacity(.15),
            offset: const Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              notifier.makePostFavorite(position: pos);
            },
            icon: Icon(
              post.isFav! ? Icons.star_rounded : Icons.star_border_rounded,
              color: const Color(0xff00C8B5),
              size: size.width(context, .075),
            ),
          ),
          InkWell(
            onTap: () => {notifier.goToPostDetail(context, post)},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: size.width(context, .6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title!,
                        style: styles.boldMedium(),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: size.width(context, .02)),
                      Text(
                        post.body!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: styles.lightSmall(),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
