Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC86C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 29 Nov 2021 18:28:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378649AbhK2Sb4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 29 Nov 2021 13:31:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378990AbhK2S3o (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 Nov 2021 13:29:44 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F766C0048EC
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Nov 2021 06:51:09 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id z5so7777944edd.3
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Nov 2021 06:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GBYpAOe925BYrIse3QCI1ulmcepuLdu5an1jAdY1VrI=;
        b=kxatyFzeyi/rc+oHpXxoebQ+yFL4RQY+Q1mBNvYX9E4spJI2w5Ti44hdY9V8xVDAP8
         RQHppNJ2g+luc/DmSBYamVYQSMobW0Gwdh2728FM9hO4HIMZdLjX9JbiYXyzrqswl+sG
         4KedEYV8VS/uWooTSKnHj2JgRNDdm5tkrNOoGwo3jaZnXjlHum2tIiXSe4rN3rrirohk
         Mi/qUhFg90+rJBwkWDYSutTdJMY5EbIDfBiXwXd2+J+wSLULFvZbPi2I7Lyy7WkAzgmJ
         KqGLab5JNTg3cA7oIanGmsFAQ6YlcAHbZPaiGVz4b178aQJj7eZLjIrUt4YeT/WgPSGl
         WDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GBYpAOe925BYrIse3QCI1ulmcepuLdu5an1jAdY1VrI=;
        b=yz//z+yE7xY9WSF3jxGHaMProPr6SNv1TjaRiHIufXJpOmnktC5756cmOMcqJJy9L0
         9NoN24wuO6qqKXaBUdHZ4K1DvlD7o00Q8dnqKLasoGmsQQ+T3gzfYEzY0UwkDEBXQsPH
         Py77G9RHiVeq1Aemto077+oACz7bPEPZmVdyS9k/wx+DNAUDGdoU7201SFY8CatwyDJh
         JnPe6qc99i0N7OeGiL7+AIbvwC6h5IzTcDPfq2YX8V977Hfjc/nilETQndmRSZDzNxHY
         sZKU+dcT6amdD0B6OgafMoDWK/RMvjIavCvowc7B0H8krRn4KvFMGOIH9qnQVNwl2zpW
         scOA==
X-Gm-Message-State: AOAM532dnfm7Mq6su6Rv91yPebq10SbkYImQ8cS6fvbZEFRgtrNArw5Q
        LmsY91YxIF3ttM12wIyQ5b/eXPvvD8xmIIQEB0ZPOw==
X-Google-Smtp-Source: ABdhPJyzP17frZijHTBJmZpl44+A4bs23s05Y3uMLqMwxrTHIQnKvNEAg8uHLx/onOgUvgQAlAhodjXBIUtw+j8WNrs=
X-Received: by 2002:a05:6402:5206:: with SMTP id s6mr76354604edd.286.1638197467771;
 Mon, 29 Nov 2021 06:51:07 -0800 (PST)
MIME-Version: 1.0
References: <20211126225329.1150651-1-colin.i.king@gmail.com>
In-Reply-To: <20211126225329.1150651-1-colin.i.king@gmail.com>
From:   Michal Simek <monstr@monstr.eu>
Date:   Mon, 29 Nov 2021 15:50:56 +0100
Message-ID: <CAHTX3d+Sc47Cj7Rs7HxWSLapvwXsWa-1-VBknsFLXBPmEhyRLw@mail.gmail.com>
Subject: Re: [PATCH] microblaze/mm/highmem: Remove redundant initialization of
 variable maxmem
To:     Colin Ian King <colin.i.king@googlemail.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

p=C3=A1 26. 11. 2021 v 23:53 odes=C3=ADlatel Colin Ian King
<colin.i.king@googlemail.com> napsal:
>
> The variable maxmem is being initialized with a value that is never
> read, it is being updated later on. The assignment is redundant and
> can be removed.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  arch/microblaze/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
> index 952f35b335b2..f328d4549fad 100644
> --- a/arch/microblaze/mm/init.c
> +++ b/arch/microblaze/mm/init.c
> @@ -144,7 +144,7 @@ int page_is_ram(unsigned long pfn)
>   */
>  static void mm_cmdline_setup(void)
>  {
> -       unsigned long maxmem =3D 0;
> +       unsigned long maxmem;
>         char *p =3D cmd_line;
>
>         /* Look for mem=3D option on command line */
> --
> 2.33.1
>

The patch is fine but From and SoB email are different. Please fix it.
./scripts/checkpatch.pl --codespell --strict
0001-microblaze-mm-highmem-Remove-redundant-initializatio.patch
WARNING: From:/Signed-off-by: email address mismatch: 'From: Colin Ian
King <colin.i.king@googlemail.com>' !=3D 'Signed-off-by: Colin Ian King
<colin.i.king@gmail.com>'

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
