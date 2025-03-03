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
    'Integración por factor integral'
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
        return 'El teorema de existencia y unicidad establece condiciones bajo las cuales una ecuación diferencial tiene una solución única. Se basa en el teorema de Picard-Lindelöf.';
      case 'Integración directa':
        return 'El método de integración directa se usa en ecuaciones diferenciales separables. Se reescribe la ecuación en términos diferenciales y se integra directamente ambos lados.';
      case 'Integración por factor integral':
        return 'El método del factor integrante es una técnica que permite resolver ecuaciones diferenciales lineales de primer orden multiplicando por una función especial llamada factor integrante, que facilita su solución.';
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            getTopicContent(),
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}