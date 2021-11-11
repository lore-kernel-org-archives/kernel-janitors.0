Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1A1C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Nov 2021 18:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87FE161284
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Nov 2021 18:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbhKKSXZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Nov 2021 13:23:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbhKKSXY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Nov 2021 13:23:24 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D77C061767
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Nov 2021 10:20:34 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id z21so27560696edb.5
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Nov 2021 10:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OaaeBy7wNy2KZuuz+/U1uJcihHu87eaQLFgJ6Qj43Nk=;
        b=TgF9McPm81VWaEO14gKhL35xliRtxTHkllFsIgGdPPTI+D+44/jC8xBQSV+4b1YULT
         Kxw2rQ/e7ewgw7wogKYiMngBhurOzeohOkz3WgxXfp3riIXuACsGHfaCUoh7xMJHVqMw
         PyihjQ3/GJfeYHi6fMSxpHpMVbFAUEGGTwKpOvm+MDL2OfQz+cnElRZyjpMyBhq0NrX9
         j0DMDg/JkZucgO8yY8F/uH0HhaNJ4zRYKhmrRiAGMYrqMSVWb+doRk+/4V9pdOtoH8bz
         O7ZldzaV0gwYyPy2Tor8dGSSx317OfT6t7UD5BnjmllxejvQxsDF458HxTVdZl2mmAOi
         8QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OaaeBy7wNy2KZuuz+/U1uJcihHu87eaQLFgJ6Qj43Nk=;
        b=QZB8+R5/MfOw3zqxaI6zjNLG2yTkbNUj1De5lMMcEpdFHkio52TcHl8/yaxuW2GIKe
         3mtL8DrR85owEct19usHhHNdOi1Tw+tLfJ9jnEP4cgvjTKWO4alx3BRP58/IXYE/eoNn
         5BjJkS5yII2PwNHssU0oIZlQ5XQW6/GPNhWiGn9O5H9MQHC6h+0lh6k1KxQ8f16LAkuf
         z0Q+ExYJey4EnWpUVacQCFOc6SF9vjqiFenUzwQJQlxRyMqRB5x187W3Ws8XBFiq49XZ
         +FJY0DfqaNELEjDfpx01jzn3QPoemcqBuXqm/WaVu0KEbpGRbx4jy7YU9p+BTfY9kJ+E
         8Maw==
X-Gm-Message-State: AOAM531hyazzlh/zFlM+QPEwM4wVGy7GxrX/aaJRLRbAQYiKqIiNtqwO
        v/KJgqC+cohXqZy6bzu+eiaNhgsZS/CRScEKfXwUjA==
X-Google-Smtp-Source: ABdhPJxqySLvBigiVcFrvQfU7wP2KHHvyyK6s+YUBDQL3NsNNLfiIYqjyMmFduBZMNTTt31eHG5doB3Q6BJPyBpjkqE=
X-Received: by 2002:a17:906:4f05:: with SMTP id t5mr12362768eju.68.1636654833112;
 Thu, 11 Nov 2021 10:20:33 -0800 (PST)
MIME-Version: 1.0
References: <d28ca94a4031bd7297d47c2164e18885a5a6ec19.1634366546.git.christophe.jaillet@wanadoo.fr>
 <DU0PR04MB94173DCAA87A0B24E1C7073388939@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94173DCAA87A0B24E1C7073388939@DU0PR04MB9417.eurprd04.prod.outlook.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 11 Nov 2021 11:20:21 -0700
Message-ID: <CANLsYkwGN7LbWwu5JmcoH-zWQe8MMZYirLbU+EAFcTbFr=C+xQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix a resource leak in the remove function
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Hongxing Zhu <hongxing.zhu@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 10 Nov 2021 at 01:54, Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH] remoteproc: imx_rproc: Fix a resource leak in the remove
> > function
> >
> > 'priv->workqueue' is destroyed in the error handling path of the probe but not
> > in the remove function.
> >
> > Add the missing call to release some resources.
> >
> > Fixes: 2df7062002d0 ("remoteproc: imx_proc: enable virtio/mailbox")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> Reviewed-and-Tested-by: Peng Fan <peng.fan@nxp.com>
>

Thank you for that - I will pick up this patch when -rc1 or -rc2 gets released.

Thanks,
Mathieu

> > ---
> > This patch is speculative. I'm not sure if the added function call is at the right
> > place in the remove function.
> > Review with care.
> > ---
> >  drivers/remoteproc/imx_rproc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index ff8170dbbc3c..0a45bc0d3f73
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -804,6 +804,7 @@ static int imx_rproc_remove(struct platform_device
> > *pdev)
> >       clk_disable_unprepare(priv->clk);
> >       rproc_del(rproc);
> >       imx_rproc_free_mbox(rproc);
> > +     destroy_workqueue(priv->workqueue);
> >       rproc_free(rproc);
> >
> >       return 0;
> > --
> > 2.30.2
>
