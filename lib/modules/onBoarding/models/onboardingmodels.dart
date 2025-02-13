class OnBoardingModels{
  String imagepath;
  String title;
  String? desc;
  OnBoardingModels({
    required this.imagepath,
    required this.title,
    this.desc
});
  static List<OnBoardingModels> onboardingList = [
    OnBoardingModels(imagepath: "lib/assets/images/1onbaordevent.png",
      title: "Personalize Your Experience",
      desc: "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style."

    ),
    OnBoardingModels(imagepath: "lib/assets/images/2onboardevent.png",
      title: "Find Events That Inspire You ",
      desc: "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect,and make the most of every opportunity around you.",

    ),
    OnBoardingModels(imagepath: "lib/assets/images/3onbaordevent.png",
      title: "Effortless Event Planning",
      desc: "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters –creating an unforgettable experience for you and your guests.",

    ),
    OnBoardingModels(imagepath: "lib/assets/images/4onboard.png",
      title: "Connect with Friends & Share Moments",
      desc: "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",

    ),




  ];
}