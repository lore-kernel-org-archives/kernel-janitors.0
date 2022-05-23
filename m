Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9E5C433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 May 2022 19:52:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbiEWTwh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 May 2022 15:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbiEWTwV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 May 2022 15:52:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CB71F60052
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 12:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653335536;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KOYC9iIBfV1vzZrPUZwk0oyKY1xPZWZ/ayniepgLDTs=;
        b=eT6/ydLrLnAZFrKlyEznc9q50dQ8RlJKkQfWSefyKc2pAd2k0cOWbH1oBdubGMkP9V5cFa
        /NyhBTYaa3SrXWVhDNwNBvM93S/kFTfYuOEdFiDpFZBGHvV5iSJOclh11B/J24AuhogFIi
        MZk7TW8qly7k+yqObieG9jXDpG1Bjg0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-PE38Vc--MWWQarA6dFoNlA-1; Mon, 23 May 2022 15:52:15 -0400
X-MC-Unique: PE38Vc--MWWQarA6dFoNlA-1
Received: by mail-qt1-f200.google.com with SMTP id m5-20020a05622a118500b002f92201d3fbso6262893qtk.18
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 12:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=KOYC9iIBfV1vzZrPUZwk0oyKY1xPZWZ/ayniepgLDTs=;
        b=Q3jon5F1uuJAFyee++bvy/QaUfeGxlp6a61ezgLt9S1E0j9XAQPR7MW8m/AKh7hQN2
         WZ7QjtIstBSY3IJo9UnvdoxaB4iQtKPj867TBkCcpNIAJBuS3hGivctW2R+fPSmHfjwi
         xmCWCC2RrHhzPPz0lVWcoFIIIFZi9t/Sx9APLBRmMr+rIuVM65Rcitvwy6ZjpZamLgsf
         7tfsBosauOT6gVCMd0q6T95kCw942TKD54xrXEmUQtPm4ysDv++X0rcVpMTv6hMEPfRF
         qQzABOWRp1L5wpD4oQuy+SbIy8g+JfxzXOjm1kBepfoDNX0vIb+ZCbZtTYt8c+Scn9VY
         zVFQ==
X-Gm-Message-State: AOAM530z0EkAYl9vJIan3M7VBmk7d+eCT1cmUgOt9jibzMCFiZjwXm+W
        y/vKhl7VPtPJ+V3mFUq2+nNOqm0hTm6c/b9OEG7NCH0n2ML2m9SAWNdnbrSbKJF75TT8Gsl8Omz
        Sonmb2kWlYP7imxdncBF1JDCAJ1iw
X-Received: by 2002:a37:6650:0:b0:6a3:5fb9:7ff7 with SMTP id a77-20020a376650000000b006a35fb97ff7mr8582259qkc.90.1653335535109;
        Mon, 23 May 2022 12:52:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgZ4upgTLufDFLOHGMjBcNkvM4E+LvXn+UyvlAfFfBcrNLQCi/YNJUO8bUY6aCMfrUg56p0w==
X-Received: by 2002:a37:6650:0:b0:6a3:5fb9:7ff7 with SMTP id a77-20020a376650000000b006a35fb97ff7mr8582253qkc.90.1653335534913;
        Mon, 23 May 2022 12:52:14 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net. [71.184.137.158])
        by smtp.gmail.com with ESMTPSA id v128-20020a372f86000000b006a33009158esm4838303qkh.119.2022.05.23.12.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 12:52:12 -0700 (PDT)
Message-ID: <70daebd6d65b34f5ab85f0286df9a539b5c62146.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/mmu: fix typo in comment
From:   Lyude Paul <lyude@redhat.com>
To:     Julia Lawall <Julia.Lawall@inria.fr>,
        Ben Skeggs <bskeggs@redhat.com>
Cc:     kernel-janitors@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 23 May 2022 15:52:11 -0400
In-Reply-To: <20220521111145.81697-57-Julia.Lawall@inria.fr>
References: <20220521111145.81697-57-Julia.Lawall@inria.fr>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will fix that double space after the punctuation while I'm at it as well, and
will push to the appropriate branch in a little bit. Thanks!

On Sat, 2022-05-21 at 13:11 +0200, Julia Lawall wrote:
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> index 8bf00b396ec1..8b11dfa0998d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -280,7 +280,7 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool pfn,
> u32 ptei, u32 ptes)
>         if (desc->type == SPT && (pgt->refs[0] || pgt->refs[1]))
>                 nvkm_vmm_unref_sptes(it, pgt, desc, ptei, ptes);
>  
> -       /* PT no longer neeed?  Destroy it. */
> +       /* PT no longer needed?  Destroy it. */
>         if (!pgt->refs[type]) {
>                 it->lvl++;
>                 TRA(it, "%s empty", nvkm_vmm_desc_type(desc));
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

