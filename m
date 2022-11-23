Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADC3C433FE
	for <kernel-janitors@archiver.kernel.org>; Wed, 23 Nov 2022 07:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235984AbiKWHci (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 23 Nov 2022 02:32:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235652AbiKWHcf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Nov 2022 02:32:35 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F51C25E7
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Nov 2022 23:32:28 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id e27so667311ejc.12
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Nov 2022 23:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4qo3fGXZQy+8oZhU7cu78EOId5JBj3qLdZ14a/QvWs=;
        b=A+BOWQfr+GHxiyky3FGgeGI42YGjsE2iWDptOAvatoeyB9b+yQTLOul0n5laPGqlbe
         A8piGSB5NYg/4Mx8w+5UKEgUuUDPNeVCoiivRVSTZ+v7IQJABI+rxTTv9og6rk9YteNK
         46KvaNjHzhJc+JNV46ND6MLRLfneU7Bq3if2AEqmq4uvB1qBgpwg4/LiW9UpX2cF/WJG
         zRrKF8HL05kapczSgtl+WiYryLavK86jPzLVFl7Pt6cIk5zN7kyYrvTXie5dEcjDEerw
         B0xxdzXGaCXRdKnoJ2HGdD4lI8QQ02xOFPnp/IoUPQ0/13E6ecEHNzIP8y8jALv0Fp76
         p3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4qo3fGXZQy+8oZhU7cu78EOId5JBj3qLdZ14a/QvWs=;
        b=y0u/qQfViK3s6e5D3MXtjPfoJ/MMy4Drqr/jwgSbfjSGCvAvdqHqhQQBrJVP+HY+R/
         ACn0u/OHE8OyCL14oBnQCWBpPljKfuGyLgxEjmAitpTz2uu/HCfu34vP16ZvgBodV+oi
         7E9nGuyssD6f668uJGgLpZ7Fd44gLh/9+UMzXh8i2YcCZJLaZgECK6Yoqk1J7EkALbpX
         iKYvXW48YbSDm1z40QmYcnHugwLL6OpPswf+TGclAl8Ib1+4/FSzVw0xp7+7CxNmmFia
         7rNB3g2rDpOabs5j3HnXz/STiXoMdRE5bwALNTLADJWoCX1HStzY1IuUFEc0kpxQqAwg
         8ZeA==
X-Gm-Message-State: ANoB5plUW0/NI+SzX/VCMkXZTRfiDIA17ddTiWPiXEYOLtyeullCWRys
        mendeuiNN6gOzaXKvjwgS2gkwg==
X-Google-Smtp-Source: AA0mqf7YzWyH2VU2YnkG3jnX1ifCWu9zwuLgz/9nZTRc2x7pdPbOoX1z9PpmE2lNj2LlqmhLHx0DGA==
X-Received: by 2002:a17:906:2302:b0:7b9:de77:f0ef with SMTP id l2-20020a170906230200b007b9de77f0efmr1476436eja.5.1669188747005;
        Tue, 22 Nov 2022 23:32:27 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id g16-20020a170906539000b007b935641971sm938539ejo.5.2022.11.22.23.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 23:32:26 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 23 Nov 2022 08:32:26 +0100
Message-Id: <COJI0ZYCXF71.26IIP7J1SRHDZ@otso>
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Georgi Djakov" <djakov@kernel.org>
Cc:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Fix an error handling
 path in qcom_icc_rpmh_probe()
X-Mailer: aerc 0.13.0
References: <ec929c37c655ede7bb42e426354093c8a1377a0b.1668947686.git.christophe.jaillet@wanadoo.fr> <COHSZZ9A5570.1P4NTXRE9IRZR@otso> <253d4aac-62af-15af-90e7-a3cd4bacba92@wanadoo.fr>
In-Reply-To: <253d4aac-62af-15af-90e7-a3cd4bacba92@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Christophe,

On Tue Nov 22, 2022 at 10:45 PM CET, Christophe JAILLET wrote:
> > I believe the same needs to be applied to icc-rpm.c.
>
> Their are other issues in the error handling path of this file.
>
> 1)	if (desc->has_bus_pd) {
> 		ret =3D dev_pm_domain_attach(dev, true);
> is unbalanced, both in the error handling path and in the remove function=
.
>
>
> 2)	clk_bulk_prepare_enable()
> is not balanced in all error handling paths.
>
>
> 3) the same issue about error handling if of_platform_populate() fails.
>
>
> These issues have been introduced in different commits.
>
>
> Would you prefer several patches, each related to a given Fixes: tag, or=
=20
> one bigger "fix all error handling paths"?

I don't really have an opinion on this, I guess if the issues were
introduced in different commits, make separate fixes?
If it's the wrong way somebody will tell you anyways ;)

Regards
Luca

>
>
> Anyway, fixing the points above would require moving some code around.=20
> Usually I try to avoid it, because it is not always easy to see=20
> associated side effects.
>
> CJ
