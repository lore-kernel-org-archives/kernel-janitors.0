Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.12.242.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466248;
	b=wWKQt2v7Ljun9+MTwEQRSS5UXue/5flHoPBP7117XyE2BLVeQIiqXaTTLaezDX4NL0Vt
	 VMQfcli2ch0npXHrkhlYZMRR2EBH3C0eBWkXKvGsbPstIe8bvBfd1KAg0+ja8If4lXnMz
	 nxPXEVMSC6Sg1924nsWPZgY8sY20wTEFNOPENinXe96LXg2bAL68ns1XrI598PF9wkhqv
	 fU47aFNFGoF9CJkoBorsPK/0JDczXufmBnASeF3SLrMxg1ONAQ21LoY0Yk3F51qcwxy+3
	 qW02NXpiCNONm32KZBVI6DWgVNaogWBfStaVWRD38bPGY3DQI8mucXso2zZIV+PEK1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466248;
	h=DMARC-Filter:Received:DKIM-Signature:X-ME-Helo:X-ME-Auth:X-ME-Date:
	 X-ME-IP:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cnrtqlUaAitFNBwdxdrwcWq+Op/M4cGZoOzTkf/omVQ=;
	b=aQPdHMPv9Tv38VC/vjJ+oOGF3dUBVXFauhspHx8KGhJa7bOUldC1SVGfzejWFs3K85Kt
	 eQdKu0YaUz/XxfBp4oXRGurVZZL+p+PKpf3/rIMJ/zS/rqYo2Dxq0IsmheHJxjG1pdSsm
	 fJ450XfjBTJV23ZYxkzFJvdkITDVJq7TPZjX1SSb8gc/xueUPd4Tjk85+uy40Az+yXJuu
	 n5NVXba8rpjSr2HG8EvDGQRltHUy/8DJHzGtdErKNufdAAVWzpIKHLoxYy1noftncuN73
	 BuyLBpvS3OSFTEGFDUM9VXfiJ0KjBDRwKLVSzrPJ/qBUi7ar8khJeASuF07oHXV9yBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wanadoo.fr;
	spf=pass smtp.mailfrom=wanadoo.fr;
	dkim=pass header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=SG8euddV;
	arc=none smtp.remote-ip=80.12.242.75
Received: from smtp.smtpout.orange.fr (smtp-75.smtpout.orange.fr [80.12.242.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7AB606A321;
	Mon, 23 Nov 2026 20:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D7AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=SG8euddV
Received: from [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
 ([IPv6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b])
	by smtp.orange.fr with ESMTPSA
	id VamrxSo4ep3XLVamrxXZcj; Mon, 23 Nov 2026 21:37:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1795466240;
	bh=cnrtqlUaAitFNBwdxdrwcWq+Op/M4cGZoOzTkf/omVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=SG8euddV1/2nH6Q8GA5nr1I4Z/cCoi6E0wfYBTfkaJ2bzbcbZ77IIxqEmMTuNSXBy
	 GCUqovoUyUjzhbKKR4d7AH4xfLFdTx/kkaysFZgIPL2ZSD631fo5T4WOWjUXwq23o7
	 A1gVndDbZdW5KWvNPWnHNaHiNSNK5Hx5UATDxKgnl/5pbIDxUn3cDOptQsT9Ghp8+/
	 sWex+a+RV9LDhBHyYp0Z/fxB2QWFTsclv42ckxkq8cT4qh6UQQGh4Wky4/seeWuGCo
	 FD0tR/kzmwDPph0Tqxe0U93Fd9iK6okUBfKJPHTzC+6J/wWbpTfd3uOlaX2yfAdaHi
	 t2g0n4b412fwg==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 23 Nov 2026 21:37:20 +0100
X-ME-IP: 2a01:cb10:785:b00:9f13:a1ff:dc18:901b
Message-ID: <b37108dd-e1d5-43bc-a637-c87a8538570f@wanadoo.fr>
Date: Mon, 23 Nov 2026 21:37:17 +0100
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: stm32-ipcc: Use devm_clk_get_enabled() in
 stm32_ipcc_probe()
To: Markus Elfring <Markus.Elfring@web.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Ludovic Barre <ludovic.barre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>,
 Michal Simek <michal.simek@amd.com>
References: <d3e781aa-04e6-4643-bb39-beb4dcfe9b33@web.de>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <d3e781aa-04e6-4643-bb39-beb4dcfe9b33@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 22/11/2026 à 18:54, Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Nov 2026 18:42:21 +0100
> 
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>    keeping duplicate source code.
> 
> * Omit a clk_disable_unprepare() call on an error handling path.
> 
> * Delete the label “err_clk”.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/mailbox/stm32-ipcc.c | 18 ++++--------------
>   1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
> index e88e198436a6..25d8138a3695 100644
> --- a/drivers/mailbox/stm32-ipcc.c
> +++ b/drivers/mailbox/stm32-ipcc.c
> @@ -242,29 +242,21 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
>   	ipcc->reg_proc = ipcc->reg_base + ipcc->proc_id * IPCC_PROC_OFFST;
>   
>   	/* clock */
> -	ipcc->clk = devm_clk_get(dev, NULL);
> +	ipcc->clk = devm_clk_get_enabled(dev, NULL);
>   	if (IS_ERR(ipcc->clk))
>   		return PTR_ERR(ipcc->clk);
>   
> -	ret = clk_prepare_enable(ipcc->clk);
> -	if (ret) {
> -		dev_err(dev, "can not enable the clock\n");
> -		return ret;
> -	}
> -
>   	/* irq */
>   	for (i = 0; i < IPCC_IRQ_NUM; i++) {
>   		ipcc->irqs[i] = platform_get_irq_byname(pdev, irq_name[i]);
> -		if (ipcc->irqs[i] < 0) {
> -			ret = ipcc->irqs[i];
> -			goto err_clk;
> -		}
> +		if (ipcc->irqs[i] < 0)
> +			return ipcc->irqs[i];
>   
>   		ret = devm_request_threaded_irq(dev, ipcc->irqs[i], NULL,
>   						irq_thread[i], IRQF_ONESHOT,
>   						dev_name(dev), ipcc);
>   		if (ret)
> -			goto err_clk;
> +			return ret;
>   	}
>   
>   	/* mask and enable rx/tx irq */
> @@ -323,8 +315,6 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
>   		dev_pm_clear_wake_irq(dev);
>   err_init_wkp:
>   	device_set_wakeup_capable(dev, false);
> -err_clk:
> -	clk_disable_unprepare(ipcc->clk);
>   	return ret;
>   }
>   

NACK.

This patch is wrong, because it the clk will be disable_unprepared an 
extra time if the remove function is called.
(see the last call of the probe to understand why)

CJ
