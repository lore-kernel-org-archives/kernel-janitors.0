Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E83C433FE
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 May 2022 21:34:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444545AbiEFVhr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 May 2022 17:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239538AbiEFVhp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 May 2022 17:37:45 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874086F4A7
        for <kernel-janitors@vger.kernel.org>; Fri,  6 May 2022 14:34:01 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y32so14634451lfa.6
        for <kernel-janitors@vger.kernel.org>; Fri, 06 May 2022 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Hu54ovJHRyaSZ9Bj4QI31tKxj0E0gusmTA9CouWhVWs=;
        b=E6ubfehEot+x8OIJN5C7LyAh0NxnQYP+RE9/EESVDWl69ZQaV/yxIOwei4gYpMgp9u
         KYGp1mJ19wh4ZbLDI2xwgyR6S0de2pOwrp0ci37vT2JsSZgS2FeN3mfYUZEd/twNI0Uo
         8oUUsnFxi4/8IaLTiOMsbpepGLLSgZABHFSO/557vUiup9JZiPbmIE8FS4tcZePNQJEU
         KJq/NzyOxrQRZnztocLanqCG019/CrdaIDCj7/umEZYOSbLokeOvFfuTfjmE6SKhIJF1
         D4lRuJe51mSe7wTT6KFUmKGmltxmO0g+dsLrToFHKXgK0VVu9PAWaLeqzpi2g+gL5diJ
         h6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Hu54ovJHRyaSZ9Bj4QI31tKxj0E0gusmTA9CouWhVWs=;
        b=cAQxT8cD2HVYgSdb9JWbd+mpaz9YC4wc/2ldzcL5nySlWuQHddy1z4MFmWVUr1slCu
         oHeCkhKagSxpRi1GXXnPl8cMkiPQxxd6VMUAPLYTVnoVJ1jlGOmrenGt18adHoVWqW/E
         pv631+SE4XhZXT/Ob5tv7Wu5G8lwCwrwhDJqoPhLJAjjYWKbnBSGxr6CTZcVXFUv2YqK
         t4ALA9UgwGmyPz6HwOxY80U2Zra5ULG88iUh+KP6dJ2ut9FAy7gbQ6t6ZjRNY55egJ8H
         nQjOM1EiChRD3frQI8b3TNOh7tr50nwEE0UIIkAPt392JSzz8022beF5msL/+7I10Kht
         46BA==
X-Gm-Message-State: AOAM533CO0BdLVmyECJOscmyXoI3WgKhPAwa9WjwAv5c8izY48Jcs6p+
        O+cgpUsYb4hCnOgLoKKAHSiuug==
X-Google-Smtp-Source: ABdhPJyIx7HcnaKtjeqHbF+57hQVC9kVqNcgwjcSjUaE5fY6FOVbRp1itaMTMdwdoIAzxxj0m6KmKw==
X-Received: by 2002:a05:6512:3b28:b0:473:b9ec:187e with SMTP id f40-20020a0565123b2800b00473b9ec187emr3774357lfv.536.1651872839945;
        Fri, 06 May 2022 14:33:59 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651211c800b0047255d211dfsm826080lfr.270.2022.05.06.14.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 14:33:59 -0700 (PDT)
Message-ID: <a78b160a-a173-41c3-0c9a-d7cb7244af98@linaro.org>
Date:   Sat, 7 May 2022 00:33:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/msm: return an error pointer in
 msm_gem_prime_get_sg_table()
Content-Language: en-GB
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
References: <YnOmtS5tfENywR9m@kili>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YnOmtS5tfENywR9m@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 05/05/2022 13:28, Dan Carpenter wrote:
> The msm_gem_prime_get_sg_table() needs to return error pointers on
> error.  This is called from drm_gem_map_dma_buf() and returning a
> NULL will lead to a crash in that function.
> 
> Fixes: ac45146733b0 ("drm/msm: fix msm_gem_prime_get_sg_table()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gem_prime.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index e8f1b7a2ca9c..94ab705e9b8a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -17,7 +17,7 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>   	int npages = obj->size >> PAGE_SHIFT;
>   
>   	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>   
>   	return drm_prime_pages_to_sg(obj->dev, msm_obj->pages, npages);
>   }


-- 
With best wishes
Dmitry
