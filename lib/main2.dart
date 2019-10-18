import 'package:flutter/material.dart';
 
 main()=>runApp(Controles());

 class Controles extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }

 } 

 class Estado extends State{
   double precio=0.0;
   double iva=0.0; 
   double precioTotal=0.0;
   bool tienesMembresia=false;
   bool palomitas=false;
   bool cubetaPalomera=false;
   String pelicula;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField')
        ),
        body: 
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
        TextField(
           decoration: InputDecoration(
            icon: Icon(Icons.accessibility),
            labelText: 'Nombre',
            hintText: 'Escribe tu nombre',
            helperText: 'No escribas en mayusculas',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),

          onChanged: (cambio){
            print(cambio); 
            setState(() {
              precio= double.parse(cambio);
            iva=precio*0.16;
            precioTotal=precio*1.16;
            });
          },
        ),

        Text('Precio: $precio'),
        Text('Iva: $iva'),
        Text('Precio total: $precioTotal'),

        Checkbox(
          value: tienesMembresia,
          onChanged: (cambio){

            setState(() {
             tienesMembresia=cambio; 
            });
          },
        ),
        Text('Tienes membresia $tienesMembresia'),
        Switch(
          value: palomitas,
          onChanged: (cambio){

            setState(() {
             palomitas=cambio; 
            });
          }
        ),
        Text('Quieres palomitas: $palomitas'),

        SwitchListTile(value: cubetaPalomera,
        title: Text('¿Quieres cubeta palomera?'),
        subtitle:  Text('Es del bromas'),
        secondary: Icon(Icons.theaters),
        isThreeLine: true,

        onChanged: (cambio){
          setState(() {
           cubetaPalomera=cambio; 
          });
        },
        ),
        Text('Quieres cubeta: $cubetaPalomera'),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
        Radio(value: 'Toy Story 4',
          groupValue: pelicula,
          onChanged: (cambio){
            setState(() {
             pelicula=cambio; 
            });
          }
        ),
        Text('Toy Story'),
              ],
            ),

            Column(
              children: <Widget>[
        Radio(value: 'El Bromas',
          groupValue: pelicula,
          onChanged: (cambio){
            setState(() {
             pelicula=cambio; 
            });
          }
        ),
        Text('El Risas'),
              ],
            ),
            Column(
              children: <Widget>[
         Radio(value: 'The Room',
          groupValue: pelicula,
          onChanged: (cambio){
            setState(() {
             pelicula=cambio; 
            });
          }
        ),
        Text('La habitacion'), 
              ],
            )
          ],
        
        ),
        Text('Has elegido $pelicula'),    
            
            ], 
          ),
        )
      )
    );
  }

 }