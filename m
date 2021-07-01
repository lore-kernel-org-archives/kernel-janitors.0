Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8BDC11F64
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Jul 2021 20:34:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60F17613FB
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Jul 2021 20:34:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236388AbhGAUgt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 1 Jul 2021 16:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236356AbhGAUgt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Jul 2021 16:36:49 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2A5C061764
        for <kernel-janitors@vger.kernel.org>; Thu,  1 Jul 2021 13:34:16 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id h6so10226932ljl.8
        for <kernel-janitors@vger.kernel.org>; Thu, 01 Jul 2021 13:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LMMTpunk2rCY31/itiEgvN4IOL4r5+Mqwa9/O4MKcGk=;
        b=iUtWrJWg8vB/1Z560py1lFcKOiE+AKpkTVqxbYO0senY7UUa+tTV30pIWsx6stA3B8
         HUSTPJC3htDuwxtdvw3HYctOIW3vxp53ItnI41pKocoqhJ2bxuz3GXfo9lK1Ka1h7zTO
         EdnrfRt8Gv74bxgHfm+CCZje+pihTV6ZYxCOhlgKkWVsa/amhVi26SaRNCEupQbbHcRf
         8s3aiOWCxUjzNUupHRPCmCy10jp/ZY+lYdC/y7tuZZm2ESWeaEXq5Y9zChAMiTHU15tE
         CQR5bJgG1n4HPp/HeyHnsRNLBi28aKqo0dhhyPmy3xbgcFZyCWPBk+eIuwNz5G90xWSe
         AGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LMMTpunk2rCY31/itiEgvN4IOL4r5+Mqwa9/O4MKcGk=;
        b=flvqmcFiG3X8+11ZZEZzG6WvMaOoTbc4N7Fh4shy57lmHZhQQr0yLNkehCsE5zLbQd
         sH3feEv/N+qctamzNe/uEgvKk9ekCx+Ng4CvfFAuRk/6YFR+6nNzp18pj+kpDpG8oXSw
         mj9V7G0DZutJFJvdsuZDwl/ojthcve0cp6uxx8+YD0HdAbsUpB2Fe/0/Fckkp8LZwd6m
         g/McnOKOC/sXtBn1uhBvzwPe2MS6Ph19MycmJ9/g8siuMM2u2cjmFvjAnAmZ8HAKA49e
         Hb77V/WIvPCXK3DKq6K/G4+R07Xriz3pAjoT6f/bmIenL79wBydJzx+5lb9naruOWnRE
         FrpA==
X-Gm-Message-State: AOAM533SB1J3FG24TVCcYbZbiIWNScA6kTyAaElAQtmwpji05ZU5Snv7
        QXrvGFKK56yZc+QvVVmiTv5IMHoy1wqtSYZnBhvUFQ==
X-Google-Smtp-Source: ABdhPJwq8trRBKUDEGBZw1/PLvi4+9lccj2M21zGmy72qGV+weTWBPo4kUOoRMab4y9/E20e8wEFKIm19jzLq5gf7RE=
X-Received: by 2002:a05:651c:b12:: with SMTP id b18mr1060720ljr.260.1625171654416;
 Thu, 01 Jul 2021 13:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <f5dbb1ed01d13d4eac2b719db42cb02bf8166ceb.1625170569.git.christophe.jaillet@wanadoo.fr>
 <2a1bcfa7f84f63ab2076175c6a5c0a5a181d3bcb.1625170569.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <2a1bcfa7f84f63ab2076175c6a5c0a5a181d3bcb.1625170569.git.christophe.jaillet@wanadoo.fr>
From:   Catherine Sullivan <csully@google.com>
Date:   Thu, 1 Jul 2021 13:33:37 -0700
Message-ID: <CAH_-1qwt9qjUhrs0nkvu6cg+0K26XR1on2pHf0Q7jLc2V46U7A@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] gve: Propagate error codes to caller
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Sagi Shahar <sagis@google.com>, Jon Olson <jonolson@google.com>,
        David Miller <davem@davemloft.net>, kuba@kernel.org,
        David Awogbemila <awogbemila@google.com>,
        Willem de Bruijn <willemb@google.com>,
        Yangchun Fu <yangchun@google.com>,
        Bailey Forrest <bcf@google.com>, Kuo Zhao <kuozhao@google.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jul 1, 2021 at 1:18 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If 'gve_probe()' fails, we should propagate the error code, instead of
> hard coding a -ENXIO value.
> Make sure that all error handling paths set a correct value for 'err'.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Catherine Sullivan <csully@google.com>

> ---
> v2: Unchanged
>     The previous serie had 3 patches. Now their are only 2
> ---
>  drivers/net/ethernet/google/gve/gve_main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
> index 44262c9f9ec2..c03984b26db4 100644
> --- a/drivers/net/ethernet/google/gve/gve_main.c
> +++ b/drivers/net/ethernet/google/gve/gve_main.c
> @@ -1469,7 +1469,7 @@ static int gve_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>
>         err = pci_enable_device(pdev);
>         if (err)
> -               return -ENXIO;
> +               return err;
>
>         err = pci_request_regions(pdev, "gvnic-cfg");
>         if (err)
> @@ -1512,6 +1512,7 @@ static int gve_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>         dev = alloc_etherdev_mqs(sizeof(*priv), max_tx_queues, max_rx_queues);
>         if (!dev) {
>                 dev_err(&pdev->dev, "could not allocate netdev\n");
> +               err = -ENOMEM;
>                 goto abort_with_db_bar;
>         }
>         SET_NETDEV_DEV(dev, &pdev->dev);
> @@ -1593,7 +1594,7 @@ static int gve_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>
>  abort_with_enabled:
>         pci_disable_device(pdev);
> -       return -ENXIO;
> +       return err;
>  }
>
>  static void gve_remove(struct pci_dev *pdev)
> --
> 2.30.2
>

Thanks for the fix!
