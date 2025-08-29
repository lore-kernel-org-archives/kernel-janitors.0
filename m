Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488AA305046
	for <kernel-janitors@vger.kernel.org>; Fri, 29 Aug 2025 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756483904; cv=none; b=fWLU+/C+ijsnNLfFFCQVLvA3uVOOsLZOADITym/qjJza/tCtfg9TH6OAyf7eHOfSzi4d2MS/a02AvbgfFnuyZHY656EqnqumOtPQ0G968eky6JwO/lo8X5mmTlZ+e8kqV+t8/gAW117jsokNOFzOMr+BG12/7Z/gLodaviIdBaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756483904; c=relaxed/simple;
	bh=tTY7r03wgO+Jv1B5lRquX6wrCUgO7uUzlezmCJKhxgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8gHxogFoARFWjIgMYCUZXL/ZaDrAdiS+Py2vGwzSi26r0Af+fO2pMShNFf7lm7vAEca7x/HIywR7G5OpAn3bG5XiGey54jB+0+7UyeT/44zHS6ARU7rq/DNMx/2uYN8j1Et1yh6FSP46hg2MXeKU24pqdT8x3aziQK9xzMc/dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ucw/A11k; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ucw/A11k"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77033293ed8so2047859b3a.0
        for <kernel-janitors@vger.kernel.org>; Fri, 29 Aug 2025 09:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756483902; x=1757088702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GdG4ZBE60MQo9skvlcwc2CKeFpgl13LiTrzShDv9gcU=;
        b=ucw/A11ksrS5Bo670qiQMnOJnukH+sukEvnAuamReEq9kWPwd6UKcH77wl9Z91jyKd
         JU5174fT5Bo7eTce5vbraIhHg7PLPT0BTO8oo1PQMQ7KOlmdu1DFYdAZsuNRKSsz0a1k
         C1CO2XwULkgtW6t0wBuKOkBcW32O7RjqrTwKXfzchK1+wS5VMkP8v9mpZjvH8KT1ks+F
         kjKvqjolYib0VOVa+KbfwFUkNt1Y+UrOrVTprxftvWBzGT7F7vVNSvLo8FCkjSicGPmm
         fm9o/9SC1F7hYLnQm3ZUllRr3j46kv4uQDoyzR093AOj8rJVh6EN3qwhuSH/a1cBIPrY
         dy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756483902; x=1757088702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdG4ZBE60MQo9skvlcwc2CKeFpgl13LiTrzShDv9gcU=;
        b=ht9Kg1kGh3HH37X3TrYi1W1cDvUmCcXhB/1+vX9T+tW6mTi8JOClhUR7od3U2Mv2lG
         aTjJFYYGSPNH5CPed2n84psho1HQ6Peir3HkfOtc8PxcoKn9Dxlz58kVN8oia8M9/qT6
         I9jQA+H5+NQirHV5vQd4datFwfHwjJJ602GVwmepkwR+XAP18J67x9cpia0mlAdijTwh
         yLJuV5OHqrMHM4tuD5hvkc79f5CP8YrDvffXjeR8wyB42J/zRjh+9Yxpdf2IGjbBOZ7l
         1lbgRaHwur8gChAwnnb/zXSyDuT9x0ZQZUH2zL5EjBYkgENxl1XWP+rJRtDOcGcIWS/M
         PzZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/PeB6ObZVh5DO+d9JHUEtk7RNUgiA/JcxOWmNgYRpW+F78OPTc1L/Y/DFNX8yyW2Yaa9Xr3ffbEcxeTEg1eQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw71IXQ73SiexKwkN/ODG6ZvRquOu87ANiq9nOo2jRnWqLja4CV
	LcdQktJoxZsggAyKHhajnfx+IOPrHpWDGBrRx5AWoEmMCyJWAoZmxlHjAZzkKT41+tEKFcx3gPw
	4UzBt/oo=
X-Gm-Gg: ASbGnctn5HjH3G6kcYXiG05oytwm8XH7rrgI26yYdY5TDCeqrIDihCq0iWfLg2YKmWw
	FQFEdq26h9F12AwAXsgAp3btVytzuST1+d4dH77mFonrXxeraGkc1T/R+wQm3+XiVEfRQS1Dz7C
	pu7TgqtxHwfYExRwFkVrYIbyc39mkWVMj5TmQa8jkqW16N4AxpJusOKkc7Oj4m0pgdyuOVLLidW
	EsiBoHzT16U4b3cqtrZFjVLYWwi3zWuyDTZFRR6Nd8s3zu+1rvM/z4OLFuyJl3sf7r1r+fNoWjd
	gGLnzUN9g1INRitLdA9vzkO5tB3CtRSdhEMBa7dxIXV2NWmhloDRKDqSi/HmtFB9ZlWa262VyfB
	e8r23eHvFUsHUks/+FfpdEwp5Mv9q/k33TYEY5FG8gtWbk2ACdivehpFURN2Q00JSRTZi5Wy8r3
	tqawTxJdkAQGkXqzNWdCp6wAKRrM2paR49b5Q=
