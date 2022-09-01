part of '../home_page.dart';

class _HomeViewMobile extends StatelessWidget {
  const _HomeViewMobile({
    Key? key,
    required this.postList,
    required this.deletePost,
    required this.isDeleted,
  }) : super(key: key);

  final List<PostModel> postList;
  final bool isDeleted;
  final Function deletePost;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeAppBar(),
        postList.isEmpty
            ? isDeleted
                ? Container(
                    height: size.height(context, .8),
                    width: size.fullWidth(context),
                    padding: size.all(context, .05),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizationService.of(context).translate('home_page_text', 'message_text')!,
                      style: styles.regularMedium(),
                    ),
                  )
                : SizedBox(
                    height: size.height(context, .8),
                    width: size.fullWidth(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          color: Color(0xff00C8B5),
                        ),
                        SizedBox(height: size.width(context, .05)),
                        Text(
                          AppLocalizationService.of(context).translate('home_page_text', 'loading_text')!,
                          style: styles.regularMedium(),
                        ),
                      ],
                    ),
                  )
            : Expanded(
                child: ListView.builder(
                  key: const PageStorageKey<String>('PostList'),
                  padding: size.symmetric(context, .05, .05),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    return FadeInLeft(
                      delay: Duration(milliseconds: postList[index].id!),
                      child: Dismissible(
                        key: Key('${postList[index].id}'),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          margin: size.bottom(context, .025),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: size.borderRadius(context, .025),
                          ),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: size.width(context, .1),
                          ),
                        ),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            deletePost(pos: index, context: context);
                          }
                        },
                        confirmDismiss: (_) {
                          return showDialog<bool>(
                            context: context,
                            barrierDismissible: true,
                            barrierColor: Colors.black.withOpacity(.9),
                            builder: (contex) => SizedBox(
                              height: size.width(context, .025),
                              width: size.width(context, .025),
                              // color: Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizationService.of(context).translate('home_page_text', 'alert_text')!,
                                    style: styles.boldMedium(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: size.width(context, .05)),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () => Navigator.of(context).pop(false),
                                        style: ElevatedButton.styleFrom(
                                          primary: colors.primaryColor,
                                        ),
                                        child: Text(
                                          AppLocalizationService.of(context)
                                              .translate('home_page_text', 'no_text_button')!,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () => Navigator.of(context).pop(true),
                                        style: ElevatedButton.styleFrom(
                                          primary: colors.primaryColor,
                                        ),
                                        child: Text(
                                          AppLocalizationService.of(context)
                                              .translate('home_page_text', 'yes_text_button')!,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: PostCard(
                          post: postList[index],
                          pos: index,
                        ),
                      ),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
