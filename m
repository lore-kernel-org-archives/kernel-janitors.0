Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EBCC77B7A
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 May 2023 08:32:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234690AbjEaIce (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 31 May 2023 04:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234887AbjEaIcD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 May 2023 04:32:03 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9A113D
        for <kernel-janitors@vger.kernel.org>; Wed, 31 May 2023 01:31:58 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f60dfc6028so57152495e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 31 May 2023 01:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685521917; x=1688113917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WhA/sfDRnLuDCN7yHv6nCUiMzZVvvoBjYdsSnPZ2b68=;
        b=Qf9zKFrn4Y6OFuEjXy7xAuVGz/ckgeam+xe7JLoo1sZ2JIwV3Zle4eGVrClGw0Suuu
         EuPu5XqzoGtSat0xDB8XzH//945LkSMdRioWZ07l3M+g3sQPSG6k5rbbiURKiTm3B7io
         beFK2eG3qQGuU7oqTYBxDur924FFE9Kd6DwSCXq6CmSdUPSY7ZYVbroOjtE0rOpBialT
         2pRHtuwWKBsxHuAUF0xHP+WoE6Cpl5WLqdOnWc2v6+hVQ1Y3woLNfCrW5f8kxg0qVI9C
         WdnZVK5XxDrJP5HkDypnDQoH7zGtbRZct9zHWKgpsrYdownAuH6HRocfvXIjm7fhRODu
         PeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521917; x=1688113917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhA/sfDRnLuDCN7yHv6nCUiMzZVvvoBjYdsSnPZ2b68=;
        b=fHadYiIBKyLq5FErafZrjGcdy7mqZP09aD3fTkuXBlNnpJJWSL9znqVxhXOF6nHvyY
         GwVe1igiECaLSM6BOQIxfdkN4PyhtbEjtmZHwzEMY+Jsr7iuG0QqjeScF4XQHDgVY+SA
         pHdUDpDkrQDcxEhUS+qTDZAeUjRKeLARaADoiHDZhlDqaU0VZ36ziiKr9PUik/iIFLa+
         JROk4cfivDF0UE6eZzrO4suiIRRVn3hi11rQ+DllZnIqIJ7hsruWAJ7vLO9K1T0/Bj+8
         xmWN9E7HqeVDXG7ov5ThLC/ZvnJY6K+2tG9/Egm0B77/d7zFSlacEZpgyOWxqpScV9yp
         fJig==
X-Gm-Message-State: AC+VfDxNOW77zd1ZHA62Wli8YqePZx638Xp2691ZVEpduKKIfVdxN9ZA
        tK6yPq/QLgBgj8ZRa86cRJuprA==
X-Google-Smtp-Source: ACHHUZ4S5/0dJg8BIO5Y3X1Ar+fFJRW029hscEdyzxU/RK6FIShaB3l5woWFqtMhhmxltyEBwA5dOw==
X-Received: by 2002:a1c:f216:0:b0:3f1:7581:eaaf with SMTP id s22-20020a1cf216000000b003f17581eaafmr3223629wmc.4.1685521916624;
        Wed, 31 May 2023 01:31:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q13-20020a7bce8d000000b003f43f82001asm23557270wmj.31.2023.05.31.01.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:31:54 -0700 (PDT)
Date:   Wed, 31 May 2023 11:31:50 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, airlied@redhat.com,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau/nvif: use struct_size()
Message-ID: <00e84595-e2c9-48ea-8737-18da34eaafbf@kili.mountain>
References: <20230531043826.991183-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531043826.991183-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, May 31, 2023 at 12:38:26PM +0800, Su Hui wrote:
> Use struct_size() instead of hand writing it.
> This is less verbose and more informative.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/gpu/drm/nouveau/nvif/object.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
> index 4d1aaee8fe15..4bd693aa4ee0 100644
> --- a/drivers/gpu/drm/nouveau/nvif/object.c
> +++ b/drivers/gpu/drm/nouveau/nvif/object.c
> @@ -65,7 +65,7 @@ nvif_object_sclass_get(struct nvif_object *object, struct nvif_sclass **psclass)
>  	u32 size;
>  
>  	while (1) {
> -		size = sizeof(*args) + cnt * sizeof(args->sclass.oclass[0]);
> +		size = struct_size(args, sclass.oclass, cnt);

This is from the original code, but now that you are using the
struct_size() macro static checkers will complain about it.  (Maybe they
don't yet?).  size is a u32.  Never save struct_size() returns to
anything except unsigned long or size_t.  (ssize_t is also fine, I
suppose).  Otherwise, you do not benefit from the integer overflow
checking.

>  		if (!(args = kmalloc(size, GFP_KERNEL)))
>  			return -ENOMEM;
>  		args->ioctl.version = 0;

regards,
dan carpenter
