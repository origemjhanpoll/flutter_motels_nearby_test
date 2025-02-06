part of 'motels_viewmodel.dart';

sealed class MotelsState extends Equatable {
  const MotelsState();

  @override
  List<Object> get props => [];
}

class MotelsInit extends MotelsState {}

class MotelsLoading extends MotelsState {}

class MotelsLoaded extends MotelsState {
  final List<MotelModel> motels;
  const MotelsLoaded(this.motels);

  @override
  List<Object> get props => [motels];
}

class MotelsEmpty extends MotelsState {}

class MotelsError extends MotelsState {
  final String message;
  const MotelsError(this.message);

  @override
  List<Object> get props => [message];
}
