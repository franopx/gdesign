import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gdesign/domain/entities/preferences_manager.dart';
import 'package:gdesign/widgets/generation/card_element.dart';

import 'package:gdesign/domain/entities/card_data.dart';
import 'package:gdesign/domain/entities/database_helper.dart';

class ConceptGenerator extends StatefulWidget {
  const ConceptGenerator({super.key});

  @override
  State<StatefulWidget> createState() => _ConceptGeneratorState();
}

class _ConceptGeneratorState extends State<ConceptGenerator> {
  
  final DatabaseHelper db = DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPreferences();
  }

  // Colores para cada baraja
  Map<String, Color> _deckColors = {
    'genre': Colors.blueAccent,
    'setting': Colors.greenAccent,
    'twist': Colors.orangeAccent,
    'objective': Colors.purpleAccent,
  };

  String _username = 'Usuario';

  void _loadPreferences() async {
    Map<String, Color> loadedColors = {
      'genre' : await PreferencesManager.getCategoryColor('genre'),
      'setting' : await PreferencesManager.getCategoryColor('setting'),
      'twist' : await PreferencesManager.getCategoryColor('twist'),
      'objective' : await PreferencesManager.getCategoryColor('objective'),
    };

    String loadedUsername = await PreferencesManager.getUsername();

    setState(() {
      _deckColors = loadedColors;
      _username = loadedUsername;
    });
  }

  // Datos de ejemplo para las barajas
  final Map<String, List<String>> _deckData = {
    'genre': [
      'Plataformas', 'RPG', 'Shooter', 'Puzzle', 'Aventura', 'Estrategia', 'Deportes', 'Carreras', 
      'Lucha', 'Survival', 'Simulación', 'MMO', 'Roguelike', 'Metroidvania',
      'Souls-like', 'Battle Royale', 'Auto Chess', 'Hero Shooter', 'Walking Sim', 'Bullet Heaven',
      'Vania-like', 'Deckbuilder', 'Extract Shooter', 'Social Deduction', 'Tycoon', 'Immersive Sim',
      'Tactical RPG', 'JRPG', 'WRPG', 'ARPG', 'MOBA', 'Tower Defense', 'Rhythm', 'Idle'
    ],
    'setting': [
      'Mazmorra oscura', 'Ciudad cyberpunk', 'Isla desierta', 'Espacio profundo', 'Bosque encantado',
      'Oeste salvaje', 'Templo antiguo', 'Suburbio abandonado', 'Laboratorio secreto', 'Estación espacial',
      'Inframundo', 'Nave interestelar', 'Ciudad flotante', 'Reino de hielo', 'Jungla alienígena',
      'Desierto post-apocalíptico', 'Castillo maldito', 'Metrópolis futurista', 'Pueblo costero', 'Mina abandonada',
      'Dimensión paralela', 'Cielo sobre las nubes', 'Interior de un ser vivo', 'Planeta artificial', 'Matrix digital',
      'Castillo flotante sobre un dragón petrificado',
      'Aldea dentro de una burbuja de tiempo',
      'Bosque donde los árboles son antenas alienígenas',
      'Mazmorra en las entrañas de un dios olvidado',
      'Ciudad construida con huesos de gigante',
      'Templo que existe en dos épocas simultáneas',
      'Estación espacial gobernada por una IA infantil',
      'Planeta donde la lluvia borra recuerdos',
      'Nave generacional con cultos rivales',
      'Megaestructura que orbita un agujero blanco',
      'Colonia minera en un asteroide sentiente',
      'Realidad virtual con leyes físicas alteradas',
      'Orfanato donde los juguetes se autoreparan',
      'Metro subterráneo con estaciones imposibles',
      'Pueblo que se reinicia cada medianoche',
      'Hospital abandonado con quirófanos suspendidos',
      'Espejo que refleja universos no existentes',
      'Hotel donde cada habitación es una memoria',
      'Centro comercial convertido en templo',
      'Autopista cubierta por lava solidificada',
      'Biblioteca con los últimos 100 libros',
      'Zoológico donde los animales desarrollaron habla',
      'Ciudad sumergida en arena radiactiva',
      'Búnker con paredes que sangran',
      'Sueño colectivo de una IA moribunda',
      'Mundo donde el cielo es un océano invertido',
      'Galaxia dentro de una botella',
      'Desierto de relojes de arena gigantes',
      'Ciudad de origami que se desdobla',
      'Jardín donde las flores son estrellas caídas'
    ],
    'twist': [
      'Sin saltar', 'Solo un arma', 'Sin HUD', 'Gravedad cambiante', 'Mapa aleatorio',
      'Personaje envejece', 'Mundo se corrompe', 'Recursos limitados', 'NPCs te odian', 'Días contados',
      'Sin guardar', 'Controlas al enemigo', 'Objetos tienen memoria', 'Realidad distorsionada', 'Música afecta gameplay',
      'Sin colores', 'Tiempo va hacia atrás', 'Vidas compartidas', 'Progreso se resetea', 'Habilidades prestadas',
      'Muerte es progreso', 'Cámara giratoria', 'Sin sonido', 'Físicas absurdas', 'Todo es mentira',
          'Solo puedes moverte durante los relámpagos',
      'Tus armas son instrumentos musicales',
      'El mapa es un puzle de Tetris',
      'Los enemigos siguen tu cursor, no a tu personaje',
      'Cada nivel es un meme de internet',
      'El agua es ácido pero cura tus heridas',
      'El narrador miente intencionalmente',
      'Todos los NPCs saben que están en un juego',
      'Eres un virus dentro del sistema del juego',
      'La historia principal ocurrió hace 100 años',
      'El villano quiere ser derrotado',
      'Tu personaje sufre alzhéimer digital',
      'El arte cambia según tu conexión a internet',
      'Los colores representan tu estado emocional',
      'La pantalla se divide en 4 perspectivas',
      'El juego parece un VHS dañado',
      'Los modelos 3D se desintegran al mirarlos',
      'Sin interfaz: todo es diegético',
      'Morir te hace perder logros anteriores',
      'El juego se acelera con cada error',
      'Solo tienes 3 segundos para tomar decisiones',
      'Los controles se reasignan aleatoriamente',
      'Debes terminar el juego en una vida real',
      'El autoguardado consume recursos limitados'
    ],
    'objective': [
      'Matar al rey', 'Escapar vivo', 'Encontrar el tesoro', 'Salvar al mundo', 'Venganza',
      'Resolver el misterio', 'Derrotar a todos', 'Construir algo', 'Sobrevivir X días', 'Hacerte rico',
      'Redimirte', 'Convertirte en dios', 'Destruir evidencia', 'Liberar a alguien', 'Descubrir la verdad',
      'Robar algo', 'Proteger a alguien', 'Huir del planeta', 'Encontrar cura', 'Aprender la magia',
      'Ganar torneo', 'Cruzar el continente', 'Despertar al gigante', 'Apagar la máquina', 'Elegir destino',
      'Robar el concepto de "muerte"',
      'Sacrificar tu progreso para salvar a un NPC',
      'Derrotar al desarrollador del juego',
      'Encontrar un glitch que te permita escapar',
      'Convertirte en el jefe final de otro jugador',
      'Borrar tu propia partida guardada',
      'Demostrar que el mundo es una simulación',
      'Liberar a los NPCs de su loop de comportamiento',
      'Encontrar el botón de "apagar" del universo',
      'Convencer al sistema que eres un admin',
      'Descubrir qué había antes del juego',
      'Crear una paradoja temporal',
      'Derretir los cimientos del mundo',
      'Reescribir las leyes físicas del juego',
      'Construir un monumento con escombros de enemigos',
      'Corromper todos los archivos de sonido',
      'Plantar un árbol que crezca hasta el menú principal',
      'Dejar el juego exactamente como lo encontraste'
    ]
  };

  // Estado actual de las cartas seleccionadas
  final Map<String, String?> _currentCards = {
    'genre': null,
    'setting': null,
    'twist': null,
    'objective': null,
  };



    // Generar una carta aleatoria para una baraja específica
  void _drawCard(String deckType) {
    final random = Random();
    final availableCards = _deckData[deckType]!;
    final randomIndex = random.nextInt(availableCards.length);

    setState(() {
      _currentCards[deckType] = availableCards[randomIndex];
    });
  }

  // Generar todas las cartas aleatoriamente
  void _generateAll() {
    _deckData.forEach((deckType, _) => _drawCard(deckType));
  }

  // Reiniciar todas las cartas
  void _resetAll() {
    setState(() {
      _currentCards.updateAll((_, __) => null);
    });
  }

  Future<void> _saveConcept() async {
    // Validar que todas las cartas estén seleccionadas
    if (_currentCards.values.any((card) => card == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Genera todas las cartas primero!')),
      );
      return;
    }

    // Crear instancia de CardData
    final newConcept = CardData(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // ID único provisional
      title: 'Concepto',
      genre: _currentCards['genre']!,
      setting: _currentCards['setting']!,
      twist: _currentCards['twist']!,
      objective: _currentCards['objective']!,
      notes: '', // Asume que tienes un TextController para notas
      date: DateTime.now(),
    );

    // Guardar en la base de datos
    try {
      final id = await db.insertConcept(newConcept);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Concepto guardado (ID: $id)')),
      );
      _resetAll(); // Opcional: Limpiar el generador
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar: $e')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Hola, $_username.', style: TextStyle(fontSize: 18),),
          SizedBox(
            height: 60,
            child: _currentCards.values.every((card) => card != null) ? const Text('Presiona el botón "Guardar" para almacenar el concepto en la galería.') : const Text('Pulsa los botones de dados o el botón de "Generar" para crear un concepto.') ,
            ),
          // Lista de cartas/barajas
          Expanded(
            child: ListView(
              children: _deckData.keys.map((deckType) {
                return DeckRow(
                  deckType: deckType,
                  currentCard: _currentCards[deckType],
                  color: _deckColors[deckType]!,
                  onDrawPressed: () => _drawCard(deckType),
                );
              }).toList(),
            ),
          ),

          // Botones de acción
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _generateAll,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Generar'),
              ),
              ElevatedButton(
                onPressed: _resetAll,
                child: const Text('Borrar'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Guardar el concepto actual
                  if (_currentCards.values.every((card) => card != null)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Concepto guardado!')),
                    );
                    _saveConcept();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('¡Genera todas las cartas primero!')),
                    );
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

