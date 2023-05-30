class Menber {
  String? fullName;
  String? relationship;
  String? sex;
  String? birthday;
  String? CCCD;
  String? nationality;
  String? typeResidence;
  String? img;
  String? phone;
  String? email;
  String? facebook;
  String? instagram;
  String? linkedin;
  String? tiktok;

  Menber(
      {this.fullName,
      this.relationship,
      this.sex,
      this.birthday,
      this.CCCD,
      this.nationality,
      this.typeResidence,
      this.img,
      this.phone,
      this.email,
      this.facebook,
      this.instagram,
      this.linkedin,
      this.tiktok});

  @override
  String toString() {
    return 'Menber{fullName: $fullName, relationship: $relationship, sex: $sex, birthday: $birthday, CCCD: $CCCD, nationality: $nationality, typeResidence: $typeResidence, img: $img, phone: $phone, email: $email, facebook: $facebook, instagram: $instagram, linkedin: $linkedin, tiktok: $tiktok}';
  }
}
