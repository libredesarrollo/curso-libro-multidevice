enum WindowsSize { sm, md, lg }

int getSize(WindowsSize windowsSize) {
  switch (windowsSize) {
    case WindowsSize.sm:
      return 576;
    case WindowsSize.md:
      return 720;
    case WindowsSize.lg:
      return 992;
  }
}
