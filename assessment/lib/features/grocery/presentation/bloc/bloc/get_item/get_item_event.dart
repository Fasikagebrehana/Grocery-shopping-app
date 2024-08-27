part of 'get_item_bloc.dart';

sealed class GetItemEvent extends Equatable {
  const GetItemEvent();

  @override
  List<Object> get props => [];
}

class GetItemGroceryEvent extends GetItemEvent {
  final int id;

  GetItemGroceryEvent({required this.id});

  @override
  List<Object> get props => [id];
}