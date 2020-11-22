class Profile {
  String userId;
  String fullName;
  String profilePicUrl;

  Profile({
    this.userId,
    this.fullName,
    this.profilePicUrl,
  });

  Profile.fromMap(Map<String, dynamic> map) {
    this.userId = map['userId'];
    this.fullName = map['fullName'];
    this.profilePicUrl = map['profilePicUrl'];
  }

  Map<String, dynamic> toMap() => {
        'userId': this.userId,
        'fullName': this.fullName,
        'profilePicUrl': this.profilePicUrl,
      };
}

String userId = 'w6s8d4c65sd';
List<Profile> usersExample = List<Profile>.generate(
  1,
  (index) => Profile(
      userId: userId,
      fullName: 'Test User',
      profilePicUrl:
          'https://i.pinimg.com/474x/88/9f/07/889f071a5ea4d14e457ccb4efb455c2c.jpg'),
);
