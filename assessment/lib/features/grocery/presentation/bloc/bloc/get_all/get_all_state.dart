part of 'get_all_bloc.dart';

sealed class GetAllState extends Equatable {
  const GetAllState();
  
  @override
  List<Object> get props => [];
}

final class GetAllInitial extends GetAllState {}

final class GetAllLoading extends GetAllState {}

final class GetAllLoaded extends GetAllState {
  final List<GroceryModel> groceries;

  const GetAllLoaded({required this.groceries});

  @override
  List<Object> get props => [groceries];
}

final class GetAllError extends GetAllState {
  final String message;

  const GetAllError({required this.message});

  @override
  List<Object> get props => [message];
}
