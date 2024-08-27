part of 'get_item_bloc.dart';

sealed class GetItemState extends Equatable {
  const GetItemState();
  
  @override
  List<Object> get props => [];
}

final class GetItemInitial extends GetItemState {}

final class GetItemLoading extends GetItemState {}

final class GetItemLoaded extends GetItemState {
  final GroceryModel grocery;

  const GetItemLoaded({required this.grocery});

  @override
  List<Object> get props => [grocery];
}

final class GetItemError extends GetItemState {
  final String message;

  const GetItemError({required this.message});

  @override
  List<Object> get props => [message];
}
