import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motels_nearby_test/app/viewmodel/motels_viewmodel.dart';
import 'package:flutter_motels_nearby_test/app/views/pages/suite_detail_page.dart';
import 'package:flutter_motels_nearby_test/app/views/pages/suites_list_page.dart';
import 'package:flutter_motels_nearby_test/app/views/molecules/motel_card_widget.dart';
import 'package:flutter_motels_nearby_test/core/constants/padding_size.dart';
import 'package:flutter_motels_nearby_test/core/shared/app_bar_widget.dart';
import 'package:flutter_motels_nearby_test/core/utils/go_next_page.dart';
import 'package:flutter_motels_nearby_test/injection.dart';

class MotelsListPage extends StatefulWidget {
  const MotelsListPage({super.key});

  @override
  State<MotelsListPage> createState() => _MotelsListPageState();
}

class _MotelsListPageState extends State<MotelsListPage> {
  late MotelsViewModel viewModel;

  @override
  void initState() {
    viewModel = di<MotelsViewModel>();
    viewModel.add(LoadMotels());
    super.initState();
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBarWidget(),
      body: SafeArea(
        bottom: false,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(36.0)),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(36.0))),
            child: BlocProvider.value(
              value: viewModel,
              child: BlocBuilder<MotelsViewModel, MotelsState>(
                builder: (context, state) {
                  if (state is MotelsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MotelsLoaded) {
                    return ListView.builder(
                      itemCount: state.motels.length,
                      padding: EdgeInsets.all(PaddingSize.medium),
                      itemBuilder: (context, index) {
                        final motel = state.motels[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: PaddingSize.medium),
                          child: MotelCardWidget(
                            onTap: () => goNewPage(
                              context: context,
                              child: SuitesListPage(
                                  title: motel.name, suites: motel.suites),
                            ),
                            onSuiteTap: (suite) => goNewPage(
                                fullscreenDialog: true,
                                context: context,
                                child: SuiteDetailPage(
                                  suite: suite,
                                  motelName: motel.name,
                                )),
                            name: motel.name,
                            neighborhood: motel.neighborhood,
                            logo: motel.logo,
                            suites: motel.suites,
                            gallery: motel.firstPhotos,
                            rating: motel.rating,
                            reviewsCount: motel.reviewsCount,
                          ),
                        );
                      },
                    );
                  } else if (state is MotelsEmpty) {
                    return const Center(
                        child: Text('Nenhum motel encontrado.'));
                  } else if (state is MotelsError) {
                    return Center(child: Text(state.message));
                  }
                  return const LimitedBox();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
