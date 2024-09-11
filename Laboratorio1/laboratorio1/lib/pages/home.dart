import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio1/SizedRow.dart';
import 'package:laboratorio1/pages/Page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laboratorio 3',
      theme: ThemeData(
        fontFamily:'Daydream', 
        textTheme: const TextTheme(
          displayLarge:  TextStyle(
            fontSize: 21,
            //fontWeight: FontWeight.bold,
          ),
          titleLarge:  TextStyle( 
            fontFamily: 'Daydream',
            fontSize: 21,
            //fontStyle: FontStyle.italic,
          ),

        ),
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Laboratorio 3 Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String label = "Derrota";

  @override
  void initState()
  {
    super.initState();
    updateLabel();
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
      updateLabel();
    });
  }

  void _decreaseCount()
  {
    setState(() {
      _counter--;
      updateLabel();
    });
  }

  void _reset()
  {
    setState(() {
      _counter = 0;
      updateLabel();
    });
  }

  void updateLabel()
  {
    if(_counter == 5 || _counter == 10)
    {
      label = "La victoria es tuya";
    }
    else
    {
      label = "Sufres la derrota";
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: 
        [
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height - 200,
            child: Card(
              color: Colors.amber,
              child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/triforce.svg',
                    height: 50,
                    width: 50,),
                    const Text(
                      'Has presionado este boton:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Text
                    (
                      ' veces'
                    ),
                    
                    Text(
                      label
                    ),

                    SizedRow(
                      width: 300,
                      height: 75,
                      childAlignment: MainAxisAlignment.center,
                      children: [createIncrementButton(), createResetButton(), createDecreaseButton()]
                    ),
                  ],
                ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: 
      [
        ElevatedButton(onPressed: ()
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => 
              CustomPage(title: 'Pagina 1', buttons: 
                [
                  ElevatedButton(onPressed: ()
                  {
                    Navigator.pop(context);
                  }, 
                  child: const Text('Anterior'),
                  ),
                  ElevatedButton(onPressed: ()
                  {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) =>
                      CustomPage(title: 'Pagina 2', buttons: 
                      [
                        ElevatedButton(onPressed: ()
                        {
                          Navigator.pop(context);
                        }, 
                        child: const Text('Anterior'),
                        ),
                      ])
                      )
                    );
                  }, child: const Text('Siguiente')
                  )
                ],
              )
            )
          );
        }, 
        child: const Text('Siguiente')
        )
      ],
    );
  }

  ElevatedButton createDecreaseButton() => ElevatedButton(onPressed: _decreaseCount, child: const Icon(Icons.remove));

  ElevatedButton createIncrementButton() => ElevatedButton(onPressed: _incrementCounter, child: const Icon(Icons.add));

  ElevatedButton createResetButton() {
    return ElevatedButton(
      onPressed: _reset,
      child: const Icon(Icons.exposure_zero),
    );
  }
}
