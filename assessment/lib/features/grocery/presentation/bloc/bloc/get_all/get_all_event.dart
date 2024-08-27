part of 'get_all_bloc.dart';

sealed class GetAllEvent extends Equatable {
  const GetAllEvent();

  @override
  List<Object> get props => [];
}

final class GetAllGroceriesEvent extends GetAllEvent {}
