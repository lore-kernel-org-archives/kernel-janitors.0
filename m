Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFC9C7EE22
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 May 2023 09:03:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237123AbjEKJDa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 May 2023 05:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236425AbjEKJD2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 May 2023 05:03:28 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35D74EF6
        for <kernel-janitors@vger.kernel.org>; Thu, 11 May 2023 02:03:24 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1aaebed5bd6so59730905ad.1
        for <kernel-janitors@vger.kernel.org>; Thu, 11 May 2023 02:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683795804; x=1686387804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KF4j5CyhhoHly7+6zDRQTpQulB4Hs5tNYwEh9vRMQE4=;
        b=YmMs7kjfKYYyWyHfwvZwAmtTSWbCMXhCWgomqWLAPDAsZRi64dbY2KaLyqNhBvZPmm
         rrdYp9XxXXgh/1u99nnw05S7wQ0QMJPxenxtGZLtOxN9oGPv+LIDh5Ys5DQnuPydZWKL
         NKPqrBsExnT+2Xay3TcqFK5ysa/ntjZBh+mXFb0umsel20kq3YxMZpYGD/5UV8p/xFEF
         ZFqtjjpqCsY3RCGdmssXPlqrehroYi21G+e8SB+0oOFJGcpfJx6DlPJI48BB1YhPSMGd
         RsW7hE660zXX0HTlak5fLQgKJi4UdE7bv+KjaUl4HFEjn5/twn1wkldlarVKmsdu9MmT
         YZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683795804; x=1686387804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KF4j5CyhhoHly7+6zDRQTpQulB4Hs5tNYwEh9vRMQE4=;
        b=RKbF5s46Eaj7VtQv8T6UG3Kz6IXIbiX7eD9I3D3+/pdgawmy1hkDKrv0UVfmCIzFx5
         XY5mE9e4/G/a/S7JoT38sp5J5TmWGgUWRZXRWiRg2EUctOEyYiNhl6r5oCT8UIZejAiC
         UiKxmVeJFYpVR3A289YZYm8MtuSJnZvfzljDROEkURbl/6Lu3e08qmT0sxsyAXmVNof6
         RgZSnf7uYbP/sPAAaD5488E8lYUvt7atpQYf7lHatl779lQLo5pU+eMoFZAkUQhpGMfF
         WvUAqNJbHYwRVNlMUzsqwCkDexjTr/W9IJ3NmPBZ4SRmol95eAJu3XjdTy8ZYuinKiLl
         FKZw==
X-Gm-Message-State: AC+VfDxLTdLyTSRnA+K0VYP23+DQdHIpmea+6h4/M065txdG7J8Oezpc
        vIKWz59dr6CI0C0v3ctMBuk4RA==
X-Google-Smtp-Source: ACHHUZ63/YRTo/PA+R0p5ahIhniwqM2nvsGADq/sNcmBmY7IgJvtr8ka1R9fQKWxbAW6e3OL95ZS2w==
X-Received: by 2002:a17:902:e545:b0:1ac:a661:a4c9 with SMTP id n5-20020a170902e54500b001aca661a4c9mr10103193plf.33.1683795804247;
        Thu, 11 May 2023 02:03:24 -0700 (PDT)
Received: from localhost ([122.172.82.60])
        by smtp.gmail.com with ESMTPSA id q23-20020a170902789700b001a64a2b790fsm5318967pll.164.2023.05.11.02.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 02:03:23 -0700 (PDT)
Date:   Thu, 11 May 2023 14:33:21 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sumit Gupta <sumitg@nvidia.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] cpufreq: tegra194: Fix an error handling path in
 tegra194_cpufreq_probe()
Message-ID: <20230511090321.sqlni5cf3rpmh7sg@vireshk-i7>
References: <30b17e2219abc3a9a137d28bb51e53732bba5103.1682428267.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30b17e2219abc3a9a137d28bb51e53732bba5103.1682428267.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 25-04-23, 15:11, Christophe JAILLET wrote:
> If the probe needs to be deferred, some resources still need to be
> released. So branch to the error handling path instead of returning
> directly.
> 
> Fixes: f41e1442ac5b ("cpufreq: tegra194: add OPP support and set bandwidth")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only
> ---
>  drivers/cpufreq/tegra194-cpufreq.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> index c8d03346068a..36dad5ea5947 100644
> --- a/drivers/cpufreq/tegra194-cpufreq.c
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
> @@ -686,8 +686,10 @@ static int tegra194_cpufreq_probe(struct platform_device *pdev)
>  
>  	/* Check for optional OPPv2 and interconnect paths on CPU0 to enable ICC scaling */
>  	cpu_dev = get_cpu_device(0);
> -	if (!cpu_dev)
> -		return -EPROBE_DEFER;
> +	if (!cpu_dev) {
> +		err = -EPROBE_DEFER;
> +		goto err_free_res;
> +	}
>  
>  	if (dev_pm_opp_of_get_opp_desc_node(cpu_dev)) {
>  		err = dev_pm_opp_of_find_icc_paths(cpu_dev, NULL);

Applied. Thanks.

-- 
viresh
