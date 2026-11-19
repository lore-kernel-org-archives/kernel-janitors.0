Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.12.242.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119679;
	b=1CZPJzMqH4dybJeoaNHCbk4k+oc8UelfB9P9jYbftAeS4K7iDBMPjHjYYR6u6lSzVXcC
	 VKVJWTrtzIuRSbMGWSPuHrdI8+DxNj0tmllyz8bHdZHj3+Z6iXSbxDfv7UmGTAE3QA780
	 xlaaYljYIiRYQYWXUo/FNvjkOM1R0/xpIxzksp5qOynhKsvqZhgZJAeFjiLRilc5li6Fq
	 i8nzNH11K4cgDHI31CsB6GsYS7mSWTe5CLPapsgafKzaDjZnzVg0dxJGNZ2vxU7acwF2J
	 Dz8ulYd4X+mg5HTl0GsXZ3lXf/FY0soG9erocn91C42c687cHQpStdkyUTHbpKpJgLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119679;
	h=DMARC-Filter:Received:DKIM-Signature:X-ME-Helo:X-ME-Auth:X-ME-Date:
	 X-ME-IP:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2+//dlt07spYz5bxJdfgrxCTZKvIQ8fWzPxkHPVVQmA=;
	b=rx96loHNbJYQmR/9ZpkrjXj8rokA6xfuWXZPlmWtfqZsn4wNQ/ttrpxaHFk8Hthegu/6
	 TKN2k5IpnGuEK62AkRhSfrV2XwhEwxeah/trKflsyenTmJPb4FcKksakL/lsXilPAOOaH
	 GePCUV8xjbUtdVQjWUVE4r9SdDx2Kc905BGYWCiZw1uW2kimPKHu0AOEK9c4oisTfRdMC
	 fBdgOoGQxfSmAYVYzJWLzQ07Jx1BbHdhyGeX2I4EmD7AbSzLLwOQvr+8BE8Ga/2RCx3nr
	 dwC/PlV96n4Hg4QYmEoYj2uGDoojskLpyPir+kSeV73HfHIaE/4xq3X+FGbxtq+KNlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wanadoo.fr;
	spf=pass smtp.mailfrom=wanadoo.fr;
	dkim=pass header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=cahtkUKH;
	arc=none smtp.remote-ip=80.12.242.23
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF9C606A320;
	Thu, 19 Nov 2026 20:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AF9C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=cahtkUKH
Received: from [IPV6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e]
 ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id U8d2xIGOHCCXKU8d2x0rgF; Thu, 19 Nov 2026 21:21:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1795119670;
	bh=2+//dlt07spYz5bxJdfgrxCTZKvIQ8fWzPxkHPVVQmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=cahtkUKHvJrEx++bCvW0apQGc97GW1E5VIO271m24lPg/bfMDzyZwo++46uIgSxAf
	 UL2ZR65UOvTvlY493vu2a+jKfvzUky/5hrRMuUNtuIA284BB3RioFaIBPUj//w8VY6
	 Glx16dFSIXXnRfI2AGT4wQPyQiu7HNwmn4NcLr7IVxzcBi4D+ZjDUPvTofVnb/abXB
	 2adF4MqS2bT94L6yvh+JaqBAyP5FvfTveLtKobzGznEdMhkCIkeerCvQd9IEDufkD4
	 iO8qDnNRXHIpQ1/H58GOze6vqy3DapZd6LMOTy390S+US0bUH2h23/IO9gfqA6LbJT
	 pDbCSzF7rxqqA==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 19 Nov 2026 21:21:10 +0100
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
Message-ID: <92093067-f11e-4ce8-af0e-698644dc27ba@wanadoo.fr>
Date: Thu, 19 Nov 2026 21:21:07 +0100
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
Subject: Re: [PATCH net-next] net: dsa: bcm_sf2: Use
 devm_clk_get_optional_enabled() in bcm_sf2_sw_probe()
To: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Jonas Gorski <jonas.gorski@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <d772ca26-d7f4-4857-9278-628b87e2252e@web.de>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <d772ca26-d7f4-4857-9278-628b87e2252e@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 19/11/2026 à 17:37, Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 19 Nov 2026 17:30:09 +0100
> 
> Reuse existing functionality from devm_clk_get_optional_enabled()
> instead of keeping duplicate source code.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/net/dsa/bcm_sf2.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
> index 1747a1f20c78..011ce79392e8 100644
> --- a/drivers/net/dsa/bcm_sf2.c
> +++ b/drivers/net/dsa/bcm_sf2.c
> @@ -1467,14 +1467,10 @@ static int bcm_sf2_sw_probe(struct platform_device *pdev)
>   		base++;
>   	}
>   
> -	priv->clk = devm_clk_get_optional(&pdev->dev, "sw_switch");
> +	priv->clk = devm_clk_get_optional_enabled(&pdev->dev, "sw_switch");
>   	if (IS_ERR(priv->clk))
>   		return PTR_ERR(priv->clk);
>   
> -	ret = clk_prepare_enable(priv->clk);
> -	if (ret)
> -		return ret;
> -
>   	priv->clk_mdiv = devm_clk_get_optional(&pdev->dev, "sw_switch_mdiv");
>   	if (IS_ERR(priv->clk_mdiv)) {
>   		ret = PTR_ERR(priv->clk_mdiv);

Hi,

NACK, this patch is wrong because the remove function and the error 
handling path of the probe need to be updated.

CJ
