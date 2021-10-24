Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEF1C433FE
	for <kernel-janitors@archiver.kernel.org>; Sun, 24 Oct 2021 13:52:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBDA060FBF
	for <kernel-janitors@archiver.kernel.org>; Sun, 24 Oct 2021 13:52:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbhJXNyf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 24 Oct 2021 09:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbhJXNye (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 24 Oct 2021 09:54:34 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04588C061348
        for <kernel-janitors@vger.kernel.org>; Sun, 24 Oct 2021 06:52:14 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id u9so6914847uac.8
        for <kernel-janitors@vger.kernel.org>; Sun, 24 Oct 2021 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=id1p4qGVhAju1dNKS9ewXd/BAGNoNoVxYAeg/MMzZkk=;
        b=S7J2ND/kmDgFgy4AH1WOhj0CUNoHlN2y+ArUyM1B26rKOQ8Ax8jXgz8ou6NJqRrH5X
         VQcJJIZ1OJBzSD7cW03ffYhT5wnSiG02IY8lj3QReK9OmkiIgUcVqfnRMlAwAGw5V7xy
         Sfp0M9wvNWJnH6aO1HhKwXg8uIpani44NbMRtNLbxZBf95TyIpc9Kd1dcYUWJ37R+/jQ
         7Pm3jQc8CodMCVtUMzgbHxXuEqZh3sgOAlDJNgoSvK/D+wRx4yM1viMwDxHPj6+Jtk8S
         jEyOe6gFlDpwZ9HrUsiaW2etn7WeNTRQwET3c5kzxi7uaAhWGwYTVIGtFwur6YjO25/6
         0K7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=id1p4qGVhAju1dNKS9ewXd/BAGNoNoVxYAeg/MMzZkk=;
        b=RvQ7DjXHyQcx+Vxrqv+zCz5i5wl4LRnBBQtSwPikElVuwCMsYDB31FO1afdnxfeE67
         dFpKVUmPz/bF9MsEYTYTZkJN5Bw/Zs++i4aFRI6pShddnOoA0FIaBSsKKHtt7LGMt8SF
         DsaHoQ6HsnM7K8SfZbgBpEjFe0nZ71br5lWTntFPJ5yqg1RVvcdiU7xfUsmZayXxDiOT
         Z6CVhAVTe3/g2J82HT+bn6z8H6ta1Lnpcp4lP2Fb5zYKKeeiqnZ4LEdFcuY0KtnYQfDb
         FTk8u6NyFGEP2PfuJhSb+P0nC8yjTknyMwAbYVHDNmEa4xg/mEiJjjUT7InDV8fuuun4
         S89Q==
X-Gm-Message-State: AOAM533R/4HmVGGcpNRKVBbCz6yOQNiCEKzev776ZW3MRng8JoEKNIYr
        0O64l2aMba7BALEw/N6YY+uHQPEZfpc=
X-Google-Smtp-Source: ABdhPJxd9Wo3hj903kFuScgGbTE6ojkuGIltiHu6IVva3Bv9+ybLWMrNqMh7tssK/NPXN0QnCfAGIQ==
X-Received: by 2002:a67:f583:: with SMTP id i3mr162591vso.29.1635083533104;
        Sun, 24 Oct 2021 06:52:13 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id d4sm8633905vkq.54.2021.10.24.06.52.12
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Oct 2021 06:52:12 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id h4so16964770uaw.1
        for <kernel-janitors@vger.kernel.org>; Sun, 24 Oct 2021 06:52:12 -0700 (PDT)
X-Received: by 2002:a67:e0d1:: with SMTP id m17mr10843041vsl.22.1635083531874;
 Sun, 24 Oct 2021 06:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <fb712f802228ab4319891983164bf45e90d529e7.1635076200.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <fb712f802228ab4319891983164bf45e90d529e7.1635076200.git.christophe.jaillet@wanadoo.fr>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Sun, 24 Oct 2021 09:51:35 -0400
X-Gmail-Original-Message-ID: <CA+FuTSftgpOGxAxRE5u9o6gT_exaLtC2JkBz=iq21qe+tTTomA@mail.gmail.com>
Message-ID: <CA+FuTSftgpOGxAxRE5u9o6gT_exaLtC2JkBz=iq21qe+tTTomA@mail.gmail.com>
Subject: Re: [PATCH] gve: Fix a possible invalid memory access
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     jeroendb@google.com, csully@google.com, awogbemila@google.com,
        davem@davemloft.net, kuba@kernel.org, bcf@google.com,
        gustavoars@kernel.org, edumazet@google.com, jfraker@google.com,
        yangchun@google.com, xliutaox@google.com, sagis@google.com,
        lrizzo@google.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Oct 24, 2021 at 7:52 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> It is spurious to allocate a bitmap for 'num_qpls' bits and record the
> size of this bitmap with another value.
>
> 'qpl_map_size' is used in 'drivers/net/ethernet/google/gve/gve.h' with
> 'find_[first|next]_zero_bit()'.
> So, it looks that memory after the allocated 'qpl_id_map' could be
> scanned.

find_first_zero_bit takes a length argument in bits:

    /**
     * find_first_zero_bit - find the first cleared bit in a memory region
     * @addr: The address to start the search at
     * @size: The maximum number of bits to search

qpl_map_size is passed to find_first_zero_bit.

It does seem roundabout to compute first the number of longs needed to
hold num_qpl bits

    BITS_TO_LONGS(num_qpls)

then again compute the number of bits in this buffer

    * sizeof(unsigned long) * BITS_PER_BYTE

Which will simply be num_qpls again.

But, removing BITS_PER_BYTE does not arrive at the right number.


>
> Remove the '* BITS_PER_BYTE' to have allocation and length be the same.
>
> Fixes: f5cedc84a30d ("gve: Add transmit and receive support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is completely speculative and un-tested!
> You'll be warned.
> ---
>  drivers/net/ethernet/google/gve/gve_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
> index 7647cd05b1d2..19fe9e9b62f5 100644
> --- a/drivers/net/ethernet/google/gve/gve_main.c
> +++ b/drivers/net/ethernet/google/gve/gve_main.c
> @@ -866,7 +866,7 @@ static int gve_alloc_qpls(struct gve_priv *priv)
>         }
>
>         priv->qpl_cfg.qpl_map_size = BITS_TO_LONGS(num_qpls) *
> -                                    sizeof(unsigned long) * BITS_PER_BYTE;
> +                                    sizeof(unsigned long);
>         priv->qpl_cfg.qpl_id_map = kvcalloc(BITS_TO_LONGS(num_qpls),
>                                             sizeof(unsigned long), GFP_KERNEL);
>         if (!priv->qpl_cfg.qpl_id_map) {
> --
> 2.30.2
>
