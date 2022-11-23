Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C298C433FE
	for <kernel-janitors@archiver.kernel.org>; Wed, 23 Nov 2022 08:22:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236039AbiKWIV6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 23 Nov 2022 03:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235693AbiKWIV4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Nov 2022 03:21:56 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5347D229A
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Nov 2022 00:21:52 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so857657wma.1
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Nov 2022 00:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L9Thz9yns+FIJXusgM78SIai92l4nRiseqTTKyEIwSM=;
        b=Qx9r8WsmzKnrKHCSE/h2oX+vFSIBIZN3d05cSGFXZqC424S44b1Jx8CzvEYjvVo/vQ
         IvNvyMO05iYuXvNZb8hfX9/s+YkzIT7itzXCXaepG+sICmshpaORyGBsXw47ZThtyFYD
         lET+9yMm5imEg+7giLsm0yHdWscNKjWIPfvtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9Thz9yns+FIJXusgM78SIai92l4nRiseqTTKyEIwSM=;
        b=TT8CfjnjkdQ7ONVlojauLLR1aUmfrcniXYmzIdOfWtoqTJmdSor+JSgOF3V9YAcJna
         LNRhqwmyTDGc2mczX1ESOR6cXc4fsUjF6pIJa+u1OY3KKIZY18t476OZ58nt/+6DdWx4
         9PFEinU4RtRWNZWxmnZfbAYqzrjwibMuxT8qDyWAuW4uZZDjDlV/FFtM88oLci9aoXMv
         gJErlIR0pFyLnWzzdlIQAwQWMX0dWSlXTMlD+s4XG6swVKC+DWllROMf5mG9cwBPHgDH
         WLG4OVCDPIp7YQjCyeBFPQ7XvLqlw2n9wqQo3S8MiKj1/6ujbhsm8qjE5iCAKbl+5ZgU
         ryKA==
X-Gm-Message-State: ANoB5plsEgPtGg8KQUqWUjXNNO6T81a3h98K8P8RmPorhW82GrZ7gTsZ
        +SpwSu16WmZWEQ+6Bah3n5PS+g==
X-Google-Smtp-Source: AA0mqf6nenQbqL5kVqF3svPV7Z481oVYS0C1JSjWJhHqfh2Ns7JBkLFmxh0/kDbGvLsWJlVFhwIIHQ==
X-Received: by 2002:a05:600c:3795:b0:3cf:cfcd:1e0 with SMTP id o21-20020a05600c379500b003cfcfcd01e0mr11411542wmr.166.1669191711172;
        Wed, 23 Nov 2022 00:21:51 -0800 (PST)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-55-94.cust.vodafonedsl.it. [188.217.55.94])
        by smtp.gmail.com with ESMTPSA id bg8-20020a05600c3c8800b003a6125562e1sm1456252wmb.46.2022.11.23.00.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 00:21:50 -0800 (PST)
Date:   Wed, 23 Nov 2022 09:21:48 +0100
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx: remove code for non-existing config
 IMX_GPT_ICAP
Message-ID: <20221123082148.GC39395@tom-ThinkPad-T14s-Gen-2i>
References: <20221122132330.30408-1-lukas.bulwahn@gmail.com>
 <20221122160937.GB39395@tom-ThinkPad-T14s-Gen-2i>
 <CAKXUXMxk-YoG4TdB8Em+cEMF8NA7rdMAboQz8nmhfVmVQ8oATA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKXUXMxk-YoG4TdB8Em+cEMF8NA7rdMAboQz8nmhfVmVQ8oATA@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Lukas,

