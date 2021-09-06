import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/appshop/shopapp_states.dart';
import 'package:newsapp/network/remote/diohelper.dart';

class LoginCubit extends Cubit<ShopAppStates> {
  LoginCubit() : super(InitialStateAppShop());

  static LoginCubit get(context) => BlocProvider.of(context);

  void logIn(String url, Map<String, dynamic> query) {
    DioHelper.logIn(url, query).then((value) {});
  }
}
