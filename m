Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD73BC7EE23
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Jun 2023 10:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239782AbjFGKtG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Jun 2023 06:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239457AbjFGKsf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Jun 2023 06:48:35 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7CF1FCC
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Jun 2023 03:48:27 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30b023b0068so365561f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jun 2023 03:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686134905; x=1688726905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5WnwcMBCzqkTVNzKGHjoxn35nzFWBrFOxHg0gfxp444=;
        b=jqPUXaZQTinGdOZHeZxGkOYpbigj6OXsRHKd7XkfsY1tBwB6IzcgfyGQRj+rsh3zCj
         XzzwOyIaek0ZGCBxXF/aJ+GQA9BXjMMVsq3uoYZc4ywMZQBbdQjUWTpNNNG606Xn7Ltl
         /IhqNZPiBawT2D5CS2vlz9p9JxZowy+4Wq5GwnwNll1xJiTqUXduLEsQ5twg9HMzBEQU
         jD+AmO6QvNniSv+ifKh/AG9oZpHNo5+AWvgf+Ds3jzGWCUocVXXFXqsIgn8uDtJIcvNc
         a9SxM3MtSpX+pbk/9Q8wQiKBYIuEIM10hDwFyZzCyivMMkfz0Or3gQXQdCia5HgWK5C7
         T54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686134905; x=1688726905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WnwcMBCzqkTVNzKGHjoxn35nzFWBrFOxHg0gfxp444=;
        b=km9ufA1AmnDtAdrgqj5nDj36FfaDONQarPqDw1KUyTEl73AlmJmEmGl4ri1l/IG6QC
         avRAJCgJQ/aKjQxnj4NbpLozmiz3/mYU81LUuF0/ReIAy/2oPAjS9FhIWFhipZpjTFO4
         2/N3RLAlsAAue0KXJKMrL5YQT/RS33t2l01Ez9zUAAQ3xCki6cPAsrEUFir+4q55upGA
         noPRkJtpdvoX5FLSMLsm0Wwd2bm5qOn21J2vL1S33O03eL7A0RWuy7PY4mllocoxzM0L
         bX5adc7Cpo39+4wExiP9rGKL65Zay9d/bVBS8J2Z23ZyRHYuJ95O/u50mGK1aGYG4F2f
         RoRg==
X-Gm-Message-State: AC+VfDxfTGGPvEYd35jouXRGd6S0EKpyXTSWNaHoMsIUGZXN/mZvuWNa
        I2KbtSj6v2ug/dVUgmCypnFmfw==
X-Google-Smtp-Source: ACHHUZ6CMGSciI0Kpmcx3vVL2gO7RAJ6dvY+IatyoKt8MAEdLxsahTyA1fWKNuhWdn9mN/PELwNlRQ==
X-Received: by 2002:adf:f141:0:b0:307:cf71:ed8c with SMTP id y1-20020adff141000000b00307cf71ed8cmr9229756wro.35.1686134905648;
        Wed, 07 Jun 2023 03:48:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bce06000000b003f7e717c770sm1720326wmc.23.2023.06.07.03.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:48:23 -0700 (PDT)
Date:   Wed, 7 Jun 2023 13:48:20 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "tiwai@suse.com" <tiwai@suse.com>,
        "amergnat@baylibre.com" <amergnat@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "angelogioacchino.delregno@collabora.com" 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Fix error code in
 codec_init
Message-ID: <37fcdf74-d67b-4235-bb76-66df461cdc8a@kadam.mountain>
References: <f1d2f4c5-895d-4ad3-ab0f-b7ea4a74b69b@moroto.mountain>
 <6506d2d9deb95d4340261ace299eb8d735a50ddb.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6506d2d9deb95d4340261ace299eb8d735a50ddb.camel@mediatek.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jun 07, 2023 at 10:30:05AM +0000, Trevor Wu (吳文良) wrote:
> On Wed, 2023-06-07 at 12:41 +0300, Dan Carpenter wrote:
> >  Return -EINVAL on this error path instead of returning success.
> 
> Hi Dan,
> 
> I intended for the function to be reusable by both 2 and 4 amps, which
> is why I added a condition in the middle.
> This shouldn't be considered an error case, so there is no need to
> return -EINVAL here.
> Please kindly inform me if there are any errors in my understanding.

Oh, it looked like an error path.  Let me change it to "return 0;".

regards,
dan carpenter

