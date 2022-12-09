
class Creator{
  int id ;
  String pic = "";
  String name = "";
  String profession = "";

  Creator({
    required this.id,
    required this.pic,
    required this.name,
    required this.profession,
  });

}

List<Creator> CreatorList = [
  Creator(id: 1, pic: "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2020/05/16/906281-carry-minati.jpg",
      name: "Carry Minati", profession: "Youtuber"),
  Creator(id: 2, pic: "https://akm-img-a-in.tosshub.com/businesstoday/images/story/202001/bhuvan_bam_660_200120112916.jpg",
      name: "Bhuvan Bam", profession: "Content Creator"),
  Creator(id: 3, pic: "https://people.com/thmb/aHhCfeNNhaK9_J7xS-NjQsQKkG0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(399x0:401x2)/pewdiepie-800-1039c039da014967becc50d636143802.jpg",
      name: "Pew die Pie", profession: "Youtuber"),
  Creator(id: 4, pic: "https://codewithharry.nyc3.cdn.digitaloceanspaces.com/assets/d3c4ddaaa6d7ac69f590baeba279e806.png",
      name: "Code with Harry", profession: "Teacher"),
  Creator(id: 5, pic: "https://cdn-bgpie.nitrocdn.com/LcHjZOnOHCNDCIfQOhKmwwUGyJpjNAQJ/assets/static/optimized/rev-beddcd2/wp-content/uploads/2022/10/king-rocco-bio-735x400.jpg",
      name: "King", profession: "Singer"),
  Creator(id: 6, pic: "https://wp.missmalini.com/wp-content/uploads/2020/04/asas.png",
      name: "Harsh Beniwal", profession: "Content Creator"),
  Creator(id: 7, pic: "https://assets.leetcode.com/users/striver_79/avatar_1635765408.png",
      name: "Striver", profession: "Teacher"),
  Creator(id: 8, pic: "https://codehelp.s3.ap-south-1.amazonaws.com/OG_Image_905ac391b3_a148c80377.png",
      name: "Code by Babbar", profession: "Teacher"),
  Creator(id: 9, pic: "https://www.wikibiotv.com/wp-content/uploads/2022/11/Paradox-Rapper-Tanishq-Singh-bio.jpeg",
      name: "Paradox", profession: "Rapper"),
];

