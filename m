Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B46B1FECA9
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jan 2025 11:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737114722; cv=none; b=IINCSbXDDt0YbNz3mqD0GuyCGiOCML7LYH7BmndPCL+AEuYQADM/1ccjedwqPNPoRd0J5UkHJ4dDggJyhV4mzyiYPlENTdTdWAEQmKpXqshSpNF2o1RBe8KfzRAzOMsXWd8C0KLZIsWFcOuNh+QI4hZDO52MliT7FB9vLOFY1l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737114722; c=relaxed/simple;
	bh=xwCWCIDVfn4ljQgFgns26pvg+plF0yfuzXPTokcNkqY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YDjf/RvLqmBEg9vqaUtkOpxDW6yXM5twGtfXrqIxmJNdqQE7l8ADv+9rEkv6PspmNN3sAoIylMRFfacKGMwtdgIw2I2dRl2u79BsxvCHhVirkIJCWMPKltOOdhJBWnOKE+GNNswbFJqzMFaVk+Avv8f5wSGZ4r6vmJYR34QMUTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JwiXnVRM; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JwiXnVRM"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1611117f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Jan 2025 03:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737114719; x=1737719519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=umzbMSBjj46+zs1yQ9Kml6XKWdNkQzuAfOK6WAMVw/Y=;
        b=JwiXnVRMyFBl6Eihpwrr+qUCAhq3cM9QBLGz1Ar4IxTnrwfeMKTyoIbDZTCnSPa1ye
         gNS+89L8yRbPTWMn+80Fc8YJakDfD+sHVYtQyhnVCAxidjq/U6fmDKWfkt1OMtk2Aa7B
         JUfLm+PA7tRjWgCfPvoPB6SQBahns6gUTkCL7OkdAAvJ4MpfrOGz6QKYB8PTe0l1CQK2
         q4Bmd64Q/4wA1njz5tIzPN2XFzj82zk1s5iZ7uhasmTsvj0lCijN+yBWLnOG2AcP+Lq6
         MocgwIC/r2N22tQrQciKvMLmhagssSphX2+GMIqVC1h+sFIAwsJZxRzpmr4rH9Y3Q0H4
         34UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737114719; x=1737719519;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umzbMSBjj46+zs1yQ9Kml6XKWdNkQzuAfOK6WAMVw/Y=;
        b=eMPc8ISvs074UkaPo6sYB7xHiGdsjLv9ywfActSKzV5TJrP/3QlDAa+kAfYHsTb62I
         J3nP3Y10eU5wlc/2IeIs+6vVDwVs+2gu4gbetKfnwBjFS4dtitTaZshYoxzHC4FOIf4N
         XOFovFuBDMhfPv86kefcWE9zGLW9Ax0y4kBi5nvtTXzHgtTIncV6ORdc8C/VZ9vArSCg
         v9AqlUYXZzGYihApLJPxdmpNXNaqLUnSQz6Rp2AwmbDlKtphoxssTUVl11TQ5Wt6EYU1
         LoWO6fJB8G/V0sJkhx+SEj4b9xctf1VL71JEEYrsj23pwMzGrx79vu8Z2zHGsUHshC3g
         d/ug==
X-Forwarded-Encrypted: i=1; AJvYcCXHBclM8ORaxi9iE22ZU5fGZ+8UPEtQypPgtwJXPcu0Z//HqkErmN0WYodTSdItHxFEkbQ9R5g+EfUdIljtZy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkIMGZ33SOzK7nuMDpvSJzCZkPOSVFOo7nrQ1R8cfyk8d3BNpe
	poFz2bFuhdXDm3gi0CLbE/+d5ZPHYuswHZ4L+du61EEizFq0JIFdL9rbB0iyjkM=
X-Gm-Gg: ASbGncvjMfp77XEUFb+cknwNB9/5rkUuon+N4X1YOZ9FeaXCf/c4tPUK4A9NTiUouzw
	jYnpkHayUBPtOS45Rz1sECF5A3m++rd9CwulrjIdr30IBESwTXTqd85orPBynfvr4I4DmZAkP0U
	4XxLAUgSE+Ipwrs3SdhJ9DnnQVYmVm3cFnsQviOisUsAO6kPAE0K7uNx2ANGWcOhWZWm6rMJdr1
	ll64Vv3PpzhHXPk/I8hnfe2Dyzar8oYFRU+VaXyBoDtVhInz1SiS4PZtAmUB6xfZg==
