Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.12.242.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630670;
	b=tBxdoAZ5qbp9C/v7dMpqUOFnkZ+7cpPyz8r7kuznuGa4BdXNMLVwivdYXccJHuGcA55n
	 5vY7sU2j7sy1xAQlMDViWvJl2qZM0L0Iv4L2pZEViUkA995I46L8y6f4E/ARVuq2YGdly
	 GlikKDRfCCpercZ/Kzhp8Pz9rB78zXUxgHFBq2RFmDeGg7h317pD4Xhdw2ZZi6GyAkcQE
	 uVYqJ70bQ/WdIfYif27mqP2Qw+E6MWmSxj7Q62OmHJnfdGC9t5es1W5T9nesJ+gNaNYcs
	 ec69wbYnXjktHCd8a7SvnQ1mT/pebUj7iR7anSO+O0u/WJYtah5LTHSFyIiIJt6Y8Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630670;
	h=DMARC-Filter:Received:DKIM-Signature:X-ME-Helo:X-ME-Auth:X-ME-Date:
	 X-ME-IP:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MT1rTMaqnbNtp0eQWMMTdZqy68WnFOS+kLVeuQR8GyA=;
	b=dA+Pa2bXvYtSP2SXfiWaDA+iz6rL+WYh6I2VI1VVNrp4wIgW9eupAJcawp/shpbHal+1
	 g4TfqormFh94CqUlt+T9s0/3G1CsAdAcBATf6p+AIYRpbe/luJjhr95aGNdh3+XqTiwla
	 1HaAD7k+tgacCEvKcVP++D1CTCY+ToKBaD+AKYhGK/O7BuH5CSoFlQC5XVQpT3BGv7B90
	 jpB6TWC8r4zfIqHs0ZuCLexmemNsOudrNAKxlkXSz1Jx9rAtsA9IiIamXjxfHe5jciBXV
	 xoFMlZ1ppXrhWG4XKH6PeI/ysIEmhqnx/qayi6B+8jDmVuPkgMJPolpy/MDeK9iJsJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wanadoo.fr;
	spf=pass smtp.mailfrom=wanadoo.fr;
	dkim=pass header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=KR1g6kpG;
	arc=none smtp.remote-ip=80.12.242.73
