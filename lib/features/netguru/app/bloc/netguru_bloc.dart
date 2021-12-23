import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'netguru_event.dart';
part 'netguru_state.dart';

class NetguruBloc extends Bloc<NetguruEvent, NetguruState> {
  NetguruBloc() : super(NetguruInitial()) {
    on<NetguruEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
