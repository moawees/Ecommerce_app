import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerCubit extends Cubit<bool> {
  DrawerCubit() : super(false); // Initial state: Drawer is closed

  void openDrawer() => emit(true);
  void closeDrawer() => emit(false);
}
