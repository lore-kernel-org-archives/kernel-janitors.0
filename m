Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2570C7619A
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 Apr 2023 03:35:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjDCDff (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 2 Apr 2023 23:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbjDCDfe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 2 Apr 2023 23:35:34 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0006EB7
        for <kernel-janitors@vger.kernel.org>; Sun,  2 Apr 2023 20:35:32 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id z18so16605924pgj.13
        for <kernel-janitors@vger.kernel.org>; Sun, 02 Apr 2023 20:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680492932;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/D4pTl4jFzV4jgHwDP3sW1Lt1J55i00u3GAQnSTJoQQ=;
        b=mDPqR5a6pMJJzyPRzXU8LTfrkGs2hUub739GYGKZRnBQ3D3+Ev6tXSvvmYnmW9n3Kb
         W2cX8vNKSBSi9J0xnBiyb+hP5dayw9BPQD2Ydg+TZJEoWR1vux7je3WmHI4SlbWJ72Oo
         WuMjgWDoECvTFfbeVmUL/yYP1xNm8EQvhBORJeYfAB4c0VWZ3LhrdyBn6yDivKSe7NJC
         N0czeT3FUw/4IYpfTApoYqjk0nYpTfT25LQPu4svY2oEYhRSqqufDzzrDxteGJ2boTYy
         xYYnlTV1LkQAhro3RadcySCGSI1+sB5a4TI+Ksp8ZQcWCSRDl+XI1LYO2AxhPhpwZRoE
         PKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680492932;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/D4pTl4jFzV4jgHwDP3sW1Lt1J55i00u3GAQnSTJoQQ=;
        b=VJghxpXSBfdIpSvtcPp3wY7gDK7jOkxQ+BRM02Iqkxr9pFI1aL0YnJTjC48Biybr6d
         MvJeE/ynTbUbvh5Jb9BVT4oBjVFw3vF/W+vQmjHZKXWPYtk/c1bIDr27MNCiEMdURSNs
         XaSOsmLsqZup4rn+eY/XpMS7EvN6dh+GtnzsaJ7rmsb3jsiQMCt49gFnNrE4rq+xLxi2
         VBQ3ilwgH+oaXpO2MUAha30C28f7pdgLlW+6L9LIVeQWFpcPNt4U/se/ztfW9G2t38hB
         JQgRXlLanywEp8vJKl3znDOb0feakA44eI93lZde7mstO7ganh4r0oPHiwNsnysJ9BG/
         WU3A==
X-Gm-Message-State: AAQBX9d0/dpd1jDqN+1e4LFdruqvGa2JM+LFgwqLNNRt8zmzRWhtYaK6
        EBAc1svZt33Hwtkr4IUeVHV4zw==
X-Google-Smtp-Source: AKy350ZcXokqcVbSfXh0/U/C+8KTXx9rbwWKFpC4NaX5XoDdZvPnEORMc6ZhHnuCbOGGp7xwcmH40g==
X-Received: by 2002:a62:1c45:0:b0:626:1523:b10d with SMTP id c66-20020a621c45000000b006261523b10dmr35575121pfc.4.1680492931885;
        Sun, 02 Apr 2023 20:35:31 -0700 (PDT)
Received: from localhost ([122.172.85.168])
        by smtp.gmail.com with ESMTPSA id 9-20020aa79149000000b0062dd28aaca6sm5614107pfi.212.2023.04.02.20.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 20:35:31 -0700 (PDT)
Date:   Mon, 3 Apr 2023 09:05:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>, cocci@inria.fr,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH resent] cpufreq: sparc: Fix exception handling in two
 functions
Message-ID: <20230403033529.x6n3ihhkypwizq3b@vireshk-i7>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <b3cce5b3-2e68-180c-c293-74d4d9d4032c@web.de>
 <2d125f3e-4de6-cfb4-2d21-6e1ec04bc412@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d125f3e-4de6-cfb4-2d21-6e1ec04bc412@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 25-03-23, 15:02, Markus Elfring wrote:
