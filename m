Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEE5C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 Nov 2021 19:36:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237839AbhKWTjU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 Nov 2021 14:39:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30973 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236257AbhKWTjK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Nov 2021 14:39:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637696160;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rZfv1IAB1L4OKPDv7Z7zl3z7pjV3ugHQdTctCyaDB7o=;
        b=QwryxxP27AkmZ0u8hNazhVijs7Y63O7OG8tElYLU8XTZBFYMx5ELvNWL551TsgQWw2kuTP
        ouGUG89dNVp5+6cjOxGACj3JjDODWHkh9fGvWJ1A9XAg6vV3r+TLlO3a1qeMbdNiwhQ1QL
        E756sjRykyPSsCX2vtStEQ7yFNgOcrc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-Luiw5rabO9e2gjcPSpEFJA-1; Tue, 23 Nov 2021 14:35:58 -0500
X-MC-Unique: Luiw5rabO9e2gjcPSpEFJA-1
Received: by mail-qk1-f200.google.com with SMTP id w2-20020a3794020000b02903b54f40b442so227767qkd.0
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Nov 2021 11:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=rZfv1IAB1L4OKPDv7Z7zl3z7pjV3ugHQdTctCyaDB7o=;
        b=F8rDBMGqIYli/fqaoswHRBM9iOINmlCBEaCWr1hvpIOec/Ujlwh21EcPtBNQc83hJ/
         CobZST1Uw1wyydp3NNInwNhhU9ztrY+QtdKbJSWFEXz6+jiuKjnECTByKd/rXahFv8qM
         b93zo34A2OkEwiTC6avbsWW5SSH6HqVFTginkAWSunAKHtHD7Zg1KdZsj+NOBe6XgdIy
         j3/4Viln1QQkXVSj7otU+lnP7mLtnj4DJ/pe/6V5ttp/IV2NrNIQi9dDjAkzqM6GBqNd
         olZ7/EOcF//EfGYD16AhMuUHeAxT7ByAvdFPzjZbELyOfFfgMWk6iSHdI+lQ1hucei+2
         OEvQ==
X-Gm-Message-State: AOAM530BmBHi6440hNnwr4kZ1ewy5pBB0sgnoB2YILkmkvahp+AlkwIa
        R9ARxBFq+HpBEmqlfa9hlbujqPsIoPloIXhQHtU1PO2iHZgpDZWWD9U05GDVH1c6zOv0nbH8dTq
        MmWa35Pe+l7mLCFC92dBKC39WSm8s
X-Received: by 2002:a05:622a:13c9:: with SMTP id p9mr9530982qtk.47.1637696158310;
        Tue, 23 Nov 2021 11:35:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwd9aJm8SZb+wfUFsxDgSU42rVqDIpUUlYw//me57YbMeMFl74fEpjtGIzlLmPaOts6c7+/Mg==
X-Received: by 2002:a05:622a:13c9:: with SMTP id p9mr9530939qtk.47.1637696158082;
        Tue, 23 Nov 2021 11:35:58 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net. [96.230.249.157])
        by smtp.gmail.com with ESMTPSA id m15sm6726097qkp.76.2021.11.23.11.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 11:35:57 -0800 (PST)
Message-ID: <4dd933d333194ff8a676fcafdd5c9ef19f002c92.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/acr: fix a couple NULL vs IS_ERR() checks
From:   Lyude Paul <lyude@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Ben Skeggs <bskeggs@redhat.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date:   Tue, 23 Nov 2021 14:35:55 -0500
In-Reply-To: <20211118111314.GB1147@kili>
References: <20211118111314.GB1147@kili>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push this to drm-misc in a bit

On Thu, 2021-11-18 at 14:13 +0300, Dan Carpenter wrote:
> The nvkm_acr_lsfw_add() function never returns NULL.  It returns error
> pointers on error.
> 
> Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace
> "secure boot"")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c | 6 ++++--
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> index cdb1ead26d84..82b4c8e1457c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gm200.c
> @@ -207,11 +207,13 @@ int
>  gm200_acr_wpr_parse(struct nvkm_acr *acr)
>  {
>         const struct wpr_header *hdr = (void *)acr->wpr_fw->data;
> +       struct nvkm_acr_lsfw *lsfw;
>  
>         while (hdr->falcon_id != WPR_HEADER_V0_FALCON_ID_INVALID) {
>                 wpr_header_dump(&acr->subdev, hdr);
> -               if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id))
> -                       return -ENOMEM;
> +               lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)-
> >falcon_id);
> +               if (IS_ERR(lsfw))
> +                       return PTR_ERR(lsfw);
>         }
>  
>         return 0;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> index fb9132a39bb1..fd97a935a380 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/gp102.c
> @@ -161,11 +161,13 @@ int
>  gp102_acr_wpr_parse(struct nvkm_acr *acr)
>  {
>         const struct wpr_header_v1 *hdr = (void *)acr->wpr_fw->data;
> +       struct nvkm_acr_lsfw *lsfw;
>  
>         while (hdr->falcon_id != WPR_HEADER_V1_FALCON_ID_INVALID) {
>                 wpr_header_v1_dump(&acr->subdev, hdr);
> -               if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->falcon_id))
> -                       return -ENOMEM;
> +               lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)-
> >falcon_id);
> +               if (IS_ERR(lsfw))
> +                       return PTR_ERR(lsfw);
>         }
>  
>         return 0;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

