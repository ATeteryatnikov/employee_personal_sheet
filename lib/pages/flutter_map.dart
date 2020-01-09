import 'package:employee_personal_sheet/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class UserMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/registry');
            },
            child: Text('Выйти'),
          ),
          Flexible(
            child: new FlutterMap(
              options: new MapOptions(
                center: new LatLng(51.5, -0.09),
                zoom: 13.0,
              ),
              layers: [
                new TileLayerOptions(
                  urlTemplate: "https://api.tiles.mapbox.com/v4/"
                      "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                  additionalOptions: {
                    'accessToken':
                        'pk.eyJ1IjoiYXRldGVyeWF0bmlrb3YiLCJhIjoiY2s0bDI2dWQ0MXZuaDNrcXdlZWE3YzdtdyJ9.JXWcCsaS-GaxTc47zALhaw',
                    'id': 'mapbox.streets',
                  },
                ),
                new MarkerLayerOptions(
                  markers: [
                    new Marker(
                      width: 80.0,
                      height: 80.0,
                      point: new LatLng(51.5, -0.09),
                      builder: (ctx) => new Container(
                        child: Column(
                          children: <Widget>[
                            new Icon(Icons.build),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
