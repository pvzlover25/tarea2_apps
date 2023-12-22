class detailsLocation {
    final String sector;
    final String description;
    final String photo1;
    final String photo2;
    final String username;
    final DateTime registrationDate;
    final int stillThere;
    final int notStillThere;

    detailsLocation({
        required this.sector,
        required this.description,
        required this.photo1,
        required this.photo2,
        required this.username,
        required this.registrationDate,
        required this.stillThere,
        required this.notStillThere,
    });

    factory detailsLocation.fromJson(Map<String, dynamic> json) => detailsLocation(
        sector: json["sector"],
        description: json["description"],
        photo1: json["photo1"],
        photo2: json["photo2"],
        username: json["username"],
        registrationDate: DateTime.parse(json["registration_date"]),
        stillThere: json["still_there"],
        notStillThere: json["not_still_there"]
    );

    static List<detailsLocation> listFromJson(List<dynamic> jsonList) {
        return jsonList.map((json) => detailsLocation.fromJson(json)).toList();
    }

    Map<String, dynamic> toJson() => {
        "sector": sector,
        "description": description,
        "photo1": photo1,
        "photo2": photo2,
        "username": username,
        "registration_date": "${registrationDate.year.toString().padLeft(4, '0')}-${registrationDate.month.toString().padLeft(2, '0')}-${registrationDate.day.toString().padLeft(2, '0')}",
        "still_there": stillThere,
        "not_still_there": notStillThere
    };
}
