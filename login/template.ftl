<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html class="${properties.kcHtmlClass!}"<#if realm.internationalizationEnabled> lang="${locale.currentLanguageTag}"</#if>>

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="data:image/x-icon;base64,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" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <script type="importmap">
        {
            "imports": {
                "rfc4648": "${url.resourcesCommonPath}/node_modules/rfc4648/lib/rfc4648.js"
            }
        }
    </script>
    <script src="${url.resourcesPath}/js/menu-button-links.js" type="module"></script>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <script type="module">
        import { checkCookiesAndSetTimer } from "${url.resourcesPath}/js/authChecker.js";

        checkCookiesAndSetTimer(
          "${url.ssoLoginInOtherTabsUrl?no_esc}"
        );
    </script>
</head>

<body class="${properties.kcBodyClass!}">
<div class="${properties.kcLoginClass!}">
    <div id="kc-header" class="${properties.kcHeaderClass!}">
        <div id="kc-header-wrapper"
             class="${properties.kcHeaderWrapperClass!}">${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}</div>
    </div>
    <div class="${properties.kcFormCardClass!}">
        <header class="${properties.kcFormHeaderClass!}">
            <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                <div class="${properties.kcLocaleMainClass!}" id="kc-locale">
                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                        <div id="kc-locale-dropdown" class="menu-button-links ${properties.kcLocaleDropDownClass!}">
                            <button tabindex="1" id="kc-current-locale-link" aria-label="${msg("languages")}" aria-haspopup="true" aria-expanded="false" aria-controls="language-switch1">${locale.current}</button>
                            <ul role="menu" tabindex="-1" aria-labelledby="kc-current-locale-link" aria-activedescendant="" id="language-switch1" class="${properties.kcLocaleListClass!}">
                                <#assign i = 1>
                                <#list locale.supported as l>
                                    <li class="${properties.kcLocaleListItemClass!}" role="none">
                                        <a role="menuitem" id="language-${i}" class="${properties.kcLocaleItemClass!}" href="${l.url}">${l.label}</a>
                                    </li>
                                    <#assign i++>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
            </#if>
        <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
            <#if displayRequiredFields>
                <div class="${properties.kcContentWrapperClass!}">
                    <div class="${properties.kcLabelWrapperClass!} subtitle">
                        <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                    </div>
                    <div class="col-md-10">
                        <h1 id="kc-page-title"><#nested "header"></h1>
                    </div>
                </div>
            <#else>
                <h1 id="kc-page-title"><#nested "header"></h1>
            </#if>
        <#else>
            <#if displayRequiredFields>
                <div class="${properties.kcContentWrapperClass!}">
                    <div class="${properties.kcLabelWrapperClass!} subtitle">
                        <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                    </div>
                    <div class="col-md-10">
                        <#nested "show-username">
                        <div id="kc-username" class="${properties.kcFormGroupClass!}">
                            <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                            <a id="reset-login" href="${url.loginRestartFlowUrl}" aria-label="${msg("restartLoginTooltip")}">
                                <div class="kc-login-tooltip">
                                    <i class="${properties.kcResetFlowIcon!}"></i>
                                    <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            <#else>
                <#nested "show-username">
                <div id="kc-username" class="${properties.kcFormGroupClass!}">
                    <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                    <a id="reset-login" href="${url.loginRestartFlowUrl}" aria-label="${msg("restartLoginTooltip")}">
                        <div class="kc-login-tooltip">
                            <i class="${properties.kcResetFlowIcon!}"></i>
                            <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                        </div>
                    </a>
                </div>
            </#if>
        </#if>
      </header>
      <div id="kc-content">
        <div id="kc-content-wrapper">

          <#-- App-initiated actions should not see warning messages about the need to complete the action -->
          <#-- during login.                                                                               -->
          <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div id="toast" class="alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                  <div class="pf-c-alert__icon">
                    <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_4271_39243)">
                        <path d="M7 0.875C3.61758 0.875 0.875 3.61758 0.875 7C0.875 10.3824 3.61758 13.125 7 13.125C10.3824 13.125 13.125 10.3824 13.125 7C13.125 3.61758 10.3824 0.875 7 0.875ZM7.4375 9.95312C7.4375 10.0133 7.38828 10.0625 7.32812 10.0625H6.67188C6.61172 10.0625 6.5625 10.0133 6.5625 9.95312V6.23438C6.5625 6.17422 6.61172 6.125 6.67188 6.125H7.32812C7.38828 6.125 7.4375 6.17422 7.4375 6.23438V9.95312ZM7 5.25C6.82827 5.24649 6.66476 5.17581 6.54455 5.05312C6.42434 4.93044 6.35701 4.76551 6.35701 4.59375C6.35701 4.42199 6.42434 4.25706 6.54455 4.13438C6.66476 4.01169 6.82827 3.94101 7 3.9375C7.17173 3.94101 7.33524 4.01169 7.45545 4.13438C7.57566 4.25706 7.64299 4.42199 7.64299 4.59375C7.64299 4.76551 7.57566 4.93044 7.45545 5.05312C7.33524 5.17581 7.17173 5.24649 7 5.25Z" fill="white"/>
                        </g>
                        <defs>
                        <clipPath id="clip0_4271_39243">
                        <rect width="14" height="14" fill="white"/>
                        </clipPath>
                        </defs>
                        </svg>
                      <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                      <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                      <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                      <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                  </div>
                  <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
                  <p onclick="close">x</p>
              </div>
          </#if>

          <#nested "form">

          <#if auth?has_content && auth.showTryAnotherWayLink()>
              <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                  <div class="${properties.kcFormGroupClass!}">
                      <input type="hidden" name="tryAnotherWay" value="on"/>
                      <a href="#" id="try-another-way"
                         onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                  </div>
              </form>
          </#if>

          <#nested "socialProviders">

          <#if displayInfo>
              <div id="kc-info" class="${properties.kcSignUpClass!}">
                  <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                      <#nested "info">
                  </div>
              </div>
          </#if>
        </div>
      </div>

    </div>
  </div>
</body>
</html>
</#macro>
