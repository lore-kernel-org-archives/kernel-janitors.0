Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEE1C2B9F4
	for <kernel-janitors@archiver.kernel.org>; Sat, 19 Jun 2021 20:44:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DD22611C1
	for <kernel-janitors@archiver.kernel.org>; Sat, 19 Jun 2021 20:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbhFSUqM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 19 Jun 2021 16:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbhFSUqL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 19 Jun 2021 16:46:11 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45CE6C061574;
        Sat, 19 Jun 2021 13:44:00 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id z22so19099968ljh.8;
        Sat, 19 Jun 2021 13:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8GbMbqcQNUFvLy7t/rqOVL6WYkEUAA9eyNxHIfi2L94=;
        b=frwKhwlYwORDL90TK5zmJRbWkD2Py/0Uq5CFEXhAasiTywccZx9UJHn0NHo40MWJmb
         tK3jqsOvFXawKzSghYMnb0wGnkn4ZqjBBxZXYnyaV64AtO0rU5aQygcwI7xUD09W5rMl
         cmTxNx6x0AGBNV8qdDi7nDWSRiJFdDqzbcF0xtsHTHQCETUTG3jXGVQZIXU5/Rfdug2n
         FrXIV0hNa3Atx9mt0PWVzBRx8bGGQJ7cg4iQethA5nb7YOBzRHnztmUDc/psuchbTW76
         iShl8BKFIrneAWojK6BKwI+uQLhXzf8nWcG5qfq3YTPhdnp/uGyaPswSD09rG/hNiUoO
         qrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8GbMbqcQNUFvLy7t/rqOVL6WYkEUAA9eyNxHIfi2L94=;
        b=dhpczlQsFEdVwCrYLzhmFNg+6iMrv7TBRz+Ak8jWdkcF4qiSXOrdZpehErfj3Wyi6Q
         U2kpUW9H8K+Ec/3r4YyYe1GeK+FdzrODY13kCT4ISQ3XY/uxn9ZkY/TXdqSQ2RflQP2K
         iRQrNBQ2PtJ+sB7+BRPuKyPVmviYhWDJDTcmNXDgGzp0tV1sdUsc93/AeiFuAHBTG2fT
         4vIJHE+OK34L3xobnNB/MQ1bWEB0Lt20aEruCzBz43qApLAT5VPnPOzPwUYyPOo13CPC
         H31g9eZV4S71Oof+HpfZJAWypYqOu1F65Ztc6jEIVv6gWAYB/AmnaI16RsG6/BvPIdy6
         aUfA==
X-Gm-Message-State: AOAM532YRcL6xA6M+nRwSTYDyv+6z0QX3wxHMLDDT2vgf9ta+VjhtuU1
        avDmhcyOU57sjRwhJ5qewA5ZmSMPW4iowOG+zTI=
X-Google-Smtp-Source: ABdhPJwSkGENbChwA2P/eGQlExYm0gQQR8dt6/aMVCK5PKYVPF5tvRKmaD8UwMXFCywmsWxNgbZP6GjBY63+y5hdeZM=
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr14977906ljp.24.1624135438613;
 Sat, 19 Jun 2021 13:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210618183524.590186-1-colin.king@canonical.com> <20210619134025.GH1861@kadam>
In-Reply-To: <20210619134025.GH1861@kadam>
From:   Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Sat, 19 Jun 2021 22:43:47 +0200
Message-ID: <CAMeQTsaN-GYzix6X18bWxKY1L13bTrUUYDmp6tFdvaERZEj=3g@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500/oaktrail_lvds: replace continue with break
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Colin King <colin.king@canonical.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jun 19, 2021 at 3:40 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Jun 18, 2021 at 07:35:24PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently a loop scans through the connector list checking
> > for connectors that do not match a specific criteria. The
> > use of the continue statement is a little unintuitive and
> > can confuse static analysis checking.  Invert the criteria
> > matching logic and use a break to terminate the loop once
> > the first suitable connector has been found.
> >
> > Thanks to Patrik Jakobsson for explaining the original
> > intent of the code and suggesting this change.
> >
> > Addresses-Coverity: ("Continue has no effect")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/gpu/drm/gma500/oaktrail_lvds.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> > index 432bdcc57ac9..8541dcf237eb 100644
> > --- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
> > +++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> > @@ -113,8 +113,8 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
> >
> >       /* Find the connector we're trying to set up */
> >       list_for_each_entry(connector, &mode_config->connector_list, head) {
> > -             if (!connector->encoder || connector->encoder->crtc != crtc)
> > -                     continue;
> > +             if (connector->encoder && connector->encoder->crtc == crtc)
> > +                     break;
> >       }
> >
> >       if (!connector) {
>
> This test is wrong/impossible.  It should be:
>
>         if (list_entry_is_head(connector, &mode_config->connector_list,
>                                head)) {

Right, we should be back at the head if no match was found. Actually,
when looking closer, we should use drm_for_each_connector_iter() when
walking the connector list together with proper locking.

-Patrik

>
> regards,
> dan carpenter
>
>
