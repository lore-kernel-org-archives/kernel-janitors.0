Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4953CC48BE8
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 13:53:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B2E8613E2
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 13:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234212AbhFRNzg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Jun 2021 09:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46802 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234119AbhFRNzf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Jun 2021 09:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624024406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P/mlf3E91IxDGki9DJUtyEv6dP68LA3nvEkze77PADI=;
        b=di5hUEj69Zz+1cKS1hFmX5mdkVUNu3lFty+ge8nffdnxgjVjZVh+ay9iRSBqjqYcJlQs/+
        lCV3cFR8wceFmhJzvj081Im68i3lduvWGlQaDIFIpfPmO8k0vOeRqdid98MDEcm6J2+HVs
        7V3N7kzaoOetronCGhddjSTXNyIIHOc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-8YvWFAbWOYKqlzq6fvvm0g-1; Fri, 18 Jun 2021 09:53:24 -0400
X-MC-Unique: 8YvWFAbWOYKqlzq6fvvm0g-1
Received: by mail-ej1-f72.google.com with SMTP id n8-20020a1709067b48b02904171dc68f87so3969988ejo.21
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Jun 2021 06:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P/mlf3E91IxDGki9DJUtyEv6dP68LA3nvEkze77PADI=;
        b=ErYtEmhcQedpZme2Z3kWfaG8yQ05/kiet5Cp5+jHo6UCzSdViqbIHmCuhnNailo1JV
         QHR5nB2iEiNQdfxoGuG9RRKe7zvMBXzo0H/14ZNGsTYxWwI18Kfroq9KwTY30MLu8/IW
         K0QMssTTYbfi7CFtk9IBZC206UhcREFk6hNYLKf//DTpEtYjCBii9TO31Q6mLD7WaTII
         aczzman8vyLqKgOeP9whYUMxLfOxQdAhqU1uNY6h+7S0z+MXCd1QEXP2iHULVmzwYV4R
         237uKo9CPwhxYzNPlCiZDbe1CKO5vTkCGZ3nl8dLnY5uwARjvVSqOoBsfJv4IrAO0jhC
         R5MA==
X-Gm-Message-State: AOAM530UdxRSPxL9syxUogbJOggkPPRLsTzBNkJXtXtM0jGzoSzEAdkT
        dQdacd9vYbWKpPHITZMwgqltDyQ0JGzIw1601tIknUoRkaCbT0Tanlwe+Gb1S1Lfqs2FePBC2WV
        O25UEtYqXVxTKH4lgASKcdKnB2R+e
X-Received: by 2002:a05:6402:31ba:: with SMTP id dj26mr5123214edb.71.1624024403742;
        Fri, 18 Jun 2021 06:53:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTsF/0Cs/2BceDIqNAQD06Z7C0XH4tntVdthlt9jCkRfrIbPEznJ7emZ4sC946B20lOowpNw==
X-Received: by 2002:a05:6402:31ba:: with SMTP id dj26mr5123196edb.71.1624024403599;
        Fri, 18 Jun 2021 06:53:23 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id de6sm780838edb.77.2021.06.18.06.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 06:53:23 -0700 (PDT)
Subject: Re: AW: [PATCH] power: supply: axp288_fuel_gauge: remove redundant
 continue statement
To:     Walter Harms <wharms@bfs.de>,
        Colin King <colin.king@canonical.com>,
        Sebastian Reichel <sre@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210618092924.99722-1-colin.king@canonical.com>
 <5d5dad5246f442e5aa96bdc50ac4b1f1@bfs.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bac7f313-6696-7973-4261-27bf59055425@redhat.com>
Date:   Fri, 18 Jun 2021 15:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5d5dad5246f442e5aa96bdc50ac4b1f1@bfs.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 6/18/21 1:19 PM, Walter Harms wrote:
> Just a remark:
> the function fuel_gauge_reg_readb() is reporting via dev_err().
> But some callers are reporting also. Maybe someone should take
> a look.
> The valid return seems >=0 so removing the dev_err seems an option.

Actually the whole register reading code in this driver needs to
be reworked.

The AXP288 PMIC also controls voltage-planes which are used by
the CPU-cores and the i915 GPU which are part of the Intel SoCs
with which this PMIC is used.

This means that the PMU of the SoC needs to also talk to it
over the same I2C bus when CPU-cores / the GPU changes C-states
or ramp up/down their frequency.

To avoid conflicts there is a special handshake with both the
PMU itself (taking something resembling a mutex by a hw-handshake)
as well as with the i915 driver. This handshake is hidden inside
the i2c-adapter driver, so you don't see it in the code here.
This handshake is also the whole reason why the regmap_read may
return -EBUSY.

This handshake is quite expensive and currently it is done for
every single regmap_read (the handshake is many times as
expensive as the actual I2C read) and updating the fuel-gauge
status does quite a lot of reads.

A while ago I changed the underlying code so that AXP288
drivers can acquire access to the bus once; then do a bunch
of regmap accesses and then release the bus again.

A user who was having some stability issues has been working
(offlist) on a patch to use a register cache which gets updated
periodically (like how many hwmon drivers work) and then have
all the psy property accesses come from the cache. This allows
acquiring the bus once; do all the reads to fill the cache;
and then release it again.  I need to review his code; but
I've not gotten around to that yet (I really need to make
time for this).

Once we switch to this register-cache approach, then the whole
fuel_gauge_reg_readb() wrapper can go away since then we no
longer need to worry about EBUSY errors (once we have acquired
the bus these cannot happen).

TL;DR: you are right that there are some cleanups possible here,
but the entire thing is going to be rewritten soon, so it is
probably best to just leave it as is for now.

Regards,

Hans












> 
> jm2c,
>  re,
>  wh
> ________________________________________
> Von: Colin King <colin.king@canonical.com>
> Gesendet: Freitag, 18. Juni 2021 11:29:24
> An: Sebastian Reichel; Hans de Goede; Chen-Yu Tsai; linux-pm@vger.kernel.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Betreff: [PATCH] power: supply: axp288_fuel_gauge: remove redundant continue statement
> 
> WARNUNG: Diese E-Mail kam von außerhalb der Organisation. Klicken Sie nicht auf Links oder öffnen Sie keine Anhänge, es sei denn, Sie kennen den/die Absender*in und wissen, dass der Inhalt sicher ist.
> 
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The continue statement at the end of a for-loop has no effect,
> invert the if expression and remove the continue.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/power/supply/axp288_fuel_gauge.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/power/supply/axp288_fuel_gauge.c b/drivers/power/supply/axp288_fuel_gauge.c
> index 39e16ecb7638..20e63609ab47 100644
> --- a/drivers/power/supply/axp288_fuel_gauge.c
> +++ b/drivers/power/supply/axp288_fuel_gauge.c
> @@ -142,9 +142,7 @@ static int fuel_gauge_reg_readb(struct axp288_fg_info *info, int reg)
> 
>         for (i = 0; i < NR_RETRY_CNT; i++) {
>                 ret = regmap_read(info->regmap, reg, &val);
> -               if (ret == -EBUSY)
> -                       continue;
> -               else
> +               if (ret != -EBUSY)
>                         break;
>         }
> 
> --
> 2.31.1
> 

