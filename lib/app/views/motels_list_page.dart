import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motels_nearby_test/app/viewmodel/motels_viewmodel.dart';
import 'package:http/http.dart' as http;
import '../repositories/motels_repository.dart';
import '../services/api_client.dart';

class MotelsListPage extends StatefulWidget {
  const MotelsListPage({super.key});

  @override
  State<MotelsListPage> createState() => _MotelsListPageState();
}

class _MotelsListPageState extends State<MotelsListPage> {
  late MotelsViewModel viewModel;

  @override
  void initState() {
    viewModel =
        MotelsViewModel(MotelsRepository(ApiClient(client: http.Client())));
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
      appBar: AppBar(title: const Text('Motéis Próximos')),
      body: BlocProvider(
        create: (context) => viewModel,
        child: BlocBuilder<MotelsViewModel, MotelsState>(
          builder: (context, state) {
            if (state is MotelsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MotelsLoaded) {
              return ListView.builder(
                itemCount: state.motels.length,
                itemBuilder: (context, index) {
                  final motel = state.motels[index];
                  return ListTile(
                    title: Text(motel.name),
                    subtitle: Text(motel.neighborhood),
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
    );
  }
}
