class Module {
  String name;
  String ufs;
  String hours;

  Module(this.name, this.ufs, this.hours);

  @override
  String toString() {
    return '$name: $ufs - ($hours hours)';
  }
  
}
