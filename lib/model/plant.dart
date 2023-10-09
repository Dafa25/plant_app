class Plant {
  final int plantId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Plant(
      {required this.plantId,
      required this.price,
      required this.category,
      required this.plantName,
      required this.size,
      required this.rating,
      required this.humidity,
      required this.temperature,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.isSelected});

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
        plantId: 0,
        price: 22,
        category: 'Indoor',
        plantName: 'Sanseviera',
        size: 'Small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        imageURL: 'assets/images/plant1.png',
        isFavorated: false,
        decription:
            'Tanaman Sansevieria, juga dikenal sebagai snake plant atau lidah mertua, adalah tanaman hias yang menawan dengan daun-daunnya yang indah dan berbentuk pedang. Selain memberikan estetika yang menarik dalam ruangan.',
        isSelected: false),
    Plant(
        plantId: 1,
        price: 11,
        category: 'Outdoor',
        plantName: 'Philodendron',
        size: 'Medium',
        rating: 4.8,
        humidity: 56,
        temperature: '19 - 22',
        imageURL: 'assets/images/plant2.png',
        isFavorated: false,
        decription:
            'Tanaman Philodendron adalah tanaman hias yang sangat populer dan sering ditemukan di berbagai rumah dan kantor. Mereka memiliki daun-daun hijau yang menarik dan beraneka ragam bentuk, seperti daun berbentuk hati atau oval.',
        isSelected: false),
    Plant(
        plantId: 2,
        price: 18,
        category: 'Indoor',
        plantName: 'Beach Daisy',
        size: 'Large',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        imageURL: 'assets/images/plant3.png',
        isFavorated: false,
        decription:
            'Tanaman Beach Daisy, juga dikenal dengan Arctotheca calendula, adalah tanaman pendek yang sering ditemukan di pantai berbagai wilayah. Tanaman ini memiliki daun hijau berbentuk seperti rosette dan bunga-bunga berwarna kuning cerah yang mekar sepanjang tahun. ',
        isSelected: false),
    Plant(
        plantId: 3,
        price: 30,
        category: 'Outdoor',
        plantName: 'Big Bluestem',
        size: 'Small',
        rating: 4.5,
        humidity: 35,
        temperature: '23 - 28',
        imageURL: 'assets/images/plant4.png',
        isFavorated: false,
        decription:
            'Tanaman Big Bluestem, juga dikenal sebagai prairie tallgrass, adalah rumput asli Amerika Utara yang dikenal dengan ciri khas batang yang tinggi dan bulir bulu berwarna biru keunguan yang mekar di musim panas dan berubah menjadi warna merah-kemerahan pada musim gugur.',
        isSelected: false),
    Plant(
        plantId: 4,
        price: 24,
        category: 'Recommended',
        plantName: 'Big Bluestem',
        size: 'Large',
        rating: 4.1,
        humidity: 66,
        temperature: '12 - 16',
        imageURL: 'assets/images/plant5.png',
        isFavorated: false,
        decription:
            'Tanaman Big Bluestem, juga dikenal sebagai prairie tallgrass, adalah rumput asli Amerika Utara yang dikenal dengan ciri khas batang yang tinggi dan bulir bulu berwarna biru keunguan yang mekar di musim panas dan berubah menjadi warna merah-kemerahan pada musim gugur.',
        isSelected: false),
    Plant(
        plantId: 5,
        price: 24,
        category: 'Outdoor',
        plantName: 'Meadow Sage',
        size: 'Medium',
        rating: 4.4,
        humidity: 36,
        temperature: '15 - 18',
        imageURL: 'assets/images/plant6.png',
        isFavorated: false,
        decription:
            'Tanaman Meadow Sage, juga dikenal sebagai Salvia pratensis, adalah tanaman berbunga yang mempesona dengan bunga-bunga biru-lavender yang indah yang tumbuh dalam rangkaian panjang di musim panas.',
        isSelected: false),
    Plant(
        plantId: 6,
        price: 19,
        category: 'Garden',
        plantName: 'Plumbago',
        size: 'Small',
        rating: 4.2,
        humidity: 46,
        temperature: '23 - 26',
        imageURL: 'assets/images/plant7.png',
        isFavorated: false,
        decription:
            'Tanaman Plumbago, atau Plumbago auriculata, adalah tanaman semak yang menampilkan bunga-bunga yang cantik berwarna biru muda atau putih di musim panas hingga awal musim gugur, Tanaman ini sering digunakan dalam taman dan lansekap sebagai tanaman hias perbatasan atau pagar hidup.',
        isSelected: false),
    Plant(
        plantId: 7,
        price: 23,
        category: 'Garden',
        plantName: 'Tritonia',
        size: 'Medium',
        rating: 4.5,
        humidity: 34,
        temperature: '21 - 24',
        imageURL: 'assets/images/plant8.png',
        isFavorated: false,
        decription:
            'Tanaman Tritonia, yang juga dikenal sebagai Montbretia, adalah tanaman berbunga yang memukau dengan bunga-bunga berbentuk terompet yang cerah dan beraneka warna, seperti merah, kuning, dan oranye.',
        isSelected: false),
    Plant(
        plantId: 8,
        price: 46,
        category: 'Recommended',
        plantName: 'Tritonia',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/plant1.png',
        isFavorated: false,
        decription:
            'Tanaman Tritonia, yang juga dikenal sebagai Montbretia, adalah tanaman berbunga yang memukau dengan bunga-bunga berbentuk terompet yang cerah dan beraneka warna, seperti merah, kuning, dan oranye.',
        isSelected: false),
  ];

  static List<Plant> getFavoritedPlants() {
    List<Plant> _travelList = Plant.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  static List<Plant> addedToCartPlants() {
    List<Plant> _selectedPlants = Plant.plantList;
    return _selectedPlants
        .where((element) => element.isSelected == true)
        .toList();
  }
}
