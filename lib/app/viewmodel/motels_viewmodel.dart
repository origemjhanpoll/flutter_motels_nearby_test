import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_motels_nearby_test/app/models/motel_model.dart';
import 'package:flutter_motels_nearby_test/app/repositories/motels_repository.dart';

part 'motels_event.dart';
part 'motels_state.dart';

class MotelsViewModel extends Bloc<MotelsEvent, MotelsState> {
  final MotelsRepository repository;

  MotelsViewModel(this.repository) : super(MotelsInit()) {
    on<LoadMotels>(_onLoadMotels);
  }

  Future<void> _onLoadMotels(
      LoadMotels event, Emitter<MotelsState> emit) async {
    emit(MotelsLoading());
    try {
      final motels = await repository.getMotels();
      if (motels.isEmpty) {
        emit(MotelsEmpty());
      } else {
        emit(MotelsLoaded(motels));
      }
    } on HttpException catch (e) {
      emit(MotelsError(e.message));
    } catch (e) {
      debugPrint('$e');
      emit(MotelsError("Erro ao buscar motéis: $e"));
    }
  }
}
