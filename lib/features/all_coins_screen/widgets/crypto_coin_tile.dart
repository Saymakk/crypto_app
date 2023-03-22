import 'package:crypto_app/repositories/models/crypto_coin_model.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  CryptoCoinTile({Key? key, required this.coin,}) : super(key: key);

  final CryptoCoinModel coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(coin.imageUrl),
      title: Text(' ${(coin.name).toString()}'),
      subtitle: Text('${coin.priceInUSD.toString()}'),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: '${coin.name}',
        );
      },
    );
  }
}
