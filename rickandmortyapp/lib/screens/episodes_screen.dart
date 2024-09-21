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
      print("Fetch a punto de realizarse");
      final episodes = await _apiService.fetchEpisodes();
      print("Fetch realizado");
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
                    child: Center(child: Text('Error al cargar los episodios')))
                : _isLoading
                    ? const Expanded(
                        child: Center(child: CircularProgressIndicator()))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _episodes.length,
                          itemBuilder: (context, index) {
                            final episode = _episodes[index];
                            return ListTile(
                              title: Text(episode.name),
                              subtitle: Text(episode.episode),
                            );
                          },
                        ),
                      )
          ],
        ));
  }
}
