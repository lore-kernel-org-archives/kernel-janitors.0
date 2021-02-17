Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12A1C433DB
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Feb 2021 20:06:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B318264E62
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Feb 2021 20:06:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhBQUGV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 17 Feb 2021 15:06:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51779 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232844AbhBQUGU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Feb 2021 15:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613592294;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vHoTmntEev68EJcmebE3piRT4pPjx5R2AdcGSR/9YdY=;
        b=J1nK8daiMEY/r56eXbg6QXcdKtaR8gZ9as2GKUE0nQZz4MYUlS746Etfj92zKBh706K6Yu
        sSUO7on3mEZCE1Ff53/x7xLDzjDj/2tzj8JTh8tY+lVmCBaV6XiNUcgbDdtliGNkeH0dZt
        u/NFArP/naZPh3xWeug4DVttfnUWmIw=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-AUIeX2pdMC6euHWe_vkl6A-1; Wed, 17 Feb 2021 15:04:50 -0500
X-MC-Unique: AUIeX2pdMC6euHWe_vkl6A-1
Received: by mail-pg1-f200.google.com with SMTP id v16so12538014pgl.23
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Feb 2021 12:04:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vHoTmntEev68EJcmebE3piRT4pPjx5R2AdcGSR/9YdY=;
        b=GxrbtcVMNLS6c7JWngvvMR5YHiVVQPTiOACUhOW79YsQtdHX3lQsvzx/KaKjK8hIFx
         FGQqEmA+cZgOTIO9qkEB50RVYsp3qHcS9aRxAJfQIFEJJRezBiX6/Inng1qdwRRhj99Y
         OeZSLxmTizYBfpPBMEwUXTrJUKOqOZ4y5L2VZIkm0mXSQq01eAafbpeeKUkFxT9BgQpd
         HdZr7TNXTZE66Zp0fUW0P8/NwhlDeeXPtVXsGCZMH5UCgARZ+hpqToj5XSkd8Op0uC6s
         e5Z3+qf53JO8wH7/w9G60UojlYurMYnvJdjU7cPir+srtzXVdHrFncao6fn790xVeyVi
         u6WQ==
X-Gm-Message-State: AOAM532F9cNb7RIG1Q5QNNxaYzrumYtKrT4e0L5yQfNV6LiO1UpNwRzW
        RXjz+chQbnXgK0d9QrO8Jr+bMlxa1JmvOEs7b5XeBdUQVFeeQ+tRB2oTU1/hvJrHgnhgb9zqExu
        Nqw5xqRN782j/dZeN4X3nKTTSEqOnreZQntPjjhjLKD6Q
X-Received: by 2002:a17:902:d4d0:b029:e3:480a:cae3 with SMTP id o16-20020a170902d4d0b02900e3480acae3mr659681plg.41.1613592289316;
        Wed, 17 Feb 2021 12:04:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHK4y3zAv0/eqFBkTaoINYheQA70AODu58g83uoMfRBuIwAAnwdz1Gnbi35DShRThTbkZayF790UdUG4DSrlY=
X-Received: by 2002:a17:902:d4d0:b029:e3:480a:cae3 with SMTP id
 o16-20020a170902d4d0b02900e3480acae3mr659658plg.41.1613592289030; Wed, 17 Feb
 2021 12:04:49 -0800 (PST)
MIME-Version: 1.0
References: <20210215163921.84283-1-colin.king@canonical.com>
In-Reply-To: <20210215163921.84283-1-colin.king@canonical.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 17 Feb 2021 21:04:38 +0100
Message-ID: <CAO-hwJ+P=jH3ByHdab=qmrOWupnq-fiA0UR8mdHF1pQAuEqbAw@mail.gmail.com>
Subject: Re: [PATCH][next] HID: playstation: fix array size comparison (off-by-one)
To:     Colin King <colin.king@canonical.com>
Cc:     Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Feb 15, 2021 at 5:39 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The comparison of value with the array size ps_gamepad_hat_mapping
> appears to be off-by-one. Fix this by using >= rather than > for the
> size comparison.
>
> Addresses-Coverity: ("Out-of-bounds read")
> Fixes: bc2e15a9a022 ("HID: playstation: initial DualSense USB support.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Good catch.

Applied to for-5.12/playstation-v2

Cheers,
Benjamin

>  drivers/hid/hid-playstation.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index 408b651174cf..568a3a067c88 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -1064,7 +1064,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
>         input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
>
>         value = ds_report->buttons[0] & DS_BUTTONS0_HAT_SWITCH;
> -       if (value > ARRAY_SIZE(ps_gamepad_hat_mapping))
> +       if (value >= ARRAY_SIZE(ps_gamepad_hat_mapping))
>                 value = 8; /* center */
>         input_report_abs(ds->gamepad, ABS_HAT0X, ps_gamepad_hat_mapping[value].x);
>         input_report_abs(ds->gamepad, ABS_HAT0Y, ps_gamepad_hat_mapping[value].y);
> --
> 2.30.0
>

