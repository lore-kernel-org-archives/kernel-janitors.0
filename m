Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD8CC11F69
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Jul 2021 21:27:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FE956140D
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Jul 2021 21:27:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234308AbhGAV3k (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 1 Jul 2021 17:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234150AbhGAV3k (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Jul 2021 17:29:40 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C223EC061765
        for <kernel-janitors@vger.kernel.org>; Thu,  1 Jul 2021 14:27:08 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id k8so10431692lja.4
        for <kernel-janitors@vger.kernel.org>; Thu, 01 Jul 2021 14:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tNdovWONAJS2tmla2jBCM5Itz2o4pqMUjGORL+HptVU=;
        b=kNiciE1LKvyy4oLjI1gsH75NPWT6lqeO2ZobdhJ5FuiJiASUJ7WhGVQDwXaox9IWqb
         sDgEKqepnkz0avDsZjGb+wr7h1FJIbDfaJgCBQcMvoxv/JHElZ1uM8YB/OlBkN7Hb3ET
         LBQVxNBuUUY9VM792HIoU+GSfrsx25WYxwp0cBnAfsnuoE4xcH2oOczPgX+fo6tnFnAZ
         4kvCLLgpPwVT3pjSRLLIzng4lnnAvcymVtaINT3OoysXzgyPMLo5eVUmRBjqInnBBcm2
         tZqZPjzh3Si96zFD0tXxg0mHQuSh+MfZkJjsk/rx1tcifTze5i/LCy16p29HVp2l3527
         Igrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tNdovWONAJS2tmla2jBCM5Itz2o4pqMUjGORL+HptVU=;
        b=c/CpvSK2kLVzbYukH2+8fpL0H9thwctKa37M0EfA2AKmgrRGP3xK8t+PU56IkKzlUn
         CL+y7UE95D3mqCaOR1eQswJY7BU/wIZJ2WSvbZkpEZcEHActsHRcjGpXyo4gKVCUBgj1
         TrphL7LFf5OXXrbB2FG5b6ya0gL0pI4IUt8d44mc4FscWn0Ip/GEAmE21GdXh8yLGbWE
         LWC2O9ZJntYW5Pt+MoPKvUHf4U5dnhIUv4sPQVMjosm3sjugqGs0fMHCc2JqgEReG4Ds
         y9tqGJ9Cs/WCteUrfarMx2jzg8FQmfaCt3Zu4bv3nmlUUKlmCLOIZCJjpJjpp0QupAwZ
         dDKQ==
X-Gm-Message-State: AOAM5301WOW5qpAMa3wjt4z4JvHNb6kLpMRqpsXgERcWznmEC/cEl4dw
        pIf0w0j/E/wInegJ6ms3N3Y/fe+TBig0BK+gmvhZEQ==
X-Google-Smtp-Source: ABdhPJwFqmciUVS+yaaqjQV5c2F883P7rLgFT4w/dpSTBGNG7drC0d+KS7wtsp1DcNlNLXKew0OzKqYf8TbyEYWqdWU=
X-Received: by 2002:a05:651c:305:: with SMTP id a5mr1167662ljp.337.1625174826795;
 Thu, 01 Jul 2021 14:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <a8ff6511e4740cff2bb549708b98fb1e6dd7e070.1625172036.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <a8ff6511e4740cff2bb549708b98fb1e6dd7e070.1625172036.git.christophe.jaillet@wanadoo.fr>
From:   Catherine Sullivan <csully@google.com>
Date:   Thu, 1 Jul 2021 14:26:30 -0700
Message-ID: <CAH_-1qyRsfFzm_F26WV4wSjMojTVQSdahASWTKXb7VgQPHHUNA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] gve: Simplify code and axe the use of a
 deprecated API
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

On Thu, Jul 1, 2021 at 1:41 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> The wrappers in include/linux/pci-dma-compat.h should go away.
>
> Replace 'pci_set_dma_mask/pci_set_consistent_dma_mask' by an equivalent
> and less verbose 'dma_set_mask_and_coherent()' call.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Catherine Sullivan <csully@google.com>

> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>    https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
>
> v2: Unchanged
>     This patch was previously 3/3 of a serie
> ---
>  drivers/net/ethernet/google/gve/gve_main.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
> index c03984b26db4..099a2bc5ae67 100644
> --- a/drivers/net/ethernet/google/gve/gve_main.c
> +++ b/drivers/net/ethernet/google/gve/gve_main.c
> @@ -1477,19 +1477,12 @@ static int gve_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>
>         pci_set_master(pdev);
>
> -       err = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
> +       err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>         if (err) {
>                 dev_err(&pdev->dev, "Failed to set dma mask: err=%d\n", err);
>                 goto abort_with_pci_region;
>         }
>
> -       err = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
> -       if (err) {
> -               dev_err(&pdev->dev,
> -                       "Failed to set consistent dma mask: err=%d\n", err);
> -               goto abort_with_pci_region;
> -       }
> -
>         reg_bar = pci_iomap(pdev, GVE_REGISTER_BAR, 0);
>         if (!reg_bar) {
>                 dev_err(&pdev->dev, "Failed to map pci bar!\n");
> --
> 2.30.2
>

Thanks!
