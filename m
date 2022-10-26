Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E477BC433FE
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 Oct 2022 09:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbiJZJGB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 Oct 2022 05:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbiJZJGA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Oct 2022 05:06:00 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EAB97E302
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Oct 2022 02:05:58 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j15so14707283wrq.3
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Oct 2022 02:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgjPE0OFmRFHo7Z1uCpz96jqkXmo7ld9GDJYygtj7OA=;
        b=TXFYGCkJ8ubmCcJC1JNK3EZ5PvBpOgwIocdGz+ZZ49Blh8RmcAgWcQZ7q6oLIEduND
         Y1d2r/CERU86YkwReVEZv78aG5ypTcnzRGcpoZ6zJlwvJKslbHI/R9FVleMzpG2mTeZ7
         TgcRl6tAPi1iHpJlmz2lSlW0VgrtzhhqgLihstKFM6UmOtGpVPxvfeYtEV3zbzl/Sr4m
         DH6NOqpiSL6POYb6Kn8NrqRIvvje5lpiSkdAk2IPuuEsDCPn46JgvFdIaVY3NBy/zmVz
         dsp1UlMClBcZlsxO4aDPcihonWVaKDmKT6/hWt1xje/LYtNkbQFKKa9tL/nEm8CSnmBy
         sl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgjPE0OFmRFHo7Z1uCpz96jqkXmo7ld9GDJYygtj7OA=;
        b=P93XFLreB4wxeRGOyZT/oYgTAvAHh23RLxhBbSc9BTmNcqmuOhFs90iAD7na6GLSCM
         u6FQ0FZXjlWe+vJLaxSZirHNYf2qmQZqWYYRKJbkaecmz/EuT3DYduxuRQV75/YtP3ca
         p2u2TahBy+gspPqLi57+t88RcK+MNInIMeRKJLbo0zWjXrACtzndb3hqKDxLfBBPmLrK
         lEye3vigshdXPk+9dgfO+uqgSkWGAF+U9vk/dVfUU/6BwLt98MtHtqFzQF2gr5yG/WN6
         7qmWz5UVPn0h5xa8NxMilCbyTugBm1MMfwc1wGhd989qY62FsGFES7kYH2uFhR4n9O7c
         qTQQ==
X-Gm-Message-State: ACrzQf2npk3NuijKqkI8Ur2gSbD1cQVYtfYQBuPzeBgoxlNpaQUjvLiM
        VXaUReSB0/xi0kGs7iibUXuFg+bLjPvBn0Bsrns=
X-Google-Smtp-Source: AMsMyM5NjNV21C5WeMi+mlwJIutp+UfyKLwakzav8DhEyMkznmycOJk1o62D9YtjDLWqniVDB1/7DpEEGCBcsLeMo0A=
X-Received: by 2002:a5d:6d0d:0:b0:230:1b65:a378 with SMTP id
 e13-20020a5d6d0d000000b002301b65a378mr28943423wrq.406.1666775156703; Wed, 26
 Oct 2022 02:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <Y1aCiReTZDbPp/rS@kadam> <20221026072444.GA24881@cyhuang-hp-elitebook-840-g3.rt>
 <Y1j058PsWYj0MQrC@kadam>
In-Reply-To: <Y1j058PsWYj0MQrC@kadam>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Wed, 26 Oct 2022 17:05:44 +0800
Message-ID: <CADiBU39z_h=QLF-cGztz6Wq86+rMahVb7owHNt4RpvFPFYDs3w@mail.gmail.com>
Subject: Re: [PATCH resend] mfd: mt6370: add bounds checking to
 regmap_read/write functions
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> =E6=96=BC 2022=E5=B9=B410=E6=9C=88=
26=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:51=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On Wed, Oct 26, 2022 at 03:24:48PM +0800, ChiYuan Huang wrote:
> > 2) normal register access with negative length
> > Unable to handle kernel paging request at virtual address ffffffc009cef=
ff2
> > pc : __memcpy+0x1dc/0x260
> > lr : _regmap_raw_write_impl+0x6d4/0x828
> > Call trace:
> >  __memcpy+0x1dc/0x260
> >  _regmap_raw_write+0xb4/0x130a
> >  regmap_raw_write+0x74/0xb0
> >
> >
> > After applying the patch, the first case is cleared.
> > But for the case 2, the root cause is not the mt6370_regmap_write() siz=
e
> > check. It's in __memcpy() before mt6370_regmap_write().
> >
> > I'm wondering 'is it reasonable to give the negative value as the size?=
'
> >
>
> Thanks for testing!
>
> I'm not sure I understand exactly which code you're talking about.
> Could you just create a diff with the check for negative just so I can
> understand where the issue is?  We can re-work it into a proper patch
> from there.
>
Here.
https://elixir.bootlin.com/linux/v6.1-rc2/source/drivers/base/regmap/regmap=
.c#L1860

From my experiment, I try to access 0x00 reg for size (-1).
Testing code is like as below
regmap_raw_write(regmap, 0, &val, -1);

That's why I think if the size check is needed, it may put into
regmap_raw_write() like as regmap_raw_read().

> regards,
> dan carpenter
>
