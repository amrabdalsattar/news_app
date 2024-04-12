import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/app_colors.dart';

class ArticleShimmer extends StatelessWidget {
  const ArticleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.liteGrey,
      highlightColor: AppColor.midGrey,
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.black,
            borderRadius: BorderRadius.circular(8)
        ),
        height: MediaQuery.of(context).size.height * 0.22,

      ),
    );
  }
}
