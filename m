Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11EDC43217
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Nov 2022 23:00:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbiK1XAQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 28 Nov 2022 18:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234488AbiK1W7q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Nov 2022 17:59:46 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB732E9EC
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Nov 2022 14:59:45 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id vp12so28366537ejc.8
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Nov 2022 14:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=17CpSrVEamfTq5xuUUDzrPWfetU5MF5FVrRiXoK5q/c=;
        b=OWJS6qfb0KmCBvcz8v4OR3nqEOJXxappOQVdhQRiTRXQN7EOvs7F3Liz6nYuCykLZV
         jI7r/ZnMMc84dX98wYFziBUr6UwArAQMlTp4ZlRrvXUyH5GiUORezVUWYH4fDHn3TtBR
         Z3VhGmHKbGiHoIc4qNsl821drVxde4iBElo2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17CpSrVEamfTq5xuUUDzrPWfetU5MF5FVrRiXoK5q/c=;
        b=ONrRBBwpXTnZOHsy/oIu9XGA34OaFXAgr5S8vMLrVVd0saGwGpldDDuNfYPVGKlBgG
         T8wrruJceamcWXm7XaBcrAqkJKS9A9bzg50U8xGevC2ijJ0dI+ho9tgPxXH+J40SXabx
         B8V7RwiGecsR9OWevNaoB52moyI1OTVZe+VxQ3p7TtzhtbeGe1cXpYU1mA1PZYG2Fd48
         abvZ6xor8Bqk0ticNejy24cK4RRS/49z/gKuq+iYkLNQjIMXca3akPdLh6BU87jdjM5R
         4ZKy2hFj+3ouU9joB5rJp6aVjqeUQPZL3LOwJyLT1c9iEDxBG5Zmd8RElP/VAmy68OOG
         jmpw==
X-Gm-Message-State: ANoB5plGVe75Z26xDn0ZVNSQzOtEVFu2V1v6yAX2kAbLoL7f4FX6Kv8x
        vLtXLREToVC0JSYMTnsu9iNXgg5IJ6a4ZNzY
X-Google-Smtp-Source: AA0mqf6Sai90omJ0JDywRBEWMbgUMzNcu+QSHcohKuygslMpEekT8vsSGi+pCooCsBysNIay0gCI1Q==
X-Received: by 2002:a17:906:a257:b0:7ae:3f79:4d0a with SMTP id bi23-20020a170906a25700b007ae3f794d0amr45621637ejb.120.1669676383525;
        Mon, 28 Nov 2022 14:59:43 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id b7-20020a17090630c700b0077a11b79b9bsm5377380ejb.133.2022.11.28.14.59.42
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 14:59:42 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so9543348wms.0
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Nov 2022 14:59:42 -0800 (PST)
X-Received: by 2002:a05:600c:5118:b0:3cf:8e70:f34f with SMTP id
 o24-20020a05600c511800b003cf8e70f34fmr26775070wms.93.1669676382413; Mon, 28
 Nov 2022 14:59:42 -0800 (PST)
MIME-Version: 1.0
References: <Y33BD9xkRC9euIdO@kili>
In-Reply-To: <Y33BD9xkRC9euIdO@kili>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Nov 2022 14:59:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W7692aCq1kamDJeyG6TLnVoZrfhM2=TgmjLgoaEO1GTw@mail.gmail.com>
Message-ID: <CAD=FV=W7692aCq1kamDJeyG6TLnVoZrfhM2=TgmjLgoaEO1GTw@mail.gmail.com>
Subject: Re: [PATCH] Input: elants_i2c - delete some dead code
To:     Dan Carpenter <error27@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Tue, Nov 22, 2022 at 10:43 PM Dan Carpenter <error27@gmail.com> wrote:
>
> We shuffled the error handling around so this condition is dead code
> now.  The "error" variable is always zero.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
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
>         udelay(ELAN_POWERON_DELAY_USEC);
>
>         gpiod_set_value_cansleep(ts->reset_gpio, 0);
> -       if (error)
> -               return error;

Reviewed-by: Douglas Anderson <dianders@chromium.org>
