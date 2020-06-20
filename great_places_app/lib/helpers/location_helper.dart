const GOOGLE_API_KEY = "AIzaSyAh502FAG29Up7ZdfWF5DLK4tAQSRoaG0c";

class LocationHelper {
  static String generateLocationPreviewImage({double lat, double long}) {
    return "https://maps.googleapis.com/maps/api/staticmap?center=&$lat,$long&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$lat,$long&key=$GOOGLE_API_KEY";
  }
}
