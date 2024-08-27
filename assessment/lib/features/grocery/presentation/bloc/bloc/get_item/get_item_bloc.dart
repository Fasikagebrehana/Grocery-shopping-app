import 'package:assessment/features/grocery/data/models/grocery_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_item_event.dart';
part 'get_item_state.dart';

class GetItemBloc extends Bloc<GetItemEvent, GetItemState> {
  GetItemBloc() : super(GetItemInitial())  {
    on<GetItemEvent>((event, emit) {
      // TODO: implement event handler
      emit(GetItemLoading());
      // final result = await getAllGroceries();
      // result.fold((l) => emit(GetItemError(message: 'fdgf')), (r) => emit(GetItemLoaded(grocery: r)));

    });
  }
}