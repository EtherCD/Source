{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "Umbriel";
        "server string" = "smbnix";
        "netbios name" = "smbnix";
        "security" = "user";
        "passwd program" = "/run/wrappers/bin/passwd %u";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };
      share = {
        browseable = "yes";
        comment = "Samba's server for my files";
        "guest ok" = "no";
        path = "/share";
        "read only" = "no";
        "writable" = "yes";
      };
    };
  };
}