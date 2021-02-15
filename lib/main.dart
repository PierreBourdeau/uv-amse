import 'package:flutter/material.dart';
final Color theme = Colors.grey[850];
final titleTheme = TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold, fontSize: 30);
final series = [
  MediaModel(
    imageUrl:
    'https://m.media-amazon.com/images/M/MV5BNzRlNGUzMmEtYTg0Ni00N2U2LTg4YWEtNDdlNmMwYjBlZDQ0XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UY864_.jpg',
    title: 'Lupin',
    description: "Série Netflix ...",
  ),
  MediaModel(
    imageUrl:
    'https://upload.wikimedia.org/wikipedia/fr/6/67/StrangerThingslogo.png',
    title: 'Stranger Things',
    description: "Série Netflix ...",
  ),
  MediaModel(
    imageUrl:
    'https://m.media-amazon.com/images/M/MV5BNGEyOGJiNWEtMTgwMi00ODU4LTlkMjItZWI4NjFmMzgxZGY2XkEyXkFqcGdeQXVyNjcyNjcyMzQ@._V1_FMjpg_UX675_.jpg',
    title: 'The Boys',
    description: "Série Amazon ...",
  ),
];

final bds = [
  MediaModel(
    imageUrl: 'ressources/Aldebaran.jpg',
    title: 'Aldébaran',
    description: "Les mondes d'Aldébaran ...",
  ),
  MediaModel(
    imageUrl: 'ressources/le_tueur.jpg',
    title: 'Le tueur',
    description: "Bd cynique sur le monde...",
  ),
];

final musiques = [
  MediaModel(
    imageUrl: 'https://i.ytimg.com/vi/2BFgh8o_Jno/hq720.jpg?sqp=-oaymwEjCOgCEMoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLBUnZSwcwl8ZPvcEfDxQWFJ-ho6WA',
    title: 'Les lacs du Connemara',
    description: 'Provided to YouTube by Universal Music Group | Les lacs du Connemara · Michel Sardou | Les Lacs Du Connemara | 1981 Mercury Music Group',
  ),
  MediaModel(
    imageUrl: 'https://i.ytimg.com/an_webp/rygifBeBKUU/mqdefault_6s.webp?du=3000&sqp=CPbLpoEG&rs=AOn4CLAciZL9-ulYuFgeRe6M-NOX2q2MMQ',
    title: 'Les Corons',
    description: 'Les Corons est une chanson interprétée par Pierre Bachelet, hymne du bassin minier du Nord-Pas-de-Calais. Ce disque sorti en 1982 sous le label Polydor en 45 tours puis en 33 tours.'
  ),
  MediaModel(
    imageUrl: 'https://i.ytimg.com/an_webp/eBNWq-bYxWg/mqdefault_6s.webp?du=3000&sqp=CJj3poEG&rs=AOn4CLA4llxV2pwOqhalpQ4EadBeE1oqSg',
    title: 'ElGrandeToto - Mghayer (Prod. By Ysos)',
    description: 'ElGrandeToto - Mghayer 3ème extrait de l\'album "CAMELEON", disponible le 5 Mars 2021 sur toutes les plateformes digitales.',
  )
];

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'TP1 Mediateque';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}


/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold,);
  static List<Widget> _widgetOptions = <Widget>[
    ListView.builder(itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          onTap: (){
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => Page2(series[index])
              )
            );
          },
          title: Text(series[index].title),
          trailing: Image.network(series[index].imageUrl),
          subtitle: Text(series[index].description),
        ),
      );
    }, itemCount: series.length, padding: const EdgeInsets.all(8),),
    ListView.builder(itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          onTap: (){
            Navigator.of(context)
                .push(
                MaterialPageRoute(
                    builder: (context) => Page2(bds[index])
                )
            );
          },
          title: Text(bds[index].title),
          trailing: Image(image: AssetImage(bds[index].imageUrl)),
          subtitle: Text(bds[index].description),
        ),
      );
    }, itemCount: bds.length, padding: const EdgeInsets.all(8),),
    ListView.builder(itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          onTap: (){
            Navigator.of(context)
                .push(
                MaterialPageRoute(
                    builder: (context) => Page2(musiques[index])
                )
            );
          },
          title: Text(musiques[index].title),
          trailing: typeDeModel(musiques[index]),
          subtitle: Text(musiques[index].description),
        ),
      );
    }, itemCount: series.length, padding: const EdgeInsets.all(8),),
    Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget> [
          Text(
              'UV AMSE - Flutter',
              style: titleTheme),
          Expanded(child: FittedBox(
            fit: BoxFit.contain,
            child: const FlutterLogo(),
          )),
          Text('Application réalisée par : Pierre Bourdeau dans le cadre de l\'UV AMSE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
        ]
    ),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TP1 Mediateque'),
        backgroundColor: theme,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow, color: Colors.white,),
            label:'Series',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books, color: Colors.white,),
            label: 'BD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note, color: Colors.white,),
            label: 'Musique'
          ),
         BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.white,),
            label: 'A propos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[600],
        onTap: _onItemTapped,
      ),
    );
  }
}

class MediaModel {
  String imageUrl;
  String title;
  String description;

  // Constructor
  MediaModel({this.imageUrl, this.title, this.description});
}

Widget typeDeModel (MediaModel m) {
  Widget image;
  if(series.contains(m) || musiques.contains(m)) {
    image = Image.network(m.imageUrl, height: 400,);
  }
  else if (bds.contains(m) ) {
    image =Image(image: AssetImage(m.imageUrl), height: 400,);
  }
  else
    image = Icon(Icons.broken_image, size: 50);
  return image;
}

class Page2 extends StatelessWidget {
  MediaModel tab = new MediaModel();
  Page2(this.tab);

  @override
  Widget build(BuildContext context) {
    Widget vignette = typeDeModel(tab);
    return Scaffold(
      appBar: AppBar(title: Text(tab.title),backgroundColor: theme,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget> [
              Text(
                  tab.title,
                  style: titleTheme),
              vignette,
              Text(tab.description),
              RaisedButton(
                color: Colors.red[600],
                onPressed: (){
                  Navigator.of(context)
                      .pop();
                },
                padding: const EdgeInsets.all(10),
                child:
                  Text('RETOUR', style: TextStyle(color: Colors.white)),
              ),
            ]
        ),
      ),
    );
  }
}


