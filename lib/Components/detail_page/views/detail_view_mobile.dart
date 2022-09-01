part of '../detail_page.dart';

class _DetailViewMobile extends StatelessWidget {
  const _DetailViewMobile({
    Key? key,
    required this.postInfo,
    required this.userInfo,
    required this.commentsList,
  }) : super(key: key);

  final PostModel postInfo;
  final UserModel userInfo;
  final List<CommentsModel> commentsList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          physics: const BouncingScrollPhysics(),
          padding: size.all(context, .05),
          children: [
            SizedBox(height: size.width(context, .2)),
            // Post Detail
            Text(
              postInfo.title!,
              style: styles.headerThree(),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: size.width(context, .025)),
            Text(
              postInfo.body!,
              style: styles.lightMedium(),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: size.width(context, .1)),
            Text(
              AppLocalizationService.of(context).translate('detail_page_text', 'user_text')!,
              style: styles.headerThree(),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: size.width(context, .025)),
            userInfo.id != postInfo.userId
                ? SizedBox(
                    height: size.height(context, .2),
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
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            AppLocalizationService.of(context).translate('detail_page_text', 'name_text')!,
                            style: styles.regularMedium(),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            userInfo.name!,
                            style: styles.lightMedium(),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: size.width(context, .015)),
                      Row(
                        children: [
                          Text(
                            AppLocalizationService.of(context).translate('detail_page_text', 'email_text')!,
                            style: styles.regularMedium(),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            userInfo.email!,
                            style: styles.lightMedium(),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: size.width(context, .015)),
                      Row(
                        children: [
                          Text(
                            AppLocalizationService.of(context).translate('detail_page_text', 'phone_text')!,
                            style: styles.regularMedium(),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            userInfo.phone!,
                            style: styles.lightMedium(),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: size.width(context, .015)),
                      Row(
                        children: [
                          Text(
                            AppLocalizationService.of(context).translate('detail_page_text', 'website_text')!,
                            style: styles.regularMedium(),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            userInfo.website!,
                            style: styles.lightMedium(),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: size.width(context, .1)),
                    ],
                  ),
            Text(
              AppLocalizationService.of(context).translate('detail_page_text', 'comments_text')!,
              style: styles.headerThree(),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: size.width(context, .025)),
            commentsList.isEmpty
                ? SizedBox(
                    height: size.height(context, .6),
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
                : ListView.builder(
                    padding: size.symmetric(context, .015, .05),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: commentsList.length,
                    itemBuilder: (context, index) {
                      return FadeInDown(
                        delay: Duration(milliseconds: commentsList[index].id!),
                        child: Container(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                commentsList[index].name!,
                                style: styles.mediumMedium(),
                              ),
                              SizedBox(height: size.width(context, .025)),
                              Text(
                                commentsList[index].body!,
                                style: styles.lightSmall(),
                              ),
                              SizedBox(height: size.width(context, .025)),
                              Text(
                                commentsList[index].email!,
                                style: styles.mediumExtraSmall(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
        const DetailsAppBar(),
      ],
    );
  }
}
