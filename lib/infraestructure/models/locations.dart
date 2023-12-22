class Location {
    final int idLocation;
    final String sector;
    final String username;
    final DateTime registrationDate;

    Location({
        required this.idLocation,
        required this.sector,
        required this.username,
        required this.registrationDate,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        idLocation: json["id_location"],
        sector: json["sector"],
        username: json["username"],
        registrationDate: DateTime.parse(json["registration_date"]),
    );

    static List<Location> listFromJson(List<dynamic> jsonList) {
        return jsonList.map((json) => Location.fromJson(json)).toList();
    }

    Map<String, dynamic> toJson() => {
        "id_location": idLocation,
        "sector": sector,
        "username": username,
        "registration_date": "${registrationDate.year.toString().padLeft(4, '0')}-${registrationDate.month.toString().padLeft(2, '0')}-${registrationDate.day.toString().padLeft(2, '0')}",
    };
}
