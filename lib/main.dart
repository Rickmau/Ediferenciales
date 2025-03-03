import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  final List<String> topics = const [
    'Introducción a las ecuaciones diferenciales',
    'Clasificación de ecuaciones diferenciales',
    'Existencia y unicidad de solución',
    'Integración directa',
    'Integración por factor integrante'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curso de Ecuaciones Diferenciales'),
        backgroundColor: Colors.redAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Text(
                'Temas del Curso',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ...topics.map((topic) => ListTile(
              title: Text(topic),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicDetailPage(topic: topic),
                  ),
                );
              },
            )),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '¡Bienvenido al Curso de Ecuaciones Diferenciales!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Selecciona del un tema del menú',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopicDetailPage extends StatelessWidget {
  final String topic;

  const TopicDetailPage({super.key, required this.topic});

  String getTopicContent() {
    switch (topic) {
      case 'Introducción a las ecuaciones diferenciales':
        return 'Las ecuaciones diferenciales son ecuaciones matemáticas que relacionan una función con sus derivadas. Su importancia radica en que modelan fenómenos dinámicos en diversas áreas como la física, la biología, la economía y la ingeniería. Existen diferentes tipos de ecuaciones diferenciales, como las ordinarias y parciales, que se clasifican según la cantidad de variables independientes involucradas.\n\n'
            'Un ejemplo clásico de ecuación diferencial es la ecuación de movimiento de Newton, que describe cómo varía la velocidad y posición de un objeto en función del tiempo.\n\n'
            'Las ecuaciones diferenciales pueden resolverse mediante distintos métodos analíticos y numéricos, dependiendo de su complejidad. Algunos métodos comunes incluyen la separación de variables, el método de Euler y el uso de transformadas de Laplace. En este curso, exploraremos diversas técnicas para resolver ecuaciones diferenciales y comprender su aplicación en el mundo real.';
      case 'Clasificación de ecuaciones diferenciales':
        return 'Las ecuaciones diferenciales pueden clasificarse según varios criterios: \n- Ordinarias o parciales \n- Lineales o no lineales \n- Homogéneas o no homogéneas \n- Grado de la ecuación';
      case 'Existencia y unicidad de solución':
        return 'En el caso de las Ecuaciones Diferenciales (ED’s), existen 3 casos particulares que se pueden presentar al obtener las soluciones de una ED Ordinaria de Primer Orden, sobre todo si estas soluciones no se encuentran dentro de los límites que enuncia el Teorema de Existencia y Unicidad, y es en esta circunstancia particular, cuando se presentan los casos en donde la solución de las ED’s Ordinarias de Primer Orden, pueden ser:\n\n'
            '– Una solución Única (cómo en el caso en donde la solución si está dentro de los límites del Teorema de Existencia y Unicidad)\n'
            '– Una infinidad de soluciones\n'
            '– Ninguna solución';
      case 'Integración directa':
        return 'El método de integración directa es una técnica utilizada para resolver ecuaciones diferenciales ordinarias (EDO) cuando éstas son exactas o tienen una forma que permite obtener la solución de manera inmediata. Este método se basa en integrar directamente la ecuación diferencial sin necesidad de transformaciones adicionales complejas.\n\n'
            'El método se utiliza principalmente en ecuaciones de primer orden, aunque también se puede aplicar a ecuaciones de orden superior que tengan una estructura sencilla.';
      case 'Integración por factor integrante':
        return 'El método de factor integrante es una técnica comúnmente utilizada para resolver ecuaciones diferenciales de primer orden que no son exactas o no se pueden resolver mediante métodos simples, como las ecuaciones lineales de primer orden. Este método transforma una ecuación diferencial no exacta en una exacta, de modo que luego se puede resolver por integración directa.\n\n'
            'Este método se aplica principalmente a las ecuaciones diferenciales lineales de primer orden.\n\n'
            'μ(x) = e^(∫ p(x)dx)\n\n';
      default:
        return 'Contenido no disponible';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          getTopicContent(),
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}