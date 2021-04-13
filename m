Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DAFC433B4
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 16:23:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 068B8613A9
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 16:23:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245161AbhDMQYM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Apr 2021 12:24:12 -0400
Received: from mail-pj1-f44.google.com ([209.85.216.44]:47061 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343510AbhDMQYM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Apr 2021 12:24:12 -0400
Received: by mail-pj1-f44.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so4437674pja.5
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Apr 2021 09:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nIl7E1TX/AmjEPOYNmcXuzmbZMqP3dlvzU0KBMbKOp8=;
        b=nSzO0TfsAWG7iNgIdwtsAmUq/KQC/DsxJOS3lEsyXoGzuDRa+1Twzq2OGvh0ORC4Pf
         lThDb65mpeKuUxaBA4rV0iOYbKPc02HnnHV0wpbswaeTQ0pnXGo+uqvE8PnfjFCxVqK5
         zLhT5B7Zf9WHyhiCFme93bh0kILdQQqsJb8x5itcawnECE89Kd7mviwZzJc22hLAkR1V
         i/AKIiAQDqUObtsRVLLVmYDdyG1F3M3wNmfkJzRfmzwsPwUUSYnDRwDbWn9fRYrTg45x
         toR2J7tbEiH8McjqjvAYoBVy+yeD8iF71ZVjjXxRklO/Us5B1FiceybdOYAAo6ql26yC
         Ma0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nIl7E1TX/AmjEPOYNmcXuzmbZMqP3dlvzU0KBMbKOp8=;
        b=bdDzWz5HKW2+PpnOjxfuwuYgmuVMer6aBbpYhRsu2EvvzS9zgSRtO6eNzvYCNxQzz1
         R3A5XFvdfpI9bwVIg9DsBWu1b1ZsU8ThaaMT/ul9NSvKOQnQ5z0772TTWxkzO07GxpT2
         7FyKoBkGLXrdJifMhk0giGlDooduF3/wIX5A0j6XNWvw15qnfT0yEWQQOoVNaVbc7rN8
         qd51lp8IqsW9nSsKg2LgQvmaj/aHO0jwV2de/sK4pfBFVd4VDYr0yHFNu/4T0MlPQN92
         abpxdW9zU2kxQsBt43RAYYvcF2TCYXLoucbpdoy/fdnEVsCK8xd80N2gmMYdbefDkEER
         +uqw==
X-Gm-Message-State: AOAM531A2kTtmhnWcgKDD29hlAtjENnfoOzOjTOi9x2p4/lB48TxJD5f
        l2FVDl3wT96MXRyQffyahzSePA==
X-Google-Smtp-Source: ABdhPJxlb6v8B6i2jVK3dUKFBjpwHKXt/PKepGp1gb73a7/jwKnFGhz6KNw7qGNer2xolloWLTPHJw==
X-Received: by 2002:a17:90a:d3c6:: with SMTP id d6mr838920pjw.25.1618330972307;
        Tue, 13 Apr 2021 09:22:52 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id k1sm12329200pff.160.2021.04.13.09.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 09:22:51 -0700 (PDT)
Date:   Tue, 13 Apr 2021 10:22:49 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next v2] coresight: trbe: Fix return value check in
 arm_trbe_register_coresight_cpu()
Message-ID: <20210413162249.GA690529@xps15>
References: <20210409094901.1903622-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409094901.1903622-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Apr 09, 2021 at 09:49:01AM +0000, Wei Yongjun wrote:
> In case of error, the function devm_kasprintf() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value
> check should be replaced with NULL test.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 -> v2: remove fixes tag.
> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

I have picked up both patches.

Thanks,
Mathieu
 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 5ce239875c98..176868496879 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -871,7 +871,7 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
>  
>  	dev = &cpudata->drvdata->pdev->dev;
>  	desc.name = devm_kasprintf(dev, GFP_KERNEL, "trbe%d", cpu);
> -	if (IS_ERR(desc.name))
> +	if (!desc.name)
>  		goto cpu_clear;
>  
>  	desc.type = CORESIGHT_DEV_TYPE_SINK;
> 
