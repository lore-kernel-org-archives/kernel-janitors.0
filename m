Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B62C433ED
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Apr 2021 18:01:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BE8D610A5
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Apr 2021 18:01:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235279AbhDBSBX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Apr 2021 14:01:23 -0400
Received: from mail1.perex.cz ([77.48.224.245]:55478 "EHLO mail1.perex.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235111AbhDBSBV (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Apr 2021 14:01:21 -0400
X-Greylist: delayed 507 seconds by postgrey-1.27 at vger.kernel.org; Fri, 02 Apr 2021 14:01:20 EDT
Received: from mail1.perex.cz (localhost [127.0.0.1])
        by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 88DD9A003F;
        Fri,  2 Apr 2021 19:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 88DD9A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
        t=1617385969; bh=hmdcuQjKCB8a38gz7Nli+mM4SdKS5+dTRB3Z0DNd5Kw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Kp0rqUhBND6xL6fr6ykEzNIz8ZPSzKYyXWrJiN99xWmhHmW0ThYR0AxJxZZOb03FX
         LEA00oGHm0Ghtu5RYWolMAR5+BPnH1UZPBEZbKhiGkri14XKdEYeAB4UE9EmO+682t
         lojSpD3MzO7Q/ThDIwgZR1y3tDXCqsTGAA9NTkFg=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: perex)
        by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
        Fri,  2 Apr 2021 19:52:43 +0200 (CEST)
Subject: Re: [PATCH 2/2] ALSA: control - off by one in store_mode()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
References: <YGcDOtrimR46vr0k@mwanda>
From:   Jaroslav Kysela <perex@perex.cz>
Message-ID: <70b1e440-030c-9cbf-e193-79f2955a5331@perex.cz>
Date:   Fri, 2 Apr 2021 19:52:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YGcDOtrimR46vr0k@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dne 02. 04. 21 v 13:42 Dan Carpenter napsal(a):
> If count is 16 then this will put the NUL terminator one element beyond
> the end of the array.
> 
> Fixes: cb17fe0045aa ("ALSA: control - add sysfs support to the LED trigger module")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

No idea why I added + 1... Thanks for your correction.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

> ---
>  sound/core/control_led.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index 202b475d0bf3..ab5a455723c8 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -391,7 +391,7 @@ static ssize_t store_mode(struct device *dev, struct device_attribute *attr,
>  {
>  	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
>  	char _buf[16];
> -	size_t l = min(count, sizeof(_buf) - 1) + 1;
> +	size_t l = min(count, sizeof(_buf) - 1);
>  	enum snd_ctl_led_mode mode;
>  
>  	memcpy(_buf, buf, l);
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
