import 'package:crypto_app/features/all_coins_screen/bloc/crypto_list_bloc.dart';
import 'package:crypto_app/repositories/abstract_coin_repository.dart';
import 'package:crypto_app/repositories/models/crypto_coin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../widgets/crypto_coin_tile.dart';

class AllCoinsScreen extends StatefulWidget {
  const AllCoinsScreen({super.key});

  @override
  State<AllCoinsScreen> createState() => _AllCoinsScreenState();
}

class _AllCoinsScreenState extends State<AllCoinsScreen> {
  List<CryptoCoinModel>? _ccl;
  final _cryptoListBloc = CryptoListBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('AllCoins'),
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          if (state is CryptoListLoaded) {
            return ListView.separated(
              itemCount: state.coinsList.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, i) {
                final coin = state.coinsList[i];
                return CryptoCoinTile(
                  coin: coin,
                );
              },
            );
          }
          if (state is CryptoListLoadingFailure) {
            return Center(
              child: Text('Что-то пошло не так.'),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      // (_ccl == null)
      //     ? const Center(child: CircularProgressIndicator())
      //     : ListView.separated(
      //         itemCount: _ccl!.length,
      //         separatorBuilder: (context, index) => Divider(),
      //         itemBuilder: (context, i) {
      //           final coin = _ccl![i];
      //           return CryptoCoinTile(
      //             coin: coin,
      //           );
      //         },
      //       ),
    );
  }
}
