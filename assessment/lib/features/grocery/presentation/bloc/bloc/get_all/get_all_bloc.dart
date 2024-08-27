import 'package:assessment/features/grocery/data/models/grocery_model.dart';
import 'package:assessment/features/grocery/domain/entity/grocery.dart';
import 'package:assessment/features/grocery/domain/usecases/get_all_groceries.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_all_event.dart';
part 'get_all_state.dart';

class GetAllBloc extends Bloc<GetAllEvent, GetAllState> {
  late GetAllGroceries getAllGroceries;
  
  GetAllBloc(this.getAllGroceries) : super(GetAllLoading()) {
    on<GetAllEvent>((event, emit) async{
      // TODO: implement event handler
      emit(GetAllLoading());
      final result = await getAllGroceries();
      print(result);
      result.fold((l) => emit(const GetAllError(message: ('Failed to fetch'))), (r) => emit(GetAllLoaded(groceries: r)));
      });
  }
}
