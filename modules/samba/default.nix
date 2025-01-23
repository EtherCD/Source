{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      server string = ${config.networking.hostName}
      netbios name = ${config.networking.hostName}
      workgroup = WORKGROUP
      security = user

      create mask = 0664
      force create mode = 0664
      directory mask = 0775
      force directory mode = 0775
      follow symlinks = yes

      # :NOTE| localhost is the ipv6 localhost ::1
      hosts allow = 192.168.0.0/16 localhost
      hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
    '';
    shares = {
      "shared" = {
        path = "/shared"; 
        writable = true;
        "read only" = "no";
        "guest ok" = "no";
        "force user" = "ethercd";
        "force group" = "samba";
        "write list" = "ethercd";
      };
    };
  };
}