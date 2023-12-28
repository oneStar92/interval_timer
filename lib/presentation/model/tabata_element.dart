typedef TabataTheme = ({String title, int color});

enum TabataElement {
  preparationSeconds((title: '준비', color: 0xFFFFE812)),
  cycleCount((title: '사이클', color: 0xFF000000)),
  cycleBreakSeconds((title: '사이클 휴식', color: 0xFFFBBC04)),
  roundCount((title: '라운드', color: 0xFF000000)),
  exerciseSeconds((title: '운동', color: 0xFF34A853)),
  breakSeconds((title: '휴식', color: 0xFFEA4335));

  final TabataTheme theme;

  const TabataElement(this.theme);
}
