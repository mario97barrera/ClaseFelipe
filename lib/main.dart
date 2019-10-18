import 'package:flutter/material.dart';

main()=>runApp(Estacionamiento());

class Estacionamiento extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }

}

class Estado extends State{
  double costo1=0;
  double costo2=0;
  double pago=0;
  int hentra=0, mEntra=0, hsal=0, msal=0;

  

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
         appBar: AppBar(
           title: Text('Pago de estacionamiento')
         ), 
         body: 
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
             children: <Widget>[
               TextField(
                 decoration: InputDecoration(
                   icon: Icon(Icons.monetization_on),
                   hintText: 'Costo 1ra hora',
                   helperText: 'Introduzca costo primera hora',
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15),
                   ),
                 ),
                 onChanged:(cambio){
                     setState(() {
                      costo1 = double.parse(cambio);
                     });
                   }
               ),
               TextField(
                 decoration: InputDecoration(
                   icon: Icon(Icons.monetization_on),
                     hintText: 'Costo por fraccion',
                   helperText: 'Introduzca costo de fraccion',
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15),
                 ),
                  ),
                  onChanged:(cambio){
                     setState(() {
                      costo2 = double.parse(cambio);
                     });
                   }
               ),

               TextField(
                 decoration: InputDecoration(
                   icon: Icon(Icons.access_time),
                     hintText: 'Hora de inicio',
                      helperText: 'Introduzca la hora de entrada'      
                ),
               onChanged:(cambio){
                     setState(() {
                       List<String> fraccion = cambio.split(':');
                       hentra = int.parse(fraccion [0]);
                       mEntra = int.parse(fraccion [1]);
                     });
                   }
               ),

                TextField(
                 decoration: InputDecoration(
                   icon: Icon(Icons.access_time),
                     hintText: 'Hora de fin',
                      helperText: 'Introduzca la hora de salida'
                ),
                onChanged:(cambio){
                     setState(() {
                        List<String> fraccion = cambio.split(':');
                       hsal = int.parse(fraccion [0]);
                       msal = int.parse(fraccion [1]);
                     });
                   }
               ),
               FlatButton(
                 child: Text('Pagar'),
                 onPressed: (){
                   print(hentra);
                   print(mEntra);
                   print(hsal);
                   print(msal);
                   setState(() {
                    int totHora = -hentra + hsal; 
                    int totMin = - mEntra + msal;

                    if (totHora < 0) {
                      totHora += 24;
                      totHora.abs();
                    }
                    totHora -=1;
                    pago=costo1;
                    totMin += totHora*60;
                    double fraccion = totMin/15;
                    fraccion.floor();
                    
                    pago+=fraccion*costo2;

                    //for(var i=0; i<fraccion; i++){
                    //  pago += costo2;
                    //}
                   });
                 },
               ),
               Text('Total a pagar es: $pago'),
             ],
           )
         ),
        )
      );
  }

}
