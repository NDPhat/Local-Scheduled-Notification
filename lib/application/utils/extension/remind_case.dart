findRemindTime(String timeRemind) {
  String numbers = timeRemind.split(" ")[0];
  switch (numbers) {
    case "5":
      return 5;
    case "10":
      return 10;
    case "15":
      return 15;
    case "20":
      return 20;
    case "25":
      return 25;
    case "30":
      return 30;

    default:
      return 5;
  }
}
