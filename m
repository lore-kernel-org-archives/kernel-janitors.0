Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.12.242.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795901078;
	b=BtRReDr89YEwgnEdAPWt5N5RDq15MeUW0gYxtY2HrQHx15/BmbnvohF2IYdOANjgLKQP
	 wPjaoSM8Jlze7nQH8sES7P3ZQxDmqpZCxRhURh8NBb67zbnq4ZYweEYgBnrz2NoSyBecu
	 qh3nb5ArQn1CR5etKQ2avYx5c8U1dAnLOLZtGiESNY13xVo714iMOkKAEfhNcPZGa1EMp
	 HH3gpUKavyoNekHrQjuVleEqLf8cMTVuQmhSfE/Q5xHabo+DroAuonuhVteoFmyh1/2vZ
	 ThXgavCwoF8l36dmvnYgrdT3mL5iiRhB9wVqHIxPJcvcmLmQVK7z0AacP36j3Fjnv6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795901078;
	h=DMARC-Filter:Received:DKIM-Signature:X-ME-Helo:X-ME-Auth:X-ME-Date:
	 X-ME-IP:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O02And2mFs0AauGjC7sbLOJneyg+0ovKYyqg8rPiEbY=;
	b=LCkYNUgSUxIit5+wP7exgZ+CSRMu2cS8X9C97/RmCbcKyVo/kbqKz4WnoiX7oLX15Q5t
	 IkSPp+LWXT1mGuyogptS4PftQg6pVe5RPwz0/zuf8kgIX9YIKcpOzOKOFUuQGWF/YVOq0
	 XbxCTjAdIde9oOQjWr0OXNoFFd7CapRzEV92SyFvWHr+N+jrsKhGTsmTVcB8H2a0Thuwm
	 L+33+3922bM2GbUBULM6K57bnrf/no4slYs+NPOLMXj625Ee5Og+hkcjnkSOQBn5ErNYH
	 5M9Izkz/JTDmtAjCAvcdnisQweiJ4o9OcFHdJ5gp1wxjD0FNV9RbwXTBBssNnh1JYOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wanadoo.fr;
	spf=pass smtp.mailfrom=wanadoo.fr;
	dkim=pass header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=p3GaGfXJ;
	arc=none smtp.remote-ip=80.12.242.24
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AC8606A31C;
	Sat, 28 Nov 2026 21:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8AC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=p3GaGfXJ
Received: from [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
 ([IPv6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b])
	by smtp.orange.fr with ESMTPSA
	id XPuCxQ2qHCCXKXPuCxje1X; Sat, 28 Nov 2026 22:24:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1795901069;
	bh=O02And2mFs0AauGjC7sbLOJneyg+0ovKYyqg8rPiEbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=p3GaGfXJbkJzMkECIQekcF47Dz7kJ1+4774RhZSfRH7mE1/ZNYBBLqfBGMOtWZH/U
	 S+KhEM12edEORA+1NN5rRKD0KFmasJu0HXIHtGOZm2g/UGWBDAeZwMOGe43R2VkpHa
	 csdIZczB1jCsSc/vLpErisFhuvpmIZAgYJnEw+VmR8lQb6L+hatN3br5EyUVDjAg43
	 ShmLfxXG658gKGvuFDVk4ZENaeXliOhEOTlSxDOQTGjG2ZaCHMtiReMIf5574cdzZE
	 h2+9L6NkOx1Pd9X8uAoVIKQoUhX6GY9tTTtHH8pWDJNwvwF+28T/O//Qlv7cMjWaeY
	 +HBxzx9cLqsrg==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 28 Nov 2026 22:24:29 +0100
X-ME-IP: 2a01:cb10:785:b00:9f13:a1ff:dc18:901b
Message-ID: <abd8cab5-11cb-441e-884c-cb738287a871@wanadoo.fr>
Date: Sat, 28 Nov 2026 22:24:23 +0100
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
Subject: Re: [PATCH net-next] net: ethernet: cortina: Use
 devm_clk_get_enabled() in gemini_ethernet_port_probe()
To: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Frank Li <Frank.Li@kernel.org>
References: <1dfbd918-ad30-454c-88f5-8d162ab469ae@web.de>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <1dfbd918-ad30-454c-88f5-8d162ab469ae@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 28/11/2026 à 17:36, Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 28 Nov 2026 17:18:49 +0100
> 
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>    keeping duplicate source code.
> 
> * Delete a clk_disable_unprepare() call on an error handling path.
> 
> * Omit the label “unprepare”.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/net/ethernet/cortina/gemini.c | 30 +++++++++------------------
>   1 file changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 3ed8b1ae0bbc..73842a4ddf99 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c
> @@ -2517,25 +2517,19 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
>   	port->irq = irq;
>   
>   	/* Clock the port */
> -	port->pclk = devm_clk_get(dev, "PCLK");
> -	if (IS_ERR(port->pclk)) {
> -		dev_err(dev, "no PCLK\n");
> -		return PTR_ERR(port->pclk);
> -	}
> -	ret = clk_prepare_enable(port->pclk);
> -	if (ret)
> -		return ret;
> +	port->pclk = devm_clk_get_enabled(dev, "PCLK");
> +	if (IS_ERR(port->pclk))
> +		return dev_err_probe(dev, PTR_ERR(port->pclk),
> +				     "failed to get and enable a clock\n");
>   
>   	/* Maybe there is a nice ethernet address we should use */
>   	gemini_port_save_mac_addr(port);
>   
>   	/* Reset the port */
>   	port->reset = devm_reset_control_get_exclusive(dev, NULL);
> -	if (IS_ERR(port->reset)) {
> -		dev_err(dev, "no reset\n");
> -		ret = PTR_ERR(port->reset);
> -		goto unprepare;
> -	}
> +	if (IS_ERR(port->reset))
> +		return dev_err_probe(dev, PTR_ERR(port->reset), "no reset\n");
> +
>   	reset_control_reset(port->reset);
>   	usleep_range(100, 500);
>   
> @@ -2596,24 +2590,20 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
>   					port_names[port->id],
>   					port);
>   	if (ret)
> -		goto unprepare;
> +		return ret;
>   
>   	ret = gmac_setup_phy(netdev);
>   	if (ret) {
>   		netdev_err(netdev,
>   			   "PHY init failed\n");
> -		goto unprepare;
> +		return ret;
>   	}
>   
>   	ret = register_netdev(netdev);
>   	if (ret)
> -		goto unprepare;
> +		return ret;
>   
>   	return 0;
> -
> -unprepare:
> -	clk_disable_unprepare(port->pclk);
> -	return ret;
>   }
>   
>   static void gemini_ethernet_port_remove(struct platform_device *pdev)

NACK.

This patch will generate an unbalanced clk_disable_unprepare() call when 
.remove() is called.

CJ
