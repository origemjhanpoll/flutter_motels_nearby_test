import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motels_nearby_test/app/viewmodel/motels_viewmodel.dart';
import 'package:flutter_motels_nearby_test/app/views/widgets/motel_card_widget.dart';
import 'package:flutter_motels_nearby_test/core/shared/app_bar_widget.dart';
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
    return Scaffold(
      appBar: AppBarWidget(),
      body: SafeArea(
        child: BlocProvider.value(
          value: viewModel,
          child: BlocBuilder<MotelsViewModel, MotelsState>(
            builder: (context, state) {
              if (state is MotelsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MotelsLoaded) {
                return ListView.builder(
                  itemCount: state.motels.length,
                  itemBuilder: (context, index) {
                    final motel = state.motels[index];
                    return MotelCardWidget(
                      name: motel.name,
                      neighborhood: motel.neighborhood,
                      logo: motel.logo,
                      suites: motel.suites,
                    );
                  },
                );
              } else if (state is MotelsEmpty) {
                return const Center(child: Text('Nenhum motel encontrado.'));
              } else if (state is MotelsError) {
                return Center(child: Text(state.message));
              }
              return const LimitedBox();
            },
          ),
        ),
      ),
    );
  }
}
