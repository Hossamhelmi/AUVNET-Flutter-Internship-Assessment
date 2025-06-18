class ResturantMoldel {
  String? name;
  String? time;

  ResturantMoldel({
    this.time,
    this.name,
   
  });

  ResturantMoldel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    name = json['name'];
    
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'name': name,

    };
  }
}
