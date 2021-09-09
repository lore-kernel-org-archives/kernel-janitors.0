Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0530AC433F5
	for <kernel-janitors@archiver.kernel.org>; Thu,  9 Sep 2021 18:02:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB304610C9
	for <kernel-janitors@archiver.kernel.org>; Thu,  9 Sep 2021 18:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242874AbhIISDN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 9 Sep 2021 14:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241252AbhIISDM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Sep 2021 14:03:12 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B04C061574
        for <kernel-janitors@vger.kernel.org>; Thu,  9 Sep 2021 11:02:03 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id h3so1753681pgb.7
        for <kernel-janitors@vger.kernel.org>; Thu, 09 Sep 2021 11:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dJQXSJ02QMh+Wh7r1j+JbzURrGUV/gl8Hy7GcnqmOCI=;
        b=l/yR86TfFYKMMSesXKkjFyGszNrXtteqULk8eK5GjHYPDdsbR43JcpmjHS1f3NAmxD
         QD3Kol0cxHDikvOQDK8v2qEPw0Vn9VNa4YmNhlWEoUTOGgv33+lmPPQ16WHIzgQB1oAC
         Xo+RE0uy9dyt2wsE7qbPMXw5wC3k2KHgExJYHuC/awA9XMW4mRr6uOYeve7AVPgpuZra
         1RAa6h5XYx99F+k3uOLWAbU4AQk1NTUUTsSZ++QA5GUjwsCn//HxcjTSDfyBHE8iZ8TK
         8zW2z9RSxQnvnljsOM4mws/JI1THcrY+J5isVCIuudNuF8zzfU/ORIpWBbMlR3lGfasV
         h+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dJQXSJ02QMh+Wh7r1j+JbzURrGUV/gl8Hy7GcnqmOCI=;
        b=NwW7XcmOo+eOYMA8NjZR1cCzWSNvuPWJrbJdvwdFXiFAnqjXlxn3xgFcoNleMvbd6T
         fa/CUeYRfdqnEaxop73r/UU8by3W7g3I+FM+LLY2dp5G8pT30TYjP9cqXvk3IEKCfcjt
         /5tAwWQW0oDqlTdgL0M1/X3CTzZboAPgwms6UTfNz1s4j++3htmXFChSxql+Z8e624eu
         2J3RUUpqvOyWDohGT9LEebWrFMevG0DgOV/4zuDpS1KD7zhOU4AnaIK/spxMXhB6ZCbq
         gMracse34NEGNc6tuE02318L4hj9qaFdXimYBq9uX31C+rx6E/qvvOsdyC7rWPeDuUE/
         K/ww==
X-Gm-Message-State: AOAM533k2fafMtQv0YV9Opf9Zc2qmcBKBo2E6vXC/14EtexPNcF0lCUi
        aT5w1dXcxywULxZKzr2tpTepJA==
X-Google-Smtp-Source: ABdhPJypPX2nDxAW3yVEJa6gTathAPgYr+otR+hNxtAmfzad85U54J1YqFfluXKmhDFTlwErlZGh5w==
X-Received: by 2002:aa7:8617:0:b0:3f2:3cb2:33bc with SMTP id p23-20020aa78617000000b003f23cb233bcmr4338983pfn.36.1631210522767;
        Thu, 09 Sep 2021 11:02:02 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id p12sm2788993pff.106.2021.09.09.11.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:02:01 -0700 (PDT)
Date:   Thu, 9 Sep 2021 12:01:59 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        james.quinlan@broadcom.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Fix a memory leak in an error handling path
 in 'rproc_handle_vdev()'
Message-ID: <20210909180159.GA1388472@p14s>
References: <e6d0dad6620da4fdf847faa903f79b735d35f262.1630755377.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6d0dad6620da4fdf847faa903f79b735d35f262.1630755377.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Sep 04, 2021 at 01:37:32PM +0200, Christophe JAILLET wrote:
> If 'copy_dma_range_map() fails, the memory allocated for 'rvdev' will leak.
> Move the 'copy_dma_range_map()' call after the device registration so
> that 'rproc_rvdev_release()' can be called to free some resources.
> 
> Also, branch to the error handling path if 'copy_dma_range_map()' instead
> of a direct return to avoid some other leaks.
> 
> Fixes: e0d072782c73 ("dma-mapping: introduce DMA range map, supplanting dma_pfn_offset")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> Review with care. I don't like to move code around because of possible
> side-effect.
> ---
>  drivers/remoteproc/remoteproc_core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 502b6604b757..775df165eb45 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -556,9 +556,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	/* Initialise vdev subdevice */
>  	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>  	rvdev->dev.parent = &rproc->dev;
> -	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> -	if (ret)
> -		return ret;
>  	rvdev->dev.release = rproc_rvdev_release;
>  	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>  	dev_set_drvdata(&rvdev->dev, rvdev);
> @@ -568,6 +565,11 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  		put_device(&rvdev->dev);
>  		return ret;
>  	}
> +
> +	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
> +	if (ret)
> +		goto free_rvdev;
> +

Good catch.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	/* Make device dma capable by inheriting from parent's capabilities */
>  	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
>  
> -- 
> 2.30.2
> 
