Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EAAC433FE
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 Jan 2022 10:09:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352351AbiALKJT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 Jan 2022 05:09:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352311AbiALKJS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Jan 2022 05:09:18 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B33C061748
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jan 2022 02:09:17 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id a1-20020a17090a688100b001b3fd52338eso2680537pjd.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jan 2022 02:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=weNjN/xzHEHSDO334pDbfVWSs4mNM/PupPi9g1KN1hE=;
        b=jiCM+hPrEi1OJLok7KC6lTf2sSpMxRXrphLjSEuFeYVPjqJR6MEuMKGdMkRiXmxFE6
         risuvb9XncZd6rbufWNOjgZ3MpyEJu+C6u9FPQUX+wEfo8z1h7LhxwcXJs5yrgY0ORmk
         hmzNpIXEP0HdMeZYxolP7W9PBLw7wpM34+VG2NIcPYSwqZjmfSnOvQ9NNSzcQztpxr8Y
         TH9FGhTefEQ9rosu/FYuujV2qfcfH5hG4j2/E61TeORyjtODPMGM6MdQRm2iScSUUJG6
         E+Kyj0qJiPi3wZ5l9rizfWxT12xfne7cj4FPqb5I8IiYsIcIDLdyEXrLwCWf7Sh4u1om
         kLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=weNjN/xzHEHSDO334pDbfVWSs4mNM/PupPi9g1KN1hE=;
        b=EdskzB3dNsnJm/V96RKmLIufgh+ct2Gwuwzx1ivqPB45/rV7q0CyoUHbMvUjgkwfrI
         Vr8eFV+AvJy+NQQSNZWu4MR9Y/SKFpa4n3lak5fjaPl5QTTSa5oi5nAlwFW5EhnncJbQ
         iq1W/PT7Kib1OVTcpciBLglNUkMdMdlgHtbSohe4CuK1TBn/xZS44TfmYzhfOFHlPSO/
         UdUwYw5C9uQA1AN/bgwhgDCfDfhk6Sq/pjXtk4mKJH+djFZkNeuBWSvQaoLms+x/juld
         MsVwwu9/f9Qn1MLoyjXbXy2lTvo6HvxBEOtXuJ1TXjvlp9Wc9F3oVNlsOXNFwZlY0+Zl
         ov1g==
X-Gm-Message-State: AOAM533hy4Zdpw1CGVc+BYautzCAG9weBtsXPH5gouycC2qGwDJS7NtR
        0sUbx3/Zec7DNDE2KftPVZ7GM2aSrUqRW+Ygi5BjKw==
X-Google-Smtp-Source: ABdhPJwcbK22Ix9fd+ET1Pl7Cn1AzTSRRfd6vqqM6VwNy0agpUuC3dmSCsO7/PAKrF1qM5/LOorWQz4QQmZrUnz07oI=
X-Received: by 2002:a17:902:b189:b0:149:6c45:24c with SMTP id
 s9-20020a170902b18900b001496c45024cmr8488385plr.21.1641982157326; Wed, 12 Jan
 2022 02:09:17 -0800 (PST)
MIME-Version: 1.0
References: <20220109204105.51878-1-colin.i.king@gmail.com> <Ydtoib+OCyaPhrOH@pendragon.ideasonboard.com>
In-Reply-To: <Ydtoib+OCyaPhrOH@pendragon.ideasonboard.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 12 Jan 2022 11:09:06 +0100
Message-ID: <CAG3jFyu3aB0QnQfa-fu6_Zy_=R=9dnVLmW3RBXLv3bD=gUzQEA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7533: make array clock_div_by_lanes static const
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Colin Ian King <colin.i.king@gmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 9 Jan 2022 at 23:58, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Colin,
>
> Thank you for the patch.
>
> On Sun, Jan 09, 2022 at 08:41:05PM +0000, Colin Ian King wrote:
> > Don't populate the read-only array clock_div_by_lanes on the stack but
> > instead it static const. Also makes the object code a little smaller.
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7533.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > index eb7579dec40a..ef6270806d1d 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > @@ -29,7 +29,7 @@ static void adv7511_dsi_config_timing_gen(struct adv7511 *adv)
> >       struct mipi_dsi_device *dsi = adv->dsi;
> >       struct drm_display_mode *mode = &adv->curr_mode;
> >       unsigned int hsw, hfp, hbp, vsw, vfp, vbp;
> > -     u8 clock_div_by_lanes[] = { 6, 4, 3 };  /* 2, 3, 4 lanes */
> > +     static const u8 clock_div_by_lanes[] = { 6, 4, 3 };     /* 2, 3, 4 lanes */
>
> It's not mandatory, but I have a tendency to declare static const
> variable first before all mutable variables.
>
> >
> >       hsw = mode->hsync_end - mode->hsync_start;
> >       hfp = mode->hsync_start - mode->hdisplay;
>
> I wonder if
>
>         /* set pixel clock divider mode */
>         regmap_write(adv->regmap_cec, 0x16, (12 / dsi->lanes) << 3);
>
> would be even better, or if it would be too much black magic. Either
> way,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied to drm-misc-next.
