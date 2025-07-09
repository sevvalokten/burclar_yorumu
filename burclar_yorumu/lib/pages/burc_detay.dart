import 'package:burclar_yorumu/models/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({super.key, required this.secilenBurc});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi =Colors.brown; //genel bir appbar rengi tanımladık

  late PaletteGenerator _generator; //late demek: “İleride değer vereceğim ama şimdi null değilmiş gibi davran.”PaletteGenerator, bir resmin içindeki baskın renkleri bulmak için kullanılır.


//Widget ilk oluşturulduğunda (initState), appBarRenginiBul() fonksiyonunu çağırıyorsun ki, AppBar’ın rengini resmi analiz ederek belirleyebilesin.
@override
  void initState() {
    super.initState();
    appBarRenginiBul();
  } 
  //resim yüklenmesi zaman alabilir, await ve async kullanıyorsun.
  void appBarRenginiBul()async{
    _generator = await PaletteGenerator.fromImageProvider(AssetImage("images/${widget.secilenBurc.burcBuyukResim}")
    );

    setState(() {
      appBarRengi = _generator.dominantColor!.color; //bu parametre uygulamadaki dominant rengi verirken, vibrantColor. renkeleri daha karıştırarak verir,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: CustomScrollView(
        slivers: [SliverAppBar(
          backgroundColor: appBarRengi,
          expandedHeight: 250,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text("${widget.secilenBurc.burcAdi} Burcu ve Özellikleri"),
            background: Image.asset("images/${widget.secilenBurc.burcBuyukResim}", fit: BoxFit.cover,),
          ),

        ),
        //DİKKAT! Eğer custom içinde normalde widget kullanmak istiyorsanız:
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Text(
                widget.secilenBurc.burcDetay,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        )
        ],
      )
    );
  }
}