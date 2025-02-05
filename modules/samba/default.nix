{
  services.samba-wsdd = {
	enable = true;
	openFirewall = true;
  };
  services.samba = {
    enable = true;
    #securityType = "user";
    openFirewall = true;
    settings = {
	global = {
		"workgroup" = "WORKGROUP";
		"server string" = "umbriel";
		"netbios name" = "umbriel";
		"security" = "user";

		"create mask" = "0664";
		"force create mode" = "0664";
		"directory mask" = "0775";
		"force directory mode" = "0775";
		"follow symlinks" = "yes";
		
		"hosts allow" = "192.168.1. 127.0.0.1 localhost";
      		"hosts deny" = "0.0.0.0/0";
		"guest account" = "nobody";
		"map to guest" = "bad user";
	};
	"share" = {
		"path" = "/srv/samba/shared";
		"browsable" = "yes";
		"read only" = "no";
		"guest ok" = "no";
		#"write list" = "ethercd";
		#"read list" = "ethercd";
	};
    };
  };
}