On Wed, Nov 23, 2022 at 08:56:06AM +0100, Lukas Bulwahn wrote:
> On Tue, Nov 22, 2022 at 5:09 PM Tommaso Merciai
> <tommaso.merciai@amarulasolutions.com> wrote:
> >
> > Hi Lukas,
> >
> > On Tue, Nov 22, 2022 at 02:23:30PM +0100, Lukas Bulwahn wrote:
> > > There never was a config IMX_GPT_ICAP in the repository. So remove the code
> > > conditional on this config and simplify the callers that just called empty
> > > functions.
> > >
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > > ---
> > >  drivers/staging/media/imx/imx-media-fim.c | 54 -----------------------
> > >  1 file changed, 54 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
> > > index 3a9182933508..19a48eb445fd 100644
> > > --- a/drivers/staging/media/imx/imx-media-fim.c
> > > +++ b/drivers/staging/media/imx/imx-media-fim.c
> > > @@ -187,54 +187,6 @@ static void frame_interval_monitor(struct imx_media_fim *fim,
> > >               send_fim_event(fim, error_avg);
> > >  }
> > >
> > > -#ifdef CONFIG_IMX_GPT_ICAP
> > > -/*
> > > - * Input Capture method of measuring frame intervals. Not subject
> > > - * to interrupt latency.
> > > - */
> > > -static void fim_input_capture_handler(int channel, void *dev_id,
> > > -                                   ktime_t timestamp)
> > > -{
> > > -     struct imx_media_fim *fim = dev_id;
> > > -     unsigned long flags;
> > > -
> > > -     spin_lock_irqsave(&fim->lock, flags);
> > > -
> > > -     frame_interval_monitor(fim, timestamp);
> > > -
> > > -     if (!completion_done(&fim->icap_first_event))
> > > -             complete(&fim->icap_first_event);
> > > -
> > > -     spin_unlock_irqrestore(&fim->lock, flags);
> > > -}
> > > -
> > > -static int fim_request_input_capture(struct imx_media_fim *fim)
> > > -{
> > > -     init_completion(&fim->icap_first_event);
> > > -
> > > -     return mxc_request_input_capture(fim->icap_channel,
> > > -                                      fim_input_capture_handler,
> > > -                                      fim->icap_flags, fim);
> > > -}
> > > -
> > > -static void fim_free_input_capture(struct imx_media_fim *fim)
> > > -{
> > > -     mxc_free_input_capture(fim->icap_channel, fim);
> > > -}
> > > -
> > > -#else /* CONFIG_IMX_GPT_ICAP */
> > > -
> > > -static int fim_request_input_capture(struct imx_media_fim *fim)
> > > -{
> > > -     return 0;
> > > -}
> > > -
> > > -static void fim_free_input_capture(struct imx_media_fim *fim)
> > > -{
> > > -}
> > > -
> > > -#endif /* CONFIG_IMX_GPT_ICAP */
> > > -
> > >  /*
> > >   * In case we are monitoring the first frame interval after streamon
> > >   * (when fim->num_skip = 0), we need a valid fim->last_ts before we
> > > @@ -435,14 +387,8 @@ int imx_media_fim_set_stream(struct imx_media_fim *fim,
> > >               spin_unlock_irqrestore(&fim->lock, flags);
> > >
> > >               if (icap_enabled(fim)) {
> > > -                     ret = fim_request_input_capture(fim);
> > > -                     if (ret)
> > > -                             goto out;
> > >                       fim_acquire_first_ts(fim);
> > >               }
> >
> > As suggested by the checkpatch.pl:
> > WARNING: braces {} are not necessary for single statement blocks
> >
> > > -     } else {
> > > -             if (icap_enabled(fim))
> > > -                     fim_free_input_capture(fim);
> > >       }
> > >
> > >       fim->stream_on = on;
> > > --
> > > 2.17.1
> > >
> >
> 
> Strangely, my checkpatch invocation on next-20221116 did not show that
> warning and I am unaware that I made any specific changes to
> checkpatch or its configuration.
> 
> Anyway, checkpatch and you, Tommaso, are right and the patch can of
> course be improved. I sent out a patch v2:
> 
> https://lore.kernel.org/all/20221123075216.28193-1-lukas.bulwahn@gmail.com/
> 
> I hope to get an Acked-by: tag from you now. Thanks.

Sorry I miss the tag :)

Acked-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>

Apply the patch then run:
 scripts/checkpatch.pl -f drivers/staging/media/imx/imx-media-fim.c

Regards,
Tommaso

> 
> Lukas
> 
> > Apart of this, patch looks good to me.
> > Thanks.
> >
> > Regards,
> > Tommaso
> >
> > --
> > Tommaso Merciai
> > Embedded Linux Engineer
> > tommaso.merciai@amarulasolutions.com
> > __________________________________
> >
> > Amarula Solutions SRL
> > Via Le Canevare 30, 31100 Treviso, Veneto, IT
> > T. +39 042 243 5310
> > info@amarulasolutions.com
> > www.amarulasolutions.com

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
