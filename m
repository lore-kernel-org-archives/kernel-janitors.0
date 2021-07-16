Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A89C12002
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Jul 2021 08:43:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA0446109E
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Jul 2021 08:43:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238210AbhGPIqX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 16 Jul 2021 04:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237570AbhGPIqX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Jul 2021 04:46:23 -0400
X-Greylist: delayed 434 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 16 Jul 2021 01:43:28 PDT
Received: from hera.aquilenet.fr (hera.aquilenet.fr [IPv6:2a0c:e300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4171C061760
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Jul 2021 01:43:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by hera.aquilenet.fr (Postfix) with ESMTP id B0AFA18F;
        Fri, 16 Jul 2021 10:36:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
        by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1XaCM_XW938B; Fri, 16 Jul 2021 10:36:11 +0200 (CEST)
Received: from begin (unknown [90.96.30.46])
        by hera.aquilenet.fr (Postfix) with ESMTPSA id F103D164;
        Fri, 16 Jul 2021 10:36:10 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94.2)
        (envelope-from <samuel.thibault@ens-lyon.org>)
        id 1m4JK4-0001iR-TD; Fri, 16 Jul 2021 10:35:52 +0200
Date:   Fri, 16 Jul 2021 10:35:47 +0200
From:   Samuel Thibault <samuel.thibault@ens-lyon.org>
To:     Colin King <colin.king@canonical.com>
Cc:     array@sonata.ens-lyon.org, initializers@sonata.ens-lyon.org,
        Chris Brannon <chris@the-brannons.com>,
        Kirk Reiser <kirk@reisers.ca>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        speakup@linux-speakup.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] speakup: use C99 syntax for array initializers
Message-ID: <20210716083547.sm5uzd2wsklb65f5@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Colin King <colin.king@canonical.com>, array@sonata.ens-lyon.org,
        initializers@sonata.ens-lyon.org,
        Chris Brannon <chris@the-brannons.com>,
        Kirk Reiser <kirk@reisers.ca>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        speakup@linux-speakup.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210715163122.62220-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715163122.62220-1-colin.king@canonical.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: B0AFA18F
X-Spamd-Result: default: False [-2.50 / 15.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         HAS_ORG_HEADER(0.00)[];
         RCVD_COUNT_THREE(0.00)[3];
         RCPT_COUNT_SEVEN(0.00)[9];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MID_RHS_NOT_FQDN(0.50)[];
         BAYES_HAM(-3.00)[100.00%]
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Colin King, le jeu. 15 juil. 2021 17:31:22 +0100, a ecrit:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The older obsolete array initializer syntax is currently being used
> for some of the array elements. Fix this by using the preferred C99
> array initializers syntax.
> 
> Fixes: 5b5140bf5182 ("speakup: Separate out translations for bright colors names")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  drivers/accessibility/speakup/i18n.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/accessibility/speakup/i18n.c b/drivers/accessibility/speakup/i18n.c
> index bc7b47d1876f..d62079b1661f 100644
> --- a/drivers/accessibility/speakup/i18n.c
> +++ b/drivers/accessibility/speakup/i18n.c
> @@ -90,13 +90,13 @@ static char *speakup_default_msgs[MSG_LAST_INDEX] = {
>  	[MSG_COLOR_YELLOW] = "yellow",
>  	[MSG_COLOR_WHITE] = "white",
>  	[MSG_COLOR_GREY] = "grey",
> -	[MSG_COLOR_BRIGHTBLUE] "bright blue",
> -	[MSG_COLOR_BRIGHTGREEN] "bright green",
> -	[MSG_COLOR_BRIGHTCYAN] "bright cyan",
> -	[MSG_COLOR_BRIGHTRED] "bright red",
> -	[MSG_COLOR_BRIGHTMAGENTA] "bright magenta",
> -	[MSG_COLOR_BRIGHTYELLOW] "bright yellow",
> -	[MSG_COLOR_BRIGHTWHITE] "bright white",
> +	[MSG_COLOR_BRIGHTBLUE] = "bright blue",
> +	[MSG_COLOR_BRIGHTGREEN] = "bright green",
> +	[MSG_COLOR_BRIGHTCYAN] = "bright cyan",
> +	[MSG_COLOR_BRIGHTRED] = "bright red",
> +	[MSG_COLOR_BRIGHTMAGENTA] = "bright magenta",
> +	[MSG_COLOR_BRIGHTYELLOW] = "bright yellow",
> +	[MSG_COLOR_BRIGHTWHITE] = "bright white",
>  
>  	/* Names of key states. */
>  	[MSG_STATE_DOUBLE] = "double",
> -- 
> 2.31.1
> 
