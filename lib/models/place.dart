import 'dart:io';

class PlaceLocation {
  final double lalitude;
  final double longitude;
  String address = '';

  PlaceLocation(this.lalitude, this.longitude, this.address);
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place(this.id, this.title, this.location, this.image);
}
