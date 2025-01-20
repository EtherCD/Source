let 

    pkgs = import <nixpkgs> {};
    fontFamily = "FantasqueSansM Nerd Font";
    fontSize = 18;
    theme = "gruvboxConcoctis light hard";

in

{
    programs.vscode = {
        enable = true;
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;
        mutableExtensionsDir = false;

        extensions = with pkgs.vscode-extensions; [
            teabyii.ayu
            esbenp.prettier-vscode
            jdinhlife.gruvbox
            streetsidesoftware.code-spell-checker
            oderwat.indent-rainbow
            antfu.icons-carbon
            equinusocio.vsc-material-theme-icons
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
                name = "vscode-glsl";
                publisher = "GeForceLegend";
                version = "0.3.2";
                sha256 = "sha256-wk6BnSzs4Ifx/iuVwan9FAJjnMEDMOwqF01Iw/Nvmsk=";
            }
            {
                name = "aldrico-s-gruvbox";
                publisher = "HeavenAldrico";
                version = "0.2.3";
                sha256 = "sha256-JV2FFyLbPYB5fvWYlx/wG/3vAUMG9ovqK5tLuwU7SKA=";
            }
            {
                name = "discord-vscode";
                publisher = "icrawl";
                version = "5.8.0";
                sha256 = "sha256-IU/looiu6tluAp8u6MeSNCd7B8SSMZ6CEZ64mMsTNmU=";
            }
            {
                name = "rainglow";
                publisher = "daylerees";
                version = "1.5.2";
                sha256 = "sha256-1c/xQYnuJ3BkwfqjMeT2kG1ZsXyjEOypJs0pJbouZMQ=";
            }
            {
                name = "popping-and-locking-vscode";
                publisher = "hedinne";
                version = "2.0.11";
                sha256 = "sha256-7ZH9l4jySPo1jMZnylTPK6o+XZnxUtrpYIiY9xVPuRw=";
            }
            {
                name = "laserwave";
                publisher = "jaredkent";
                version = "1.3.3";
                sha256 = "sha256-RL9dKufA8bInm5csR7NENmurFSTm25RJEC4GvN0B110=";
            }
            {
                name = "gruvbox-concoctis";
                publisher = "wheredoesyourmindgo";
                version = "10.30.27";
                sha256 = "sha256-crjpGzJqjfVWcuO4kaGqtrs4Izhvh1QlWU7uurteLl8=";
            }
            {
                name = "ubuntuvscode";
                publisher = "ThiagoLcioBittencourt";
                version = "0.0.6";
                sha256 = "sha256-IS1vUrecChj9Iz0CJ+Rfm/PSEuZn2Cwa/DQIYVPQroM=";
            }
            {
                name = "vscode-great-icons";
                publisher = "emmanuelbeziat";
                version = "2.1.112";
                sha256 = "sha256-gG6QUY3enEatllPz97O8Aj7zjrEv709xNpDaQIYIrEU=";
            }
            {
                name = "motoralfa-truco";
                publisher = "Motoralfa";
                version = "0.0.2";
                sha256 = "sha256-eiMDrppefLyYU9aJ86iAQrcfdUREkS8utiEbeFdyLZY=";
            }
        ];

        userSettings = {
            "editor.cursorBlinking" = "smooth";
            "editor.cursorStyle" = "block-outline";
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
            "editor.fontLigatures" = true;
            "editor.formatOnPaste" = true;
            "editor.formatOnSave" = true;
            "editor.minimap.enabled" = false;
            "editor.stickyScroll.enabled" = false;
            "editor.stickyScroll.scrollWithEditor" = false;
            "editor.fontFamily" = fontFamily;
            "editor.fontSize" = fontSize;
            "editor.tabSize" = 2;

            "explorer.confirmDelete" = false;
            "git.enableSmartCommit" = true;
            "javascript.updateImportsOnFileMoenabled" = "never";

            "window.titleBarStyle" = "custom";
            "window.zoomLevel" = 1.5;
            "window.commandCenter" = false;
            
            "terminal.integrated.fontFamily" = fontFamily;
            "terminal.integrated.fontSize" = fontSize;
            
            
            "workbench.iconTheme" = "vscode-great-icons";
            "workbench.panel.defaultLocation" = "right";
            "workbench.productIconTheme" = "vscode-great-icons";
            "workbench.tree.enableStickyScroll" = false;
            "workbench.layoutControl.enabled" = false;
            "workbench.activityBar.location" = "top";
            "workbench.colorTheme" = theme;

            # Code Spell Check
            "cSpell.language" = "en;ru";
            "cSpell.userWords" = [
                "commitlint"
                "fangame"
                "inthepocket"
                "preact"
                "precommit"
                "roguelike"
                "tseslint"
                "webgame"
                "wouter"
            ];

            # Prettier
            "prettier.jsxSingleQuote" = false;
            "prettier.printWidth" = 180;
            "prettier.semi" = true;
            "prettier.useTabs" = true;

            # Indent Rainbow
            "indentRainbow.colorOnWhiteSpaceOnly" = true;
            "indentRainbow.indicatorStyle" = "light";
            "indentRainbow.lightIndicatorStyleLineWidth" = 4;
            "indentRainbow.colors" = [
                "rgba(250, 189, 47, 0.05)"
                "rgba(142, 192, 124, 0.05)"
                "rgba(131, 165, 152, 0.05)"
                "rgba(211, 134, 155, 0.05)"
                "rgba(254, 128, 25, 0.05)"
            ];
            "indentRainbow.errorColor" = "rgba(251, 73, 52, 0.2)";

            # Crawl.Discord Presences
            "discord.removeRemoteRepository" = true;
            "discord.detailsIdling" = "Just fell asleep";
            "discord.detailsEditing" = "Editing {dir_name}/{file_name}";
            "discord.smallImage" = "Codding Abyss";
            "editor.mouseWheelScrollSensitivity" = 2;
            "editor.smoothScrolling" = true;
        };
    };

}