X-Google-Smtp-Source: AGHT+IE4kQUYANidWG36nYutNXYRmfHEWSkKEVnx3dSgIu3dG++0ldqKCDbRAujA8YCCuBSVUPPU4Q==
X-Received: by 2002:a5d:5f56:0:b0:38a:9f47:557b with SMTP id ffacd0b85a97d-38bf57a97bcmr2347139f8f.40.1737114718508;
        Fri, 17 Jan 2025 03:51:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32845e8sm2342552f8f.97.2025.01.17.03.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 03:51:58 -0800 (PST)
Message-ID: <8ff70298-8a9c-4228-b064-f46ec81f6d15@tuxon.dev>
Date: Fri, 17 Jan 2025 13:51:55 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH] ASoC: renesas: rz-ssi: Clean up on error in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <14864a18-c256-4c7d-b064-ba1400bed894@stanley.mountain>
Content-Language: en-US
In-Reply-To: <14864a18-c256-4c7d-b064-ba1400bed894@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Dan,

On 15.01.2025 08:55, Dan Carpenter wrote:
> Call rz_ssi_release_dma_channels() on these error paths to clean up from
> rz_ssi_dma_request().
> 
> Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  sound/soc/renesas/rz-ssi.c | 42 ++++++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
> index 3a0af4ca7ab6..4b3016282717 100644
> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c
> @@ -1150,35 +1150,47 @@ static int rz_ssi_probe(struct platform_device *pdev)
>  		ssi->irq_rx = platform_get_irq_byname(pdev, "dma_rx");
>  		if (ssi->irq_tx == -ENXIO && ssi->irq_rx == -ENXIO) {
>  			ssi->irq_rt = platform_get_irq_byname(pdev, "dma_rt");
> -			if (ssi->irq_rt < 0)
> -				return ssi->irq_rt;
> +			if (ssi->irq_rt < 0) {
> +				ret = ssi->irq_rt;
> +				goto err_release_dma_chs;
> +			}
>  
>  			ret = devm_request_irq(dev, ssi->irq_rt,
>  					       &rz_ssi_interrupt, 0,
>  					       dev_name(dev), ssi);
> -			if (ret < 0)
> -				return dev_err_probe(dev, ret,
> -						     "irq request error (dma_rt)\n");
> +			if (ret < 0) {
> +				dev_err_probe(dev, ret,
> +					      "irq request error (dma_rt)\n");
> +				goto err_release_dma_chs;
> +			}
>  		} else {
> -			if (ssi->irq_tx < 0)
> -				return ssi->irq_tx;
> +			if (ssi->irq_tx < 0) {
> +				ret = ssi->irq_tx;
> +				goto err_release_dma_chs;
> +			}
>  
> -			if (ssi->irq_rx < 0)
> -				return ssi->irq_rx;
> +			if (ssi->irq_rx < 0) {
> +				ret = ssi->irq_rx;
> +				goto err_release_dma_chs;
> +			}
>  
>  			ret = devm_request_irq(dev, ssi->irq_tx,
>  					       &rz_ssi_interrupt, 0,
>  					       dev_name(dev), ssi);
> -			if (ret < 0)
> -				return dev_err_probe(dev, ret,
> -						"irq request error (dma_tx)\n");
> +			if (ret < 0) {
> +				dev_err_probe(dev, ret,
> +					      "irq request error (dma_tx)\n");
> +				goto err_release_dma_chs;
> +			}
>  
>  			ret = devm_request_irq(dev, ssi->irq_rx,
>  					       &rz_ssi_interrupt, 0,
>  					       dev_name(dev), ssi);
> -			if (ret < 0)
> -				return dev_err_probe(dev, ret,
> -						"irq request error (dma_rx)\n");
> +			if (ret < 0) {
> +				dev_err_probe(dev, ret,
> +					      "irq request error (dma_rx)\n");
> +				goto err_release_dma_chs;
> +			}
>  		}
>  	}

The code block ending here is entered only if !rz_ssi_is_dma_enabled(). If
that is true there are no DMA channel to be released. Maybe better would be
to move this code block on the failure path of the rz_ssi_dma_request() as
also proposed here:
https://lore.kernel.org/all/CAMuHMdU+_NuLp2FuwwcLfJRe2ssMtp=z7fqcsANgYfFehTNJGg@mail.gmail.com/

Thank you,
Claudiu

>  

