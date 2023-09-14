{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.ometic = {
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      onepassword-password-manager
    ];

      settings = {
	"webgl.disabled" = true;

	"app.normandy.first_run" = false;
	"app.shield.optoutstuides.enabled" = false;
	"app.update.auto" = false;

        "browser.send_pings" = false;
	"browser.contentblocking.category" = "custom";
	"browser.download.useDownloadDir" = false;
	"browser.formfill.enable" = false;
	"browser.search.suggest.enabled" = false;

	"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
	"browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
	"browser.newtabpage.activity-stream.asrouter.feeds,section.topstories" = false;
	"browser.newtabpage.activity-stream.asrouter.feeds.topsites" = false;

	"datareporting.healthreport.uploadEnabled" = false;

	"doh-rollout.disable-heuristics" = true;
	"dom.security.https_only_mode_ever_enabled" = true;
	"dom.security.https_only_mode" = true;

	"extensions.pocket.enabled" = false;

	"extensions.formautofill.addresses.enabled" = false;
	"extensions.formautofill.creditCards.enabled" = false;

	"identity.fxaccounts.enabled" = false;
	
	"layout.spellcheckDefault" = 1;
	
	"media.peerconnection.enabled" = false;
	
	"network.cookie.cookieBehavior" = 1;
	"network.cookie.lifetimePolicy" = 0;
	
	"network.proxy.socks_remote_dns" = true;

	"places.history.enabled" = false;

	"privacy.history.custom" = true;
	"privacy.donottrackheader.enabled" = true;
	"privacy.sanitize.sanitizeOnShutdown" = false;
	"privacy.trackingprotection.enabled" = true;
	"privacy.tracknigprotection.socialtracking.enabled" = true;

	"signon.management.page.breach-alerts.enabled" = false;
	"signon.rememberSignons" = false;

	"accessibility.force_disabled" = 1;

	"app.normandy.api_url" = "";
	"app.normandy.enabled" = false;
	
	"beacon.enabled" = false;

	"browser.pagethumbnails.capturing_disabled" = true;
	"browser.ping-centre.telemetry" = false;
	"browser.places.speculativeConnect.enabled" = false;
	"browser.sessionstore.privacy_level" = 2;
	"browser.ssl_override_behavior" = 1;
	"browser.tabs.creashReporting.sendReport" = false;
	"browser.uitour.enabled" = false;
	"browser.urlbar.speculativeConnect.enabled" = false;
	"browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
	"browser.urlbar.suggest.quicksuggest.sponsored" = false;
	"browser.urlbar.trimURLs" = false;
	"browser.xul.error_pages.expert_bad_cert" = true;

	"captivedetect.canonicalURL" = "";
	"datareporting.policy.dataSubmissionEnabled" = false;

	"dom.security.https_only_mode_send_http_background_request" = false;
	
	"extensions.getAddons.showPane" = false;
	"extensions.htmlaboutaddons.recommendations.enabled" = false;

	"geo.provider.use_corelocation" = false;

	"network.auth.subresource-http-auth-allow" = 1;
	"network.captive-protal-service.enabled" = false;
	"network.connectivity-service.enabled" = false;

	"network.dns.disableIPv6" = true;
	"network.dns.disablePrefetch" = true;

	"network.http.speculative-parallel-limit" = 0;
	"network.predictor.enabled" = false;
	
	"pdfjs.enableScripting" = false;

	"privacy.userContext.enabled" = true;
	"privacy.userContext.ui.enabled" = true;

	"security.cert_pinning.enforcement_level" = 2;
	"security.mixed_content.block_display_content" = true;
	"security.OCSP.require" = true;

	"security.pki.crlite_mode" = 2;
	"security.pki.shal_enforcement_level" = 1;

	"security.remote_settings.crlite_filters.enabled" = true;
	"security.ssl.require_safe_negotiation" = true;
	"security.ssl.treat_unsafe_negotiation_as_broken" = true;

	"security.tls.enable_0rtt_data" = false;

	"devtools.onboarding.telemetry.logged" = false;
	"toolkit.telemetry.enabled" = false;
	"toolkit.telemetry.unified" = false;
	"toolkit.telemetry.server" = "";

	"toolkit.converage.endpoint.base" = "";
	"toolkit.converage.opt-out" = true;
	"toolkit.telemetry.converage.opt-out" = true;

	"privacy.resistFingerprinting.block_mozAddonManager" = true;
	"privacy.resistFingerprinting.letterboxing" = true;
      };
    };
  };
}
