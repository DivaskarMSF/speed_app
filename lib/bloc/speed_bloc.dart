import 'package:bloc/bloc.dart';

import 'package:speed_app/bloc/speed_event.dart';
import 'package:speed_app/bloc/speed_state.dart';



class SpeedBloc extends Bloc<SpeedEvent, SpeedState> {

  SpeedBloc() : super(SpeedInitial()) {

    on<SpeedEvent>((event, emit) {
      emit(SpeedState(event.userRange));
    });
    
  }
}
