Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54726C38A02
	for <kernel-janitors@archiver.kernel.org>; Mon, 31 Oct 2022 05:02:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiJaFCN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 31 Oct 2022 01:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiJaFCM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 31 Oct 2022 01:02:12 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6732DF7
        for <kernel-janitors@vger.kernel.org>; Sun, 30 Oct 2022 22:02:11 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id u6so9756347plq.12
        for <kernel-janitors@vger.kernel.org>; Sun, 30 Oct 2022 22:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uDjg4uH0r+JoOISg95SGX9XRNnfp6SD9EIvUd8ZzaWo=;
        b=tfN27Tl/q8rno8rtytwbtBif+PjYI0c4x0xtyjnPbBJYQ1XnK8K+goMSuquKJ0/ZSp
         RQjgCyR+NmpWwh5iyeyV75y7iJthoZLZIA/JbWWxk1JAtjH5MIri8KE8LZefJZ4WZxU0
         18alFqQZ6zTnLB0L1f9qxi1PUAc2iHcT61tVEuY9WnFIungMgs1qw5VyrN4Wwo4ak78x
         84mZYjxBcHm+nMyESiVbwroMpEdFFDRgapSBgUbhyhOyaZAigdSP2bf7VM5Za0BX+CGF
         RYU/W0FUEKBfqbtMNpONfOMiCJwFdiFOExaEeVrfx+8CFUI6rzQ5WLhFB+DIs1mYta4A
         tLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDjg4uH0r+JoOISg95SGX9XRNnfp6SD9EIvUd8ZzaWo=;
        b=X7TH2q/yEz4IeH2HUQ6rR4ga5TNqHOteJV2qctwn0AF5oyYamGVNFATYQnzScHPwnb
         sKaZlw2nKpR3+yf2Bq2MwphirO1CtHQ1oT/8FbA/wKmd8dSsGqZoxULa4S4OyfFeaYq9
         hU6eRN56RAJARVayUe61ddjpIFmowt0gig5fDufpNUvDD6uFrmdc4k8eGbMggy5PFnk1
         2s9n0nEJGZYYAPPoqdqYhHK0zrBvNUd4odBeFPePGR6IJ5UsLI9bcbliUtD0RD+2naev
         07onba94PZxLNovrI/C2PXSyMin66V6tl3nvjSHDQRB9oIP3Kv6tWwxfd6nBI7bNqe90
         /NYA==
X-Gm-Message-State: ACrzQf3Ik7k4m5NrFwNf8RqLSFA1YNqDh8b1N+TTgidBRxrbsblmDu9v
        FN3bXewmRJYb+LCxCrcUD3TRWWmoaLdjrw==
X-Google-Smtp-Source: AMsMyM71QZdODHslmMTtD01qkOXN+tVMZ4CVyl/ohABES5Mv+ZqPMnotvdT5gbDuch6LZCl6U89JCg==
X-Received: by 2002:a17:90a:af83:b0:213:d08f:a47f with SMTP id w3-20020a17090aaf8300b00213d08fa47fmr6625567pjq.28.1667192531035;
        Sun, 30 Oct 2022 22:02:11 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id x66-20020a623145000000b00565cf8c52c8sm3591502pfx.174.2022.10.30.22.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:02:10 -0700 (PDT)
Date:   Mon, 31 Oct 2022 10:32:08 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] thermal/core: fix error code in
 __thermal_cooling_device_register()
Message-ID: <20221031050208.qkmfyspgfg4z6dzv@vireshk-i7>
References: <Y1vvCrOMne0XNORj@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1vvCrOMne0XNORj@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 28-10-22, 18:02, Dan Carpenter wrote:
> Return an error pointer if ->get_max_state() fails.  The current code
> returns NULL which will cause an oops in the callers.
> 
> Fixes: c408b3d1d9bb ("thermal: Validate new state in cur_state_store()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/thermal/thermal_core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index 4ba7b524e5de..c4d18e462de8 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -892,7 +892,8 @@ __thermal_cooling_device_register(struct device_node *np,
>  	cdev->device.class = &thermal_class;
>  	cdev->devdata = devdata;
>  
> -	if (cdev->ops->get_max_state(cdev, &cdev->max_state))
> +	ret = cdev->ops->get_max_state(cdev, &cdev->max_state);
> +	if (ret)
>  		goto out_kfree_type;
>  
>  	thermal_cooling_device_setup_sysfs(cdev);

Bad mistake.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
-- 
viresh
