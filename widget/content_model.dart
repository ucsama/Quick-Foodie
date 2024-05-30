class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent(
      {required this.description, required this.image, required this.title});
}
  List<UnboardingContent> contents=[
    UnboardingContent(description: 'Pick your food from our menu\n            More than 35 times',
        image: "images/screen1.png",
        title: 'Select From Our\n    Best Menu'),
    UnboardingContent(description: '       Cash on delivery &\n   card payment available',
        image: "images/screen2.png",
        title: 'Easy Online Payment'),
    UnboardingContent(description: 'Deliver you food at your\n            doorstep',
        image: "images/screen3.png",
        title: 'Quick delivery at your dorstep')
  ];
