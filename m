Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D716C2B9F4
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 15:31:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DD3661289
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 15:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbhFVPd5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Jun 2021 11:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbhFVPdy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 11:33:54 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD77C061756
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Jun 2021 08:31:37 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u13so17328567lfk.2
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Jun 2021 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZQlvZ6Ddmcy7bc1M4PIfx6EtMyfuVpDT5bjWUayyRQ8=;
        b=SkgcrGPcOPWO42gz71Dr5UY5QvKXhzHQYvGQXi471A85RrqboPk+fKuQYkI1srDy1n
         4FX/ZwKhIMgnEes15ieq8N7A+sm87n7kDrYM4bhvSkcXcEHwx8fVYvALMeq7H1M5iN+U
         OPz7NYwj6MgIPL7ohOFynVL/hWbo+6f3XoSEmRGLsj/mfVkju7SdANx1dp60gEIJhxW/
         /Xk4/Bj81AzEiQyqe0ELutLopeFfZ6uBuTnUTY6KnuKrlPeSZaRpZ7tVpAGAxx/HkZ2a
         ynIYtUSx+HXoifTdAiUAjaDPZTWm2FKMXIguayIfo0YdeQU6/DYiy6qmHCV2TUr2d9xM
         ebvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZQlvZ6Ddmcy7bc1M4PIfx6EtMyfuVpDT5bjWUayyRQ8=;
        b=C0vDrVawWJS5GAKaI4E+B28J8GDQnTJzAgEfVBAJzp179Gu3KnzRakFCY93jXWXOdm
         6XKInfq1hSk3uWVmU2lnvxxuzHLVgsjn/Ml4izMBw3I0KnQ7MoVhDuRLMhl7OpwPCAs+
         DCxG+5TS4ErO/juR3uSNRDH90twB8STq1BpjqnduNRX6ChxHeEl6OinmXHznSDUjbB5d
         UntJI5jNcYjcv/2n2cFByRoyJ6qGEhLdq26upiWi17KzluiZPc3COsb5RXphW++Se9f6
         166+xfWt2tgi38DKSUKUdm4S2nN6kbNAB4ThpS7Q8GDB8OoP/YIrs15DYDlTXJHW/KF1
         vW+w==
X-Gm-Message-State: AOAM532lc1R5wrhm/bJRs6s/UkbM2m5WB0PQbGGnLAMz04p99hAFmDNd
        rALPt4F92K6dNhdPh1JQmZJ2BeWiMuEJCfSJ4DI=
X-Google-Smtp-Source: ABdhPJx3S9WghncUujJP6EdjH4ueyeLBMfci/ggX3NpXvFHzVyz9gpEu1PdIGVLEI8/sJV8hFlJISH4aAZ1WHToVJ2I=
X-Received: by 2002:ac2:4d25:: with SMTP id h5mr3294348lfk.583.1624375895831;
 Tue, 22 Jun 2021 08:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <YMyir961W28TX5dT@mwanda> <67e49b8b-a80c-87a0-c5bb-8d5cf9239328@denx.de>
In-Reply-To: <67e49b8b-a80c-87a0-c5bb-8d5cf9239328@denx.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 22 Jun 2021 12:31:24 -0300
Message-ID: <CAOMZO5DLxM5nU4HxLT2DzKvmG1Vv1LNSdUoB3m7iZ1mpgxBFxg@mail.gmail.com>
Subject: Re: [PATCH] mtd: mchp48l640: silence some uninitialized variable warnings
To:     Heiko Schocher <hs@denx.de>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        kernel-janitors@vger.kernel.org,
        Colin King <colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jun 19, 2021 at 3:23 AM Heiko Schocher <hs@denx.de> wrote:
>
> Hello Dan,
>
> On 18.06.21 15:42, Dan Carpenter wrote:
> > Smatch complains that zero length read/writes will lead to an
> > uninitalized return value.  I don't know if that's possible, but
> > it's nicer to return a zero literal anyway so let's do that.
> >
> > Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > People, when we add a new driver can we make sure the first commit uses
> > the new prefered subsystem prefix?  For example,
> >
> > "mtd: mchp48l640: add support for microchip 48l640 EERAM"
> >       ^^^^^^^^^^
> > Otherwise it's not clear to me what I should use as a patch prefix.
>
> Ok, sorry...
>
> Hmm... Colin already sent a fix for this, see:
>
> https://lists.infradead.org/pipermail/linux-mtd/2021-June/087140.html

Yes, both patches work, but I think Dan's solution is a bit clearer, so:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks
