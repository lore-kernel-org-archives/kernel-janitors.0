Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED794C25B08
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Aug 2022 18:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243872AbiHOSre (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Aug 2022 14:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244255AbiHOSqw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Aug 2022 14:46:52 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3038441D0A
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Aug 2022 11:28:24 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id t11-20020a05683014cb00b0063734a2a786so5967050otq.11
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Aug 2022 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=8qfZVni2XH/RI/iesjrLRRQFFIAGyvbqRIgbTF4s4BE=;
        b=a5C1taQFB89b3AGnirAiIEdh+mu154yh0pHMjrTR7a/ROQ50/2Lu0mzkBsSm+G3LIt
         6AXpOP3h0N8XN76HDDoSQi3D7W/hRC+r+O11vnife9kmOk1a1mCQ26T5s85O+dZ7ef1p
         rrue1CkSdJux/05RskCFW63R8f7ogddm0j4uYa4/90h+8370/txJlqYbuaEPUh4OW+kR
         mgEN9GfbPGGb3jLAtZGekSZL70Rha+HyiuPtzaTwfLbZX+IqUsAoiE7gZm3iLAC+QpCO
         98UMtucYlPM70Ennas7ZDE2YcyW3k3dUF2IT7LawoM6p1bEA6Q5Vh//CzZbAWazQzsta
         5xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=8qfZVni2XH/RI/iesjrLRRQFFIAGyvbqRIgbTF4s4BE=;
        b=WvxjbQjIVER9DuIGDDqYiLSU4IUqEMpsYdBOTPM9xX3uRQwp/CsPRq5fBCOPRs/R0X
         FC6Gz6AvILLE4avRd22G94IRTP3YjxHgHLMxB0r9M8z8JzZD2/4bY0FO9lpvNuxk2RR5
         X6hMlETu4YdhT0wYebscSRrnt/JU1J2ZDVYJaT+06avownCuu0aiIxC0JtChIf8z5qZe
         NC3V9RmqWz0S1v8qml6JlIknOGwEsd/Ccb+MqQI242hMGTgJI38gBoBF/KEQ6/oyeFpJ
         kAxA2UJXB9zvI44Sr8LE7vRjXCYJiOSvaTRCnI2mArjLO0cHAr6WiHcCYsQqReKnrmzt
         r15Q==
X-Gm-Message-State: ACgBeo1BNLUmbElpEy7MFc+4WwwvbVPTvzKc0SfsQAexw/1looSZ2Fls
        HPlFuQJIo3Ngnbny16hG4M2iPQ2NXVtVJ4YSlc9Ifw==
X-Google-Smtp-Source: AA6agR4WPkhmsptGd1XOB3Vh54cIr8wHdsrg+jtjRu9m6lduQwI838vBMBxq5N7FsgKfD3Gal982Qyqm+XiwE3ef/Io=
X-Received: by 2002:a05:6830:25c4:b0:637:2a66:1dfd with SMTP id
 d4-20020a05683025c400b006372a661dfdmr6294714otu.383.1660588103082; Mon, 15
 Aug 2022 11:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <6d75855ad4e2470e9ed99e0df21bc30f0c925a29.1658862932.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <6d75855ad4e2470e9ed99e0df21bc30f0c925a29.1658862932.git.christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 15 Aug 2022 20:27:46 +0200
Message-ID: <CAPDyKFoZ-kzFPM88TCdgL7LLzB144oiEfCpofafLvTz51y3Hng@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: pxamci: Fix an error handling path in pxamci_probe()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 26 Jul 2022 at 21:15, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> The commit in Fixes: has moved some code around without updating gotos to
> the error handling path.
>
> Update it now and release some resources if pxamci_of_init() fails.
>
> Fixes: fa3a5115469c ("mmc: pxamci: call mmc_of_parse()")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for fixes and by adding stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/pxamci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
> index 0db9490dc659..37bf362a0ed5 100644
> --- a/drivers/mmc/host/pxamci.c
> +++ b/drivers/mmc/host/pxamci.c
> @@ -648,7 +648,7 @@ static int pxamci_probe(struct platform_device *pdev)
>
>         ret = pxamci_of_init(pdev, mmc);
>         if (ret)
> -               return ret;
> +               goto out;
>
>         host = mmc_priv(mmc);
>         host->mmc = mmc;
> --
> 2.34.1
>
