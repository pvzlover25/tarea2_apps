class Comment {
    final String username;
    final String comment;

    Comment({
        required this.username,
        required this.comment
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        username: json["username"],
        comment: json["comment"]
    );

    static List<Comment> listFromJson(List<dynamic> jsonList) {
        return jsonList.map((json) => Comment.fromJson(json)).toList();
    }

    Map<String, dynamic> toJson() => {
        "username": username,
        "comment": comment,
    };
}
