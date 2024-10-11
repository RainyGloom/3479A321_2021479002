import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio1/SizedRow.dart';
import 'package:laboratorio1/app_data.dart';
import 'package:laboratorio1/pages/Page.dart';
import 'package:laboratorio1/pages/common.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Laboratorio 5',
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
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static String title = 'Laboratorio 3 Home';


  @override
  State<MyHomePage> createState()
  {
    Logger log = Logger();
    log.d("Home Page state create");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String label = "Derrota";
  Logger _log = Logger();

  Drawer _mainDrawer()
  {
    Drawer returnDrawer = Drawer(child: ElevatedButton(onPressed: ()
    {
      goingTo(context, const MyHomePage());
      context.read<AppData>().actions.add("Acceso a la pagina de inicio");
    }, child: const Text("Volver")));
    return Drawer(
      child: ListView(children:
        [
          ElevatedButton(onPressed: ()
          {
            goingTo(context, const MyHomePage());
            context.read<AppData>().actions.add("Acceso a la pagina de inicio");
          }, child: const Text("Contador")),
          ElevatedButton(onPressed: () 
            {
              goingTo(context, CustomPage(
                  title: "Detalle", 
                  body: Card(
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
                          Text(context.read<AppData>().count.toString(),
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
                  drawer: returnDrawer, 
                ),
              );
              context.read<AppData>().actions.add("Acceso a la pagina de detalles");
            }, 
            child: const Text("Detalle"),
          ),
          ElevatedButton(onPressed: ()
            {
              goingTo(context, CustomPage(
                  title: "Sobre mi", 
                  body: const Center(
                    child: 
                      Column(children: 
                      [
                        Text("Leandro Jesus Carvajal Pallacan"),
                        Text("Estudiante IDVRV"),
                      ],
                    ),
                  ),
                  drawer: returnDrawer, 
                ),
              );
              context.read<AppData>().actions.add("Acceso a la pagina de Sobre mi");
            },
            child: const Text("Sobre"),
          ), 
          ElevatedButton(onPressed: ()
            {
              context.read<AppData>().actions.add("Ingreso a la auditoria");
              goingTo(context, CustomPage(
                  title: "Auditoria", 
                  body: Center(
                    child: ListView.builder(
                      itemCount: context.read<AppData>().actions.length,
                      itemBuilder: (context, index)
                      {
                        return Text((index + 1).toString() + ". " + context.read<AppData>().actions[index]);
                      }
                    ),
                  ),
                  drawer: returnDrawer, 
                ),
              );
            },
            child: const Text("Auditoria")
          ),
        ],
      ),
    );
  }
  @override
  void initState()
  {
    _log.d("Home page init state");
    super.initState();
    updateLabel();
  }

  @override
  void didChangeDependencies() {
    _log.d("Home page did change dependencies?");
    super.didChangeDependencies();
  }

  @override
  void setState(VoidCallback fn) {
    _log.d("Home page setting state");
    super.setState(fn);
  }

  @override 
  void didUpdateWidget(covariant MyHomePage oldWidget) {
     _log.d("Home page did update widget?");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    _log.d("Home page deactivated");
    super.deactivate();
  }

  @override
  void dispose() {
    _log.d("Home page disposed");
    super.dispose();
  }

  @override
  void reassemble() {
    _log.d("Home page reassemble");
    super.reassemble();
  }

  void updateLabel()
  {
    setState(()
    {
      int count = context.read<AppData>().count;
      if(count == 5 || count == 10)
      {
        label = "La victoria es tuya";
      }
      else
      {
        label = "Sufres la derrota";
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    _log.d("Home page build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(MyHomePage.title),
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
                    Text(context.read<AppData>().count.toString(),
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
      drawer: _mainDrawer()
    );
  }

  ElevatedButton createDecreaseButton() => ElevatedButton(
    onPressed: ()
    {
      context.read<AppData>().decreaseCount();
      updateLabel();
    },
    child: const Icon(Icons.remove));

  ElevatedButton createIncrementButton() => ElevatedButton(
    onPressed: ()
    {
      context.read<AppData>().incrementCounter();
      updateLabel();
    },
    child: const Icon(Icons.add));

  ElevatedButton createResetButton() {
    return ElevatedButton(
      onPressed: ()
      {
        context.read<AppData>().reset();
        updateLabel();
      },
      child: const Icon(Icons.exposure_zero),
    );
  }
}