> Date: Sat, 18 Mar 2023 11:40:11 +0100
> 
> The label “err_out” was used to jump to another pointer check despite of
> the detail in the implementation of the functions “us2e_freq_init”
> and “us3_freq_init” that it was determined already that the corresponding
> variable contained a null pointer (because of a failed memory allocation).
> 
> 1. Use additional labels.
> 
> 2. Reorder jump targets at the end.
> 
> 3. Delete an extra pointer check which became unnecessary
>    with this refactoring.
> 
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac ("Linux-2.6.12-rc2")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/cpufreq/sparc-us2e-cpufreq.c | 12 ++++++------
>  drivers/cpufreq/sparc-us3-cpufreq.c  | 12 ++++++------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/cpufreq/sparc-us2e-cpufreq.c b/drivers/cpufreq/sparc-us2e-cpufreq.c
> index 92acbb25abb3..8534d8b1af56 100644
> --- a/drivers/cpufreq/sparc-us2e-cpufreq.c
> +++ b/drivers/cpufreq/sparc-us2e-cpufreq.c
> @@ -324,12 +324,12 @@ static int __init us2e_freq_init(void)
>  		ret = -ENOMEM;
>  		driver = kzalloc(sizeof(*driver), GFP_KERNEL);
>  		if (!driver)
> -			goto err_out;
> +			goto reset_freq_table;

I would just return error from here.

> 
>  		us2e_freq_table = kzalloc((NR_CPUS * sizeof(*us2e_freq_table)),
>  			GFP_KERNEL);
>  		if (!us2e_freq_table)
> -			goto err_out;
> +			goto free_driver;
> 
>  		driver->init = us2e_freq_cpu_init;
>  		driver->verify = cpufreq_generic_frequency_table_verify;
> @@ -346,11 +346,11 @@ static int __init us2e_freq_init(void)
>  		return 0;
> 
>  err_out:
> -		if (driver) {
> -			kfree(driver);
> -			cpufreq_us2e_driver = NULL;
> -		}
>  		kfree(us2e_freq_table);
> +free_driver:
> +		kfree(driver);
> +		cpufreq_us2e_driver = NULL;
> +reset_freq_table:
>  		us2e_freq_table = NULL;

This wasn't set at this point, no point clearing it here. Also this
clearing of global variables isn't required at all, as after this
point no other function shall get called.

similar comments for the other file.

>  		return ret;
>  	}
> diff --git a/drivers/cpufreq/sparc-us3-cpufreq.c b/drivers/cpufreq/sparc-us3-cpufreq.c
> index e41b35b16afd..325f61bb2e40 100644
> --- a/drivers/cpufreq/sparc-us3-cpufreq.c
> +++ b/drivers/cpufreq/sparc-us3-cpufreq.c
> @@ -172,12 +172,12 @@ static int __init us3_freq_init(void)
>  		ret = -ENOMEM;
>  		driver = kzalloc(sizeof(*driver), GFP_KERNEL);
>  		if (!driver)
> -			goto err_out;
> +			goto reset_freq_table;
> 
>  		us3_freq_table = kzalloc((NR_CPUS * sizeof(*us3_freq_table)),
>  			GFP_KERNEL);
>  		if (!us3_freq_table)
> -			goto err_out;
> +			goto free_driver;
> 
>  		driver->init = us3_freq_cpu_init;
>  		driver->verify = cpufreq_generic_frequency_table_verify;
> @@ -194,11 +194,11 @@ static int __init us3_freq_init(void)
>  		return 0;
> 
>  err_out:
> -		if (driver) {
> -			kfree(driver);
> -			cpufreq_us3_driver = NULL;
> -		}
>  		kfree(us3_freq_table);
> +free_driver:
> +		kfree(driver);
> +		cpufreq_us3_driver = NULL;
> +reset_freq_table:
>  		us3_freq_table = NULL;
>  		return ret;
>  	}
> --
> 2.40.0

-- 
viresh
