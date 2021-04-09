Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76ECC433ED
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 13:12:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A43586115C
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 13:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbhDINMq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Apr 2021 09:12:46 -0400
Received: from mail1.perex.cz ([77.48.224.245]:39784 "EHLO mail1.perex.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhDINMq (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 09:12:46 -0400
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4E4DDA003F;
        Fri,  9 Apr 2021 15:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4E4DDA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1617973949; bh=1oY7CphpfuhLCfc/L/XAyPe1KLJMszk6TMbYLW7dFhQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=VMLOxPivM5kyATp++ATCGz8nScrb9VErLdnBaBEanBbiwxQXnFjyhMClCK/RWwMKE
         hOqvf6UW+Cy4yCjt8RGic/vBM1hZytCnBq0BYZIkTD+V3a2+sxeAjx0OX222JrFIh0
         d0KK6zPxmUlu+GJ8iIhgnKT9lmVEnxiUFMW85q04=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Fri,  9 Apr 2021 15:12:25 +0200 (CEST)
Subject: Re: [PATCH 1/2 v2] ALSA: control - double free in snd_ctl_led_init()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
References: <YHBJ4frGxErWB182@mwanda>
From:   Jaroslav Kysela <perex@perex.cz>
Message-ID: <001a23ae-12de-5d7a-1095-4ab908841cd0@perex.cz>
Date:   Fri, 9 Apr 2021 15:12:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YHBJ4frGxErWB182@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dne 09. 04. 21 v 14:34 Dan Carpenter napsal(a):
> "group - 1" was intended here instead of "group".  The current error
> handling will double free the first item in the array and leak the last
> item.
> 
> Fixes: cb17fe0045aa ("ALSA: control - add sysfs support to the LED trigger module")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

> ---
> v2: The first patch wasn't right.  It fixed the leak but left the double
> free.
> 
>  sound/core/control_led.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index d756a52e58db..93b201063c7d 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -734,7 +734,7 @@ static int __init snd_ctl_led_init(void)
>  		if (device_add(&led->dev)) {
>  			put_device(&led->dev);
>  			for (; group > 0; group--) {
> -				led = &snd_ctl_leds[group];
> +				led = &snd_ctl_leds[group - 1];
>  				device_del(&led->dev);
>  			}
>  			device_del(&snd_ctl_led_dev);
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
