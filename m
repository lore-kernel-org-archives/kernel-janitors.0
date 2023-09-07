Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105C3EC8743
	for <kernel-janitors@archiver.kernel.org>; Thu,  7 Sep 2023 16:52:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244320AbjIGQwK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244267AbjIGQwK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Sep 2023 12:52:10 -0400
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C591FE9
        for <kernel-janitors@vger.kernel.org>; Thu,  7 Sep 2023 09:51:38 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-52a40cf952dso1625213a12.2
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Sep 2023 09:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105374; x=1694710174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G88lP2VW9W0ey1BM427zqcg+F+UpGhl5q2J3uTfo6Co=;
        b=K9Prlw0EXoW4j5tamkEJBAzyQHUMizitWF6STJWtxDB8luOMdBDv/9q8diPPkN+Ady
         8GXj0YISO+Mw/JFx7LyM0IBXFGiZT+H1lU3lTzlweZCzbDVYf9dwd4Lqf4jDQryMFTKD
         BtmSWrkci+wgi2qyY4u9TnynTx4DnaJut6LdcFSKOjHnSVkM836lrS9jfpeMIc6N1G4Q
         bG6qUX3YPWWcQiBqlwMIKDNC5q+zw1qxQcz8TELcUWHULSPSCu1Mp3zC6t6Z2Mw00Leq
         LmkIjVYkvkxLfVBxCiX1Iemi3AOaJCwwpRaOAXKNBKAKuMwv9rk/plkz5twpRyO3KeWP
         SwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105374; x=1694710174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G88lP2VW9W0ey1BM427zqcg+F+UpGhl5q2J3uTfo6Co=;
        b=aB/go2N7CLbZb5MrEN91IP1gaUtAcvigF+4JbFlrSB/b2v6peaznFHbgOxjmPHMvzN
         CXANvjLQhItxxY3CdxnP3+hkT/W3xQgCLiHopYqosJk+/1eUm1Ythj9IAma4JNbz/EU+
         gQ09g/bgTZVQJOVUm4PrurwFF82m58N2F9btbk/BJq4ayWt6AF6Lgi2bnxQzaO/sT46z
         LvEtPFkD4e3fH1MRfv0PrUV+lDIUw72HdEBG6tV3J+fg3A3Hqa6e+thL5GNbRpRs2RD6
         b9aoxfQBwtIfkq76Ca9cdRZHkEaIOYPEc999HsXt9Ub/oF0QhGwAMwElb+rL/zX1dAez
         1/0Q==
X-Gm-Message-State: AOJu0Yyn5zol5lqZ35Hl70a8AKArEKFF/yj3L/BQAk+BOqESjydvk0Rh
        tszNFP4kiHzpzaal4NNt3YnVRgoVqNby7xWRIeA=
X-Google-Smtp-Source: AGHT+IHGT591APG6CRNW4zuyJuEfxCr1FfGrojCK5qI1ehGXhuwAoMXIKQPf6+hAJXIGsQZ5/i+wTg==
X-Received: by 2002:a1c:ed08:0:b0:3fe:2b60:b24e with SMTP id l8-20020a1ced08000000b003fe2b60b24emr4801517wmh.29.1694084900263;
        Thu, 07 Sep 2023 04:08:20 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ay30-20020a5d6f1e000000b0031f65cdd271sm3999677wrb.100.2023.09.07.04.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 04:08:19 -0700 (PDT)
Date:   Thu, 7 Sep 2023 14:08:17 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        Sebastian Reichel <sre@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org, error27@gmail.com
Subject: Re: [PATCH] power: supply: mt6370: Fix missing error code in
 mt6370_chg_toggle_cfo()
Message-ID: <1092ffb3-0238-4dc0-baf3-344a653fca3f@kadam.mountain>
References: <20230906084815.2827930-1-harshit.m.mogalapalli@oracle.com>
 <cd6eea67-df0f-08b1-61cd-57a3b4f9cf0d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd6eea67-df0f-08b1-61cd-57a3b4f9cf0d@collabora.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 07, 2023 at 12:43:12PM +0200, AngeloGioacchino Del Regno wrote:
> Il 06/09/23 10:48, Harshit Mogalapalli ha scritto:
> > When mt6370_chg_field_get() suceeds, ret is set to zero and returning
> > zero when flash led is still in strobe mode looks incorrect.
> > 
> > Fixes: 233cb8a47d65 ("power: supply: mt6370: Add MediaTek MT6370 charger driver")
> > Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> > ---
> > This is based on static analysis with smatch, only compile tested.
> > ---
> >   drivers/power/supply/mt6370-charger.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
> > index f27dae5043f5..a9641bd3d8cf 100644
> > --- a/drivers/power/supply/mt6370-charger.c
> > +++ b/drivers/power/supply/mt6370-charger.c
> > @@ -324,7 +324,7 @@ static int mt6370_chg_toggle_cfo(struct mt6370_priv *priv)
> >   	if (fl_strobe) {
> >   		dev_err(priv->dev, "Flash led is still in strobe mode\n");
> > -		return ret;
> > +		return -EINVAL;
> 
> I think that returning 0 here was intentional, but I agree on a return ret
> here being both confusing and wrong.

If it's a success path then probably we should remove the dev_err().

regards,
dan carpenter

