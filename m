Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10AAC433B4
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Apr 2021 11:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95500600D4
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Apr 2021 11:33:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235815AbhD0LeE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Apr 2021 07:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235353AbhD0LeD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Apr 2021 07:34:03 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67054C06175F
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Apr 2021 04:33:20 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id p3so48250217ybk.0
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Apr 2021 04:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lw23nfmWqVriVGK3/XB6PR3bEvWpn+m/Rvh9hTRDTtA=;
        b=dBVVKqSGsvYs0wXooeoT3TmjplzCzWtUnyuS9qS83f8+EyODqKDOOGiv5ZXk/3RrLV
         bH3UcfevrCi+nHmi2AVyA7bB0p1OrnjYfZ39Rljb4z/pVbJIP01fTTURAOCCIXbuNRRp
         Nid07/kTsDKp36Y+dYZSVw+MVNx51T7GNRWE8wOtqD0FE0Rl1L8BBkcVIeOBl1ora/7k
         yyE4/UIBbvJDU1ZYkrhZvQwAk9Vq278/B3yGpMD+GBtC135e/ZGcMHN9nKn+ctwt1THF
         WkKcfzqAHDKydJLprMnraSh/lC+bqeCArAIF/4Le5oG9fU4zeINRpV+uaFKNX2jWbvfs
         C9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lw23nfmWqVriVGK3/XB6PR3bEvWpn+m/Rvh9hTRDTtA=;
        b=Z5gfo/gZtBQEnL1pfwsmYdlnCmLEDIDWwdxQRjOrynPZ6/a/qfH3sn6KSgf5rhKpkk
         2C0/TjA692u2jRGWV0WRe9NoAiCgFrkykYpoiC2VHeEqCSCT7e/bUE0+UnGwzt4t1/8M
         Qr9yWIPFmC7KpiNckC47ieasJcsqS5PaxTwLtjM+t8qyBphGKm/lv4EmbIWNId5pgBOU
         ZHzGli1HtlbJDMCE/Jjn9My6ktl+bqtChpdfSbAg6rzBveEgsgqn7rEnCTuxmoN/mIMK
         Dc/j6O0+MQvvbztFuu++yIGO3C6YS9bSjMOJMaZfmK1f205SfIqYu1SLp8P16U0ce9TH
         jhKQ==
X-Gm-Message-State: AOAM533Y0QEx1Dnw+cmurftzDctzYi9EElz07jZ8HnggwG+OyjWBO6V1
        Rh0zfbEVVy/WpqxvY2tISvAHDMWTh5cdoOTUYHt2/g==
X-Google-Smtp-Source: ABdhPJyA/zIjInLWcP/GIfBpdeHqyt3GJkS3J7irVtSmj0CTUl2YFN3eeHr7YvBv5Ph96jI/SWrzuLo5P5BSZmIvhnE=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr31412357ybp.366.1619523199720;
 Tue, 27 Apr 2021 04:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210427102427.11066-1-colin.king@canonical.com>
In-Reply-To: <20210427102427.11066-1-colin.king@canonical.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 27 Apr 2021 13:33:09 +0200
Message-ID: <CAMpxmJX-Qkn_REScDJqHvBL6J8veFmzM5o2hmZVOu=iTAu1PUg@mail.gmail.com>
Subject: Re: [PATCH][next] gpio: sim: Fix dereference of free'd pointer config
To:     Colin King <colin.king@canonical.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Apr 27, 2021 at 12:24 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The error return of config->id dereferences the kfree'd object config.
> Fix this by using a temporary variable for the id to avoid this issue.
>
> Addresses-Coverity: ("Read from pointer aftyer free")
> Fixes: a49d14276ac4 ("gpio: sim: allocate IDA numbers earlier")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpio/gpio-sim.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 2e2e6399e453..7bba5783a043 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -751,8 +751,10 @@ gpio_sim_config_make_item(struct config_group *group, const char *name)
>
>         config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
>         if (config->id < 0) {
> +               int id = config->id;
> +
>                 kfree(config);
> -               return ERR_PTR(config->id);
> +               return ERR_PTR(id);
>         }
>
>         config_item_init_type_name(&config->item, name,
> --
> 2.30.2
>

Thanks! Can you do something like this:

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 2e2e6399e453..b21541c0b700 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -744,20 +744,22 @@ static struct config_item *
 gpio_sim_config_make_item(struct config_group *group, const char *name)
 {
  struct gpio_sim_chip_config *config;
+ int id;

  config = kzalloc(sizeof(*config), GFP_KERNEL);
  if (!config)
  return ERR_PTR(-ENOMEM);

- config->id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
- if (config->id < 0) {
+ id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
+ if (id < 0) {
  kfree(config);
- return ERR_PTR(config->id);
+ return ERR_PTR(id);
  }

  config_item_init_type_name(&config->item, name,
     &gpio_sim_chip_config_type);
  config->num_lines = 1;
+ config->id = id;
  mutex_init(&config->lock);

  return &config->item;


I think this looks more elegant without the local variable inside the if.

Bart
