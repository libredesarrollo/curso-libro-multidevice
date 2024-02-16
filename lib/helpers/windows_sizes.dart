enum WindowsBreakpoint { sm, /*md,*/ lg }

int getSize(WindowsBreakpoint windowsSize) {
  switch (windowsSize) {
    case WindowsBreakpoint.sm:
      return 576;
    // case WindowsSize.md:
    //   return 720;
    case WindowsBreakpoint.lg:
      return 992;
  }
}

WindowsBreakpoint getBreakpoint(double screenSizeWidth) {
  if (screenSizeWidth <= 576.0) {
    return WindowsBreakpoint.sm;
  }

  return WindowsBreakpoint.lg;
}
