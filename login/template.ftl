<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html class="${properties.kcHtmlClass!}"<#if realm.internationalizationEnabled> lang="${locale.currentLanguageTag}"</#if>>

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');

        @media (max-width: 900px) {
            div.form-wraper {
                width: 80%;
                margin: 0 5%;
                padding: 5%;
            }

            .back {
                top: 5% !important;
                left: 4.5% !important;
            }
        }

        div {
            width: 100%;
        }

        body {
            padding: 0;
            margin: 0;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            height: 100vh;
            width: 100%;
            overflow: scroll;
            font-family: "Inter", sans-serif;
            background-color: #2c7742;
            color: var(--Grey-600, #4F4F4F);
            overflow: hidden;
        }

        input {
            width: 94%;
            padding: 12px 3%;
            display: flex;
            margin: 8px 0 20px;
            border: 1px solid #ccc;
            font-size: 16px;
            border-radius: 8px;
            outline: none;
            color: var(--Grey-600, #4F4F4F);
            height: 20px;
        }

        input[type="submit"] {
            background-color: #2c7742;
            color: #fff;
            font-size: 16px;
            font-style: normal;
            font-weight: 600;
            padding: 12px 0;
            width: 100%;
            border: 0;
            height: auto;
            margin-top: 20px;
            cursor: pointer;
        }

        #vsblt {
            cursor: pointer;
        }

        h1 {
            font-size: 20px;
            font-style: normal;
            font-weight: 600;
            line-height: 30px;
            margin: 25.5px 0;
        }

        .kc-logo-text {
            display: none;
        }

        .form-wraper {
            margin: 0 34%;
            border-radius: 12px;
            background-color: #fff;
            display: flex;
            width: 26%;
            padding: 3%;
            flex-direction: column;
            align-items: center;
        }

        #kc-form, #kc-reset-password-form {
            width: 100%;
        }

        .red-span {
            color: red;
        }

        .logo {
            width: 100%;
            display: flex;
            justify-content: center;
            margin-bottom: 32px;
        }

        .logo svg {
            width: 200px;
            height: auto;
        }

        .password-wraper {
            width: 94%;
            padding: 12px 3%;
            display: flex;
            margin: 8px 0 20px;
            border: 1px solid #ccc;
            font-size: 16px;
            border-radius: 8px;
            height: 20px;
        }

        .password-wraper input {
            height: auto;
            border: 0;
            padding: 0;
            margin: 0;
            border-radius: 0;
        }

        #input-error {
            color: red;
            font-size: 16px;
            line-height: 1.5;
        }

        .forgot {
            margin-top: 32px;
            margin-bottom: 32px;
        }

        .forgot span a {
            color:#2c7742;
            font-weight: 700;
            text-decoration: none;
        }

        .back {
            position: absolute;
            top: 12%;
            left: 8%;
        }

        .back span a svg {
            width: 40px;
            height: auto;
        }

        #toast {
            position: absolute;
            top: 30px;
            right: 30px;
            background-color: #2F71BF;
            color: #fff;
            padding: 10px 20px;
            height: 48px;
            width: 400px;
            border-radius: 2px;
            display: none; /*sem toast*/
            flex-direction: row;
            align-items: center;
            justify-content: center;
            box-shadow: 4px 4px 4px rgba(24, 24, 24, 0.4);
        }

        #toast svg {
            width: 24px;
            height: auto;
            margin-right: 10px;
        }

        #toast p {
            font-size: 20px;
            cursor: pointer;
            font-weight: 600;
            line-height: 24px;
            margin-left: 10px;
        }
    </style>
    

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
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
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
                <!-- <div class="${properties.kcLocaleMainClass!}" id="kc-locale">
                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                        <div id="kc-locale-dropdown" class="${properties.kcLocaleDropDownClass!}">
                            <a href="#" id="kc-current-locale-link">${locale.current}</a>
                            <ul class="${properties.kcLocaleListClass!}">
                                <#list locale.supported as l>
                                    <li class="${properties.kcLocaleListItemClass!}">
                                        <a class="${properties.kcLocaleItemClass!}" href="${l.url}">${l.label}</a>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div> -->
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
                            <a id="reset-login" href="${url.loginRestartFlowUrl}">
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
                    <a id="reset-login" href="${url.loginRestartFlowUrl}">
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
              <div class="alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                  <div class="pf-c-alert__icon">
                      <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                      <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                      <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                      <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                  </div>
                      <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
              </div>
          </#if>

          <#nested "form">

            <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <input type="hidden" name="tryAnotherWay" value="on"/>
                        <a href="#" id="try-another-way"
                           onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                    </div>
                </form>
            </#if>

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
