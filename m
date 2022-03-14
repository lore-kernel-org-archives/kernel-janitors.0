Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A26AC433FE
	for <kernel-janitors@archiver.kernel.org>; Mon, 14 Mar 2022 14:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239880AbiCNOjL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 14 Mar 2022 10:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239177AbiCNOjK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Mar 2022 10:39:10 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C39DEA7
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Mar 2022 07:37:58 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id q14so24351659wrc.4
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Mar 2022 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=1H47GtrR4sj+BFcR6DrzSoSzorsYvLbj5gf1Z0F31Js=;
        b=v9xUYrp1M+T4r9G7pfEP1yq8+liGfVprVCrAA3Uj1hkxLGZHEcXuoHdiTIUq/MMdrB
         xNEnbHjMOsdgvnLegS0ErwFWWeF5ZNM4ad9DL9zxPRD7PWvTiKGz4aOyOIk3Wgd30zfe
         8zlH3D9Nw+iKouIQeHRjEi5c2XJTjTu68BSXei7IHkn+r/4OvqXvFmxecNNG8W6lRsi8
         h03EmBfvD1G5tUByWA0zg9+I+TSFswSHGzL9FnYEtuQ5dsicr2MlTzDhHrnrwGrActIM
         +dPUCIsUgYup6ItUsJPZ1KpSI87oq5WZub/NOhV4U9eK5b1LXFq29J9r4x+Wn7YHY9TL
         6LSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=1H47GtrR4sj+BFcR6DrzSoSzorsYvLbj5gf1Z0F31Js=;
        b=uYRBQBiINNcfPtYPC9MwFSlJ6xn4MgRrnAqeX3yoMLT0tv/bVLOh8f+4cVyIrPmFnJ
         E4Bibd84jWxJPPM4ddtjtkZVD3nYAzCSHYNvDmugM38sdvpXaheHHLUct0PGOh5f4Gsm
         OnQPavyjOU7Eqk1WqjGaV01FPd/DO4D2Kg1aCIR0BIHlUiM+iwlMqvHnCjMvorXaoPVc
         MpiWvxlLJo0AS0D2G71b4lItoyGmoCYY2sSpfkX1z0dhOjWFR5fvd74ArcJN3x1YqWWc
         jUma2WktfJbuBFq6OccEWcb2kzQcxG4pMBF/ecAmzjZBEKn9oq+CdWCA6X5qO4sEPvbf
         CG2w==
X-Gm-Message-State: AOAM531zFaGTEiRv24w3GdaDqvp7LUK2KzUBwkju9OFWWRUwNCGKp/sn
        nVHVElN3jKJsfLtMNKplnmRfJ/mtkCQ2+g==
X-Google-Smtp-Source: ABdhPJz9pVLkc4i/cRnZ6Zq8iAS8ZTD8YEoNOpbv0lAta8I01TxZ/xsG+kVxLbC+y2/7ECGbCOuWNA==
X-Received: by 2002:adf:a58a:0:b0:1ef:603f:fb58 with SMTP id g10-20020adfa58a000000b001ef603ffb58mr16585915wrc.472.1647268676768;
        Mon, 14 Mar 2022 07:37:56 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:1c43:3164:432d:c3c3])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c3b8700b00389a6241669sm20016392wms.33.2022.03.14.07.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 07:37:56 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "fengping.yu" <fengping.yu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: mt6779-keypad - fix signedness bug in probe
In-Reply-To: <20220314140038.GA30883@kili>
References: <20220314140038.GA30883@kili>
Date:   Mon, 14 Mar 2022 15:37:55 +0100
Message-ID: <87wngw1tx8.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On lun., mars 14, 2022 at 17:00, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "irq" variable needs to be signed for the error handling to work.
>
> Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Thank you for the patch.

This was already reported and fixed at [1]

[1] https://lore.kernel.org/linux-input/20220308025054.2077162-1-lv.ruyi@zte.com.cn/

> ---
>  drivers/input/keyboard/mt6779-keypad.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
> index 5ff23250ed37..abd7e346203d 100644
> --- a/drivers/input/keyboard/mt6779-keypad.c
> +++ b/drivers/input/keyboard/mt6779-keypad.c
> @@ -91,10 +91,10 @@ static void mt6779_keypad_clk_disable(void *data)
>  static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>  {
>  	struct mt6779_keypad *keypad;
> -	unsigned int irq;
>  	u32 debounce;
>  	bool wakeup;
>  	int error;
> +	int irq;
>  
>  	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
>  	if (!keypad)
> -- 
> 2.20.1
