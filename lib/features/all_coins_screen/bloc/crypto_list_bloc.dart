import 'package:bloc/bloc.dart';
import 'package:crypto_app/repositories/abstract_coin_repository.dart';
import 'package:crypto_app/repositories/models/crypto_coin_model.dart';
import 'package:get_it/get_it.dart';

part 'crypto_list_event.dart';

part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        final ccl = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: ccl));
      } catch (e) {
        emit(CryptoListLoadingFailure(exception: e));
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
