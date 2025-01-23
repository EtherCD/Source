{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "umbriel";
        "server string" = "smbnix";
        "netbios name" = "smbnix";
        "security" = "user";
        #"use sendfile" = "yes";
        #"max protocol" = "smb2";
        # note: localhost is the ipv6 localhost ::1
        "hosts allow" = "192.168.0. 127.0.0.1 localhost";
        "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };
      "public" = {
        "path" = "/shares/public";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "writable" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "ethercd";
        "force group" = "umbriel";
        "write list" = "ethercd";
      };
      "private" = {
        "path" = "/shares/private";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "writable" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "ethercd";
        "force group" = "umbriel";
        "write list" = "ethercd";
      };
    };
  };
}