Received: from smtp.smtpout.orange.fr (smtp-73.smtpout.orange.fr [80.12.242.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E08606A330;
	Wed, 25 Nov 2026 18:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1E08606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=KR1g6kpG
Received: from [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
 ([IPv6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b])
	by smtp.orange.fr with ESMTPSA
	id WHYoxeF7DEUdDWHYoxP599; Wed, 25 Nov 2026 19:17:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1795630662;
	bh=MT1rTMaqnbNtp0eQWMMTdZqy68WnFOS+kLVeuQR8GyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=KR1g6kpGcK1UEbyOx4KpLRJ8wkIorKNwJijOendQv3tqENpXfbnJ0eWqyi+ORsJsn
	 v15wwDDEqTCFLWd0IbzuuOjtAS/683FLareV9HNp8X/FpMQARc3FOkqSDQ18xAmUKm
	 Cz8iK1yc+C0JSInMjY4C4ngO7QkXilYSTn+kX0lmZXEp0ruiedjS1iystX9o9Jn+v1
	 LRf9zp0mVkjyEw16nE2/qNRBqJY5OsNg9x0jwFxaA2+vpOLzrdnm3FSfytsqC3XlTc
	 vSRLWe/m48OaHIiNtpYhPI3BnrFjEiHMvHivxj0pPpyPzTTRUjVLPAtAnCtahrmXKk
	 F6VSs1XFdDJBg==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 25 Nov 2026 19:17:42 +0100
X-ME-IP: 2a01:cb10:785:b00:9f13:a1ff:dc18:901b
Message-ID: <ac10d9ef-b193-487c-b4c1-6126aa770c6f@wanadoo.fr>
Date: Wed, 25 Nov 2026 19:17:38 +0100
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
Subject: Re: [PATCH net-next] bcm63xx_enet: Use devm_clk_get_enabled() in two
 probe functions
To: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Hemanth Selam <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>
References: <d293609b-c8cd-4993-a243-89c6d1ace4a0@web.de>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <d293609b-c8cd-4993-a243-89c6d1ace4a0@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 24/11/2026 à 20:23, Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 24 Nov 2026 19:50:57 +0100
> 
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>    keeping duplicate source code.
> 
> * Omit a clk_disable_unprepare() call on error handling paths
>    and in the implementation of two remove functions.
> 
> * Omit two labels.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/net/ethernet/broadcom/bcm63xx_enet.c | 26 ++++----------------
>   1 file changed, 5 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> index f6595fdc888d..e98130092357 100644
> --- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> +++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> @@ -1751,14 +1751,11 @@ static int bcm_enet_probe(struct platform_device *pdev)
>   	priv->irq_rx = irq_rx;
>   	priv->irq_tx = irq_tx;
>   
> -	priv->mac_clk = devm_clk_get(&pdev->dev, "enet");
> +	priv->mac_clk = devm_clk_get_enabled(&pdev->dev, "enet");
>   	if (IS_ERR(priv->mac_clk)) {
>   		ret = PTR_ERR(priv->mac_clk);
>   		goto out;
>   	}
> -	ret = clk_prepare_enable(priv->mac_clk);
> -	if (ret)
> -		goto out;
>   
>   	/* initialize default and fetch platform data */
>   	priv->rx_ring_size = BCMENET_DEF_RX_DESC;
> @@ -1792,11 +1789,11 @@ static int bcm_enet_probe(struct platform_device *pdev)
>   		if (IS_ERR(priv->phy_clk)) {
>   			ret = PTR_ERR(priv->phy_clk);
>   			priv->phy_clk = NULL;
> -			goto out_disable_clk_mac;
> +			goto out;
>   		}
>   		ret = clk_prepare_enable(priv->phy_clk);
>   		if (ret)
> -			goto out_disable_clk_mac;
> +			goto out;
>   	}
>   
>   	/* do minimal hardware init to be able to probe mii bus */
> @@ -1890,8 +1887,6 @@ static int bcm_enet_probe(struct platform_device *pdev)
>   	enet_writel(priv, 0, ENET_MIISC_REG);
>   	clk_disable_unprepare(priv->phy_clk);
>   
> -out_disable_clk_mac:
> -	clk_disable_unprepare(priv->mac_clk);
>   out:
>   	free_netdev(dev);
>   	return ret;
> @@ -1926,9 +1921,7 @@ static void bcm_enet_remove(struct platform_device *pdev)
>   				       bcm_enet_mdio_write_mii);
>   	}
>   
> -	/* disable hw block clocks */
>   	clk_disable_unprepare(priv->phy_clk);
> -	clk_disable_unprepare(priv->mac_clk);
>   
>   	free_netdev(dev);
>   }
> @@ -2692,14 +2685,11 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>   		goto out;
>   	}
>   
> -	priv->mac_clk = devm_clk_get(&pdev->dev, "enetsw");
> +	priv->mac_clk = devm_clk_get_enabled(&pdev->dev, "enetsw");
>   	if (IS_ERR(priv->mac_clk)) {
>   		ret = PTR_ERR(priv->mac_clk);
>   		goto out;
>   	}
> -	ret = clk_prepare_enable(priv->mac_clk);
> -	if (ret)
> -		goto out;
>   
>   	priv->rx_chan = 0;
>   	priv->tx_chan = 1;
> @@ -2718,7 +2708,7 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>   
>   	ret = register_netdev(dev);
>   	if (ret)
> -		goto out_disable_clk;
> +		goto out;
>   
>   	netif_carrier_off(dev);
>   	platform_set_drvdata(pdev, dev);
> @@ -2727,8 +2717,6 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> -out_disable_clk:
> -	clk_disable_unprepare(priv->mac_clk);
>   out:
>   	free_netdev(dev);
>   	return ret;
> @@ -2738,16 +2726,12 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>   /* exit func, stops hardware and unregisters netdevice */
>   static void bcm_enetsw_remove(struct platform_device *pdev)
>   {
> -	struct bcm_enet_priv *priv;
>   	struct net_device *dev;
>   
>   	/* stop netdevice */
>   	dev = platform_get_drvdata(pdev);
> -	priv = netdev_priv(dev);
>   	unregister_netdev(dev);
>   
> -	clk_disable_unprepare(priv->mac_clk);
> -
>   	free_netdev(dev);
>   }
>   

Why changing only one devm_clk_get()?

CJ
