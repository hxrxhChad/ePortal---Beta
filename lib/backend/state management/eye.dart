import 'package:flutter_bloc/flutter_bloc.dart';

class EyeCubit extends Cubit<bool> {
  EyeCubit() : super(false);

  void setEye(bool value) {
    emit(value);
  }
}
