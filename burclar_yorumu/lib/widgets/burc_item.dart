import 'package:burclar_yorumu/models/burc.dart';
import 'package:burclar_yorumu/pages/burc_detay.dart';
import 'package:flutter/material.dart';

class BurcItem extends StatelessWidget {
  final Burc gelenBurc;
  const BurcItem({super.key, required this.gelenBurc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Card(
        elevation: 4, //kart arkasına gölgelendirme yapar.
        child: Padding(padding: EdgeInsets.all(8),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BurcDetay(secilenBurc: gelenBurc),
            ),
            );
          },
          leading: Image.asset("images/${gelenBurc.burcKucukResim}"),
          title: Text(gelenBurc.burcAdi, style: Theme.of(context).textTheme.headlineSmall ,),
          subtitle: Text(gelenBurc.burcTarih, style: Theme.of(context).textTheme.bodyLarge,),
          trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).iconTheme.color,),
        ),
        ),
      ),
      );
  }
}