X-Google-Smtp-Source: AGHT+IG0BijOfS1syDO9r7bmXPHtEUUgTx65TwjuioQwopzbTILdFIw8bOkcRYbE5nIUD3sncpBFew==
X-Received: by 2002:a05:6a00:a28:b0:772:2e00:831f with SMTP id d2e1a72fcca58-7722e00b9b5mr4167788b3a.4.1756483902507;
        Fri, 29 Aug 2025 09:11:42 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c8f8:92f5:116b:3068])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26ae02sm2755442b3a.21.2025.08.29.09.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 09:11:42 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:11:39 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, Beleswar Padhi <b-padhi@ti.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5] remoteproc: k3: Correctly release some resources
 allocated in k3_rproc_request_mbox()
Message-ID: <aLHROzqMNZ6GdII4@p14s>
References: <df853ede72e9972c464415990b196289680e6acb.1756065142.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df853ede72e9972c464415990b196289680e6acb.1756065142.git.christophe.jaillet@wanadoo.fr>

On Sun, Aug 24, 2025 at 09:52:37PM +0200, Christophe JAILLET wrote:
> If an error occurs after a successful k3_rproc_request_mbox() call,
> mbox_free_channel() should be called to avoid a leak.
> 
> Such a call is missing in the error handling path of k3_dsp_rproc_probe().
> It is also missing both in the error handling path of k3_m4_rproc_probe()
> and in the (in-existent) corresponding remove function.
> 
> Switch to managed resources to avoid these leaks and simplify the code.
> Remove the now unneeded mbox_free_channel().
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
> Tested-by: Beleswar Padhi <b-padhi@ti.com>
> ---

Appied.

Thanks,
Mathieu

> Compile tested only.
> 
> Changes in v5:
>   - Update subject line   [Beleswar Prasad Padhi]
>   - Add R-b and T-b tags
>   - Rebase with latest -next (especially, because of commit f9a4c582e508
>     ("remoteproc: k3: Remove remote processor mailbox ping))
> 
> v4: https://lore.kernel.org/all/f96befca61e7a819c0e955e4ebe40dc8a481619d.1751060507.git.christophe.jaillet@wanadoo.fr/
> 
> Previous versions:
>    https://lore.kernel.org/all/591e219df99da6f02c9d402f7854bc3ab23e76f9.1726328417.git.christophe.jaillet@wanadoo.fr/
> ---
>  drivers/remoteproc/ti_k3_common.c         | 12 ++++++++++++
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 --
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  2 --
>  3 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index 8266e11914af..56b71652e449 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -155,11 +155,19 @@ int k3_rproc_release(struct k3_rproc *kproc)
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_release);
>  
> +static void k3_rproc_free_channel(void *data)
> +{
> +	struct k3_rproc *kproc = data;
> +
> +	mbox_free_channel(kproc->mbox);
> +}
> +
>  int k3_rproc_request_mbox(struct rproc *rproc)
>  {
>  	struct k3_rproc *kproc = rproc->priv;
>  	struct mbox_client *client = &kproc->client;
>  	struct device *dev = kproc->dev;
> +	int ret;
>  
>  	client->dev = dev;
>  	client->tx_done = NULL;
> @@ -172,6 +180,10 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>  		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
>  				     "mbox_request_channel failed\n");
>  
> +	ret = devm_add_action_or_reset(dev, k3_rproc_free_channel, kproc);
> +	if (ret)
> +		return ret;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index 7a72933bd403..d6ceea6dc920 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -175,8 +175,6 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
>  		if (ret)
>  			dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
>  	}
> -
> -	mbox_free_channel(kproc->mbox);
>  }
>  
>  static const struct k3_rproc_mem_data c66_mems[] = {
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index ca5ff280d2dc..04f23295ffc1 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1206,8 +1206,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
>  				return;
>  			}
>  		}
> -
> -		mbox_free_channel(kproc->mbox);
>  	}
>  }
>  
> -- 
> 2.51.0
> 
