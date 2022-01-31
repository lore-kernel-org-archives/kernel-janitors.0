Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3ECC433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 31 Jan 2022 16:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380324AbiAaQ0q (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 31 Jan 2022 11:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380308AbiAaQ0m (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 31 Jan 2022 11:26:42 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34E9C06173B
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Jan 2022 08:26:41 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 133so12732867pgb.0
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Jan 2022 08:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cXgpXNmpURYuKO5hFXomyVO5gSKNrTXbh1rD4OzUpXg=;
        b=WR1c+rZqvGGeYSIO6gzOcCW1QC9dPCVdFWw/OeifVZiQihnPygq/QdXzuViZ9SjphP
         ayzUaWkLGwzDG4Xsge/K+PoDGxJiL1fTn8t/T5alQQYGbtr9FbCKoQYdPTPTAKoDAqvj
         qwxu29KzmhcPfmcGid0kH50kWRV7OjH2pkxpbZpJUlldIKhYyNtY2LhMbyFaHT42ZoOu
         OasYPUbcQuUdTH12mC2b6ZjJtt/eLtFk16st4bwPHmOOqg1vK9C2vNZw9XWNIuLy71FB
         Rlgj9qfzTjR4Th548pf2sEQQGJld0nPufqxTkBZUwMhezj0nXWLsjGK2YoAuSuxoPTKh
         +lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cXgpXNmpURYuKO5hFXomyVO5gSKNrTXbh1rD4OzUpXg=;
        b=YEGLdYpoGJf7U8HDL0CXSf2mDMRxJbQay3gKPUlTso9J19tWZsM/KuoInY+MDZlgfB
         0ObdHnFhhBVpw24XRWKmNN/RVXCClbXPndc5stPNDEX895UvVNYzuyfx7pGW0AvwWe90
         jXebEnG0aCb6tNmHzjDw5dloIrNSxDVajemxCKXtJsF0rLtNwC0rkPj4a0aS71VP7yeI
         iaiEDJyWlHE2IMim9cKWaTbKAGqNCCelfZC67eodjk7VtlIOIvbyOb9+ZS0tU6+B5B7v
         DQypWZljwfkUACBKkwP7w94smgFjYGhpH2rAUhbj4Yu2qydR6h02w3SLWJ9m/yoq6RbM
         0zMg==
X-Gm-Message-State: AOAM533/I7EJxAOrOuwPd6T/b08yIrvkzyX+/ZZkHXkWGrUqPLb6TI1P
        7cZIKqhyQl83JhHZxjM4AXmrG8sSl6zQ9Me6uQlesw==
X-Google-Smtp-Source: ABdhPJyul35EmKETJMvyOwoqTDyNw60O6aZw61+KCHfRM3+oym7Fio60R+RndTgIhPeuZtvYj2RPvrUYpe+m2VVADs8=
X-Received: by 2002:a63:4a49:: with SMTP id j9mr17048783pgl.178.1643646401132;
 Mon, 31 Jan 2022 08:26:41 -0800 (PST)
MIME-Version: 1.0
References: <9c20eb74d42f6d4128e58e3e46aa320482472b77.1643468761.git.christophe.jaillet@wanadoo.fr>
 <CAG3jFytrA4D2-JrABb+iG2kFQHVB5-_UQWoQyFJ3R=rfarre-A@mail.gmail.com>
In-Reply-To: <CAG3jFytrA4D2-JrABb+iG2kFQHVB5-_UQWoQyFJ3R=rfarre-A@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 31 Jan 2022 17:26:30 +0100
Message-ID: <CAG3jFys5GLKpLFfeVUg-cJaY2j17Z=4c4M+QYiS6M=+b=YH=Ag@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lt9611: Fix an error handling path in lt9611_probe()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 31 Jan 2022 at 17:25, Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Christophe,
>
> Thanks for submitting this fix.
>
> On Sat, 29 Jan 2022 at 16:06, Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
> >
> > If lt9611_audio_init() fails, some resources still need to be released
> > before returning an error code.
> >
> > Add the missing goto the error handling path.
> >
> > Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt9611.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > index dafb1b47c15f..00597eb54661 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > @@ -1164,7 +1164,11 @@ static int lt9611_probe(struct i2c_client *client,
> >
> >         lt9611_enable_hpd_interrupts(lt9611);
> >
> > -       return lt9611_audio_init(dev, lt9611);
> > +       ret = lt9611_audio_init(dev, lt9611);
> > +       if (ret)
> > +               goto err_remove_bridge;
> > +
> > +       return 0;
> >
> >  err_remove_bridge:
> >         drm_bridge_remove(&lt9611->bridge);
> > --
> > 2.32.0
> >
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
