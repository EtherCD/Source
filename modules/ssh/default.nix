{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "ethercd" ];
      UseDns = true;
      X11Forwarding = true;
      X11DisplayOffset = 10;
      X11UseLocalhost = false;
      PermitRootLogin = "prohibit-password";
    };      
  };
}
