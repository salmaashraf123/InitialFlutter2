import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class NavBarCubit extends Cubit<int> {
  NavBarCubit() : super(0);
  void goToTab(int index){
    emit(index);
  }

}
