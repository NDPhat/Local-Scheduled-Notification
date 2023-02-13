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

findRepeatTime(String timeRepeat) {
  switch (timeRepeat) {
    case "None":
      return 0;
    case "Repeat 1 hour":
      return 1;
    case "Repeat 2 hour":
      return 2;
    case "Repeat Daily":
      return 24;
    case "Repeat Monthly":
      return 0;

    default:
      return 0;
  }
}
