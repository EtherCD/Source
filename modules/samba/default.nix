{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    shares = {
      "shared" = {
        path = "/shared"; 
        writable = true; 
        browsable = false;
        users = [ "ethercd" ];
      };
    };
  };
}