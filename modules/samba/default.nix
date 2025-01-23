{
  enable = true;
  shares = {
    "shared" = {
      path = "/shared";
      writable = true;
      browsable = false;
      users = [ "ethercd" ];
    };
  };
}