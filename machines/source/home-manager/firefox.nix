{ pkgs, ... }: {
    programs.firefox = {
		enable = true;
        profiles = {
            default = {
                id = 0;
                name = "EtherCD";
                isDefault = true;
                settings = {
                    "browser.startup.homepage" = "https://google.com";
                    "browser.search.defaultenginename" = "Google";
                    "browser.search.order.1" = "Google";

                    "app.shield.optoutstudies.enabled" = false;
                    "browser.discovery.enabled" = false;
                    "browser.newtabpage.activity-stream.feeds.telemetry" = false;
                    "browser.newtabpage.activity-stream.telemetry" = false;
                    "browser.ping-centre.telemetry" = false;
                    "datareporting.healthreport.service.enabled" = false;
                    "datareporting.healthreport.uploadEnabled" = false;
                    "datareporting.policy.dataSubmissionEnabled" = false;
                    "datareporting.sessions.current.clean" = true;
                    "devtools.onboarding.telemetry.logged" = false;
                    "toolkit.telemetry.archive.enabled" = false;
                    "toolkit.telemetry.bhrPing.enabled" = false;
                    "toolkit.telemetry.enabled" = false;
                    "toolkit.telemetry.firstShutdownPing.enabled" = false;
                    "toolkit.telemetry.hybridContent.enabled" = false;
                    "toolkit.telemetry.newProfilePing.enabled" = false;
                    "toolkit.telemetry.prompted" = 2;
                    "toolkit.telemetry.rejected" = true;
                    "toolkit.telemetry.reportingpolicy.firstRun" = false;
                    "toolkit.telemetry.server" = "";
                    "toolkit.telemetry.shutdownPingSender.enabled" = false;
                    "toolkit.telemetry.unified" = false;
                    "toolkit.telemetry.unifiedIsOptIn" = false;
                    "toolkit.telemetry.updatePing.enabled" = false;
                };
                extensions = with pkgs.nur.repos.rycee.firefox-addons; [
                    ublock-origin
                    adblocker-ultimate
                    darkreader
                    gruvbox-dark-theme
                    clearurls
                    youtube-shorts-block
                ];
            };
        };
    };
}