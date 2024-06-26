import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/model/sources_response.dart';
import 'package:news_app/ui/components/error_view.dart';
import 'package:news_app/ui/components/loading.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_theme.dart';

import '../../../../../utils/app_asset.dart';
import '../../../utils/view_models/sources_provider.dart';
import 'news_list.dart';

class NewsTab extends StatefulWidget {
  final String categoryId;

  const NewsTab(this.categoryId, {super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  SourcesViewModel viewModel = SourcesViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getSources(widget.categoryId);
    });
  }

  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAsset.backGround), fit: BoxFit.cover)),
      child: BlocBuilder<SourcesViewModel, SourcesTabsStates>(
        bloc: viewModel,
        builder: (_, state) {
          Widget content;
          if (state is SourcesTabsLoading) {
            content = const Loading();
          } else if (state is SourcesTabsSuccess) {
            content = buildTab(state.sources);
          } else {
            state as SourcesTabsError;
            content = ErrorView(message: state.errorMessage);
          }
          return content;
        },
      ),
    );
  }

  Widget buildTab(List<Source> list) {
    return DefaultTabController(
      length: list.length,
      child: Column(
        children: [
          TabBar(
            overlayColor: const MaterialStatePropertyAll(AppColor.transparent),
            onTap: (index) {
              currentTabIndex = index;
              setState(() {});
            },
            indicatorColor: AppColor.transparent,
            isScrollable: true,
            tabs: list
                .map((source) => buildTabWidget(
                    source.name ?? "", currentTabIndex == list.indexOf(source)))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
                children: list
                    .map((source) => NewsList(
                          sourceId: source.id!,
                        ))
                    .toList()),
          )
        ],
      ),
    );
  }

  Widget buildTabWidget(String name, bool isSelected) {
    return Container(
        margin: const EdgeInsets.only(top: 22, bottom: 36),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: isSelected ? AppColor.primary : AppColor.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColor.primary)),
        child: Text(
          name,
          style: AppTheme.appTheme.textTheme.headlineSmall!
              .copyWith(color: isSelected ? AppColor.white : AppColor.primary),
        ));
  }
}
