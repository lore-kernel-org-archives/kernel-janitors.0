Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9049EC433B4
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 09:24:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CB13613BB
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 09:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239187AbhDMJYg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Apr 2021 05:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239454AbhDMJYe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Apr 2021 05:24:34 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33FD9C061574
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Apr 2021 02:24:14 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id y204so6929853wmg.2
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Apr 2021 02:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q/ZG+pCcF9dWPEWXNf+sTrl+9ocn3tujNZhS/yVRHoY=;
        b=WgtR6uJ2GYaDkNUBtlk1alYw407nGKyIKWQ6rNbBFEtGxPGXAaUvmJqds6RoKjsPYj
         QjRDwyFAJNQA3cdmiuh6Xm0GbWSyR70m/80C7sccunne+PywBlKlTLsbxZJ41Fi4FA7N
         ydTtKpbmmhs4xugElMGX3LsGxV44QaR7FpU0blEwOoc9S4IJu1ajipv7OH5D2A3FDa7I
         loj16JPo8loeYCa/5Z4dlW/tvc5tJuXUl0gXeeXhvxE63KAZQ9N38lXQBFtN00kp2V1R
         TliA3bTkJLflNq05v5qMRGkuvI86kXna1SHZc+8ZkIUgf4WTOYO9f/WLn0lHv55Ogp42
         MdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q/ZG+pCcF9dWPEWXNf+sTrl+9ocn3tujNZhS/yVRHoY=;
        b=qRmhVm7HJKK+ux502a7vuwoSyD0X5Ec/oXudU5+gJ2sC9Xiu1y4LcZyMdcp4aVByeO
         HliFB+DKUr2qmDhV7rPhV66b3GmksIgNOozP11er65e0zBaDCawxrBSd1ayzdSC8LZQd
         R3zobUg/tdHR/w9O+LemFcEWMzpjvCqcY3aHONsh76jfuv5RwziMwebSNs6UrXS5jMek
         U4qAb4tWogHeNTdYNtufjY60y+1gW1pJxAfzp/uYwNt2lfuZjXXzE3vLBeWb6dvJDa6C
         X3OgDI5P+Oa5jpauU7Q1jkzIq3qVDSFIxEc9p0LIhfO9lrRcFCADFEvv3gPZ0fSEJJ4R
         KGOw==
X-Gm-Message-State: AOAM530f1G34hKvdrIpri5kkSWno+bmGHochuVG8OCXN8VgeR5g45KYB
        EAqDC6CyNoCu+/JxVrPY8sGmkA==
X-Google-Smtp-Source: ABdhPJzM0s6uitdjPDyGqTnxZF+cYb4kinVMj8YyWDY7q2hwt3JZKeacKfRXSr/WieOP3ypRTT4wXQ==
X-Received: by 2002:a1c:6446:: with SMTP id y67mr3049107wmb.145.1618305852795;
        Tue, 13 Apr 2021 02:24:12 -0700 (PDT)
Received: from google.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id a22sm11064362wrc.59.2021.04.13.02.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 02:24:12 -0700 (PDT)
Date:   Tue, 13 Apr 2021 09:24:09 +0000
From:   Quentin Perret <qperret@google.com>
To:     Peng Wu <wupeng58@huawei.com>
Cc:     mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] sched/topology: Make some symbols static
Message-ID: <YHVjOeSGT3xe2smj@google.com>
References: <1617887537-38438-1-git-send-email-wupeng58@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617887537-38438-1-git-send-email-wupeng58@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thursday 08 Apr 2021 at 21:12:17 (+0800), Peng Wu wrote:
> The sparse tool complains as follows:
> 
> kernel/sched/topology.c:211:1: warning:
>  symbol 'sched_energy_mutex' was not declared. Should it be static?
> kernel/sched/topology.c:212:6: warning:
>  symbol 'sched_energy_update' was not declared. Should it be static?
> 
> This symbol is not used outside of topology.c, so this
> commit marks it static.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Peng Wu <wupeng58@huawei.com>
> ---
>  kernel/sched/topology.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index d1aec244c027..25c3f88d43cd 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -208,8 +208,8 @@ sd_parent_degenerate(struct sched_domain *sd, struct sched_domain *parent)
>  #if defined(CONFIG_ENERGY_MODEL) && defined(CONFIG_CPU_FREQ_GOV_SCHEDUTIL)
>  DEFINE_STATIC_KEY_FALSE(sched_energy_present);
>  unsigned int sysctl_sched_energy_aware = 1;
> -DEFINE_MUTEX(sched_energy_mutex);
> -bool sched_energy_update;
> +static DEFINE_MUTEX(sched_energy_mutex);
> +static bool sched_energy_update;
>  
>  void rebuild_sched_domains_energy(void)
>  {
>

FWIW, that has been reported some time ago:

https://lore.kernel.org/lkml/1606218731-3999-1-git-send-email-zou_wei@huawei.com/
https://lore.kernel.org/lkml/1606271447-74720-1-git-send-email-zou_wei@huawei.com/

But otherwise, this looks OK to me.

Thanks,
Quentin
