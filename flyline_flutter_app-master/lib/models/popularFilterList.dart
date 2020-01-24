class PopularFilterListData {
  String titleTxt;
  bool isSelected;

  PopularFilterListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  static List<PopularFilterListData> popularFList = [
    PopularFilterListData(
      titleTxt: 'Free Breakfast',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Free Parking',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Pool',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Pet Friendly',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Free wifi',
      isSelected: true,
    ),
  ];

  static List<PopularFilterListData> accomodationList = [
    PopularFilterListData(
      titleTxt: 'No Stops',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'One Stop',
      isSelected: true,
    ),
    PopularFilterListData(
      titleTxt: 'Two Stops',
      isSelected: true,
    ),
  ];
}
