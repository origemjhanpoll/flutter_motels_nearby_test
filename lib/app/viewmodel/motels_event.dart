part of 'motels_viewmodel.dart';

sealed class MotelsEvent extends Equatable {
  const MotelsEvent();

  @override
  List<Object> get props => [];
}

class LoadMotels extends MotelsEvent {}
