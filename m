Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30298C43217
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Nov 2022 13:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbiK1NoK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 28 Nov 2022 08:44:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbiK1Nn5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Nov 2022 08:43:57 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCED186FE
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Nov 2022 05:43:52 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so8373621wmi.3
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Nov 2022 05:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ChUfSWQpkOka3RMz7cPvl08M1UjHNcAjTkOzZNPTkY=;
        b=2MbRZysf3dn8Urie3wAa0AvPIYlTIWpdWJ6UamVEs4LdmH0b4ZJW+nsjnICtyUazbs
         WCplKvHRzDelinWd3fM3TRNRbYkeAipFNDylleHY/a69xENlgIUllMwtjVAB/JH2FCXx
         Udbc3pDIsmF6EARybXvCDuvy8XUy9e9dySnl9bnLwQ7DJclfgb8jLA3BDd620mOiHguV
         9p6kLvjTSVBtOfNSJ6hoM8+IKNFB5hfS+Sp+fv60ncVMyzfrvhCV4qAJMA5SbT3cekuM
         R1F1UpNuuhLC6KNTF5D6omzJpnMUAlvXf7okl+/q7OkMb83CCRb3SWKKbseW1gx7iWK5
         klLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ChUfSWQpkOka3RMz7cPvl08M1UjHNcAjTkOzZNPTkY=;
        b=sS2ghUCQVMXbIZxeRZwY3ScTFzWLatTlRxZXEkcIWzxSQ+KXj/PkjZN/Qisq+wjZR3
         8TKE5l0YdrK0LGF9P7SujIHL8nMg9+tV9QFL9alABwMvIDAtdhqOpLVQT1SwIbvjY7lK
         nClmMPF1Xc4x+rQ7jsQRXF4XST/ge/BPCvmE8w2KQR6LWb5Ux/u8CKlUg3P4uDRUwC6r
         7MNw7U3J7FhBezRlhGRWw7iPRYMs+A5QCZYUbdXqmcGqDA+SLwoNm4W/0A7sJjKYMoNr
         aTBCKHQEYYLYGX0Lk04ItQ8UubXXnJ/Ap+FXCs2N5tsRjbvglIQ0khCRMA5qPuPssHWs
         fBoQ==
X-Gm-Message-State: ANoB5pkhkDsnn+qOwXW9LdHLtXH2JyQQPVl1jlheTLeUJtZPkQi70iCP
        ZT8bXP1MNVAsm1Vy9FgwLWTXtg==
X-Google-Smtp-Source: AA0mqf7+pGd1Tmh2TNxuXqVhZz2XJErK3tFsf8y8oT9K0s/TgzJMSEVtSTshpM4fupYCXE2i5gSDjQ==
X-Received: by 2002:a05:600c:3514:b0:3cf:e0ef:1f6c with SMTP id h20-20020a05600c351400b003cfe0ef1f6cmr30175183wmq.75.1669643030449;
        Mon, 28 Nov 2022 05:43:50 -0800 (PST)
Received: from localhost ([2a01:cb19:85e6:1900:2bf7:7388:731d:c4e1])
        by smtp.gmail.com with ESMTPSA id y7-20020a1c4b07000000b003b4c979e6bcsm18187855wma.10.2022.11.28.05.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 05:43:49 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dan Carpenter <error27@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Dan Carpenter <error27@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: elants_i2c - delete some dead code
In-Reply-To: <Y33BD9xkRC9euIdO@kili>
References: <Y33BD9xkRC9euIdO@kili>
Date:   Mon, 28 Nov 2022 14:43:49 +0100
Message-ID: <87zgcbry7e.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Nov 23, 2022 at 09:43, Dan Carpenter <error27@gmail.com> wrote:

> We shuffled the error handling around so this condition is dead code
> now.  The "error" variable is always zero.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
> No Fixes tag because this does not fix a bug but if we were to assign
> a tag it would be:
>
> Fixes: a85fbd649844 ("Input: elants_i2c - properly handle the reset GPIO when power is off")
>
>  drivers/input/touchscreen/elants_i2c.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index e1308e179dd6..af1dc43e988c 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1353,8 +1353,6 @@ static int elants_i2c_power_on(struct elants_data *ts)
>  	udelay(ELAN_POWERON_DELAY_USEC);
>  
>  	gpiod_set_value_cansleep(ts->reset_gpio, 0);
> -	if (error)
> -		return error;
>  
>  	msleep(ELAN_RESET_DELAY_MSEC);
>  
> -- 
> 2.35.1
