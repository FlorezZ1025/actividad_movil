import 'package:flutter/material.dart';
import 'package:rickandmortyapp/models/episode.dart';
import 'package:rickandmortyapp/services/api_service.dart';

class EpisodeScreen extends StatefulWidget {
  @override
  _EpisodeScreenState createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  final ApiService _apiService = ApiService();
  List<Episode> _episodes = [];
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchEpisodes();
  }

  Future<void> _fetchEpisodes() async {
    try {
      final episodes = await _apiService.fetchEpisodes();
      setState(() {
        _episodes = episodes;
        _hasError = false;
      });
    } catch (e) {
      setState(() {
        _episodes = [];
        _hasError = false;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Episodios',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            _hasError
                ? const Expanded(
                    child: Center(
                        child: Text('Error al cargar los episodios',
                            style: TextStyle(
                                color: Color.fromARGB(255, 188, 17, 5),
                                fontWeight: FontWeight.bold,
                                fontSize: 24))))
                : _isLoading
                    ? const Expanded(
                        child: Center(child: CircularProgressIndicator()))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _episodes.length,
                          itemBuilder: (context, index) {
                            final episode = _episodes[index];
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: Card(
                                  color:const Color.fromARGB(255, 142, 235, 145),
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(16.0),
                                    title: Text(episode.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Fecha de emisión: ${episode.airDate}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                        Text('Episodio: ${episode.episode}', style: const TextStyle(fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  ),
                                ));
                          },
                        ),
                      )
          ],
        ));
  }
}
