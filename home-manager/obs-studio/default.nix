{
    programs.obs-studio = {
        enable = true;
    };

    home.file.".config/obs-studio/basic/profiles/Default/basic.ini".text = ''
        [Video]
        BaseCX=1920
        BaseCY=1080
        OutputCX=1920
        OutputCY=1080

        [Output]
        RecFormat=mp4
        RecPath=~/Videos
    '';
}