import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/appshop/shopapp_states.dart';
import 'package:newsapp/network/remote/diohelper.dart';

class ShopAppCubit extends Cubit<ShopAppStates> {
  ShopAppCubit() : super(InitialStateAppShop());

  static ShopAppCubit get(context) => BlocProvider.of(context);

  void getHomeData() {
    DioHelper.getHomeShop(url: 'home');
  }
}
