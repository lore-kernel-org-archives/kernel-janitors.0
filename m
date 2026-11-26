Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.12.242.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714219;
	b=bDHM6Zx2rV/pj8FKadCiNLJD086IfYmGcYPhi6CYeI/f3ZozLh4Qvcb7cZtz0JRvOS6r
	 uU9696/T+PZGgNjKimL8R6X1Sqez0NCxNUQ1tbZproyXpLTi+nMVuqVm73qHBO2Hn5/1M
	 ampxex8ilaOo/oxUYWQ981hcc2EQTNtE/4NZvP1/8LPrwlYSssQtqLN/5/P0XevmDi1WN
	 f2ocTCIcoszoqUJNZ+y5d/p6OVxgb8SIeZLme+DsuX33nmeeCnBOLNSmXNknZcgi06Ewm
	 5AGMmRW1/E3o45KbV1SePrBDP48mIuEQiuttwra4SP5iQN5u5Jhap/gmXLDU9LPmG/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714219;
	h=DMARC-Filter:Received:DKIM-Signature:X-ME-Helo:X-ME-Auth:X-ME-Date:
	 X-ME-IP:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=z39ce5NyfJ7Th0It5od7oQpeO8yZJtWw8O5WBrYMiXI=;
	b=2EhzY3w+Wi3+xW+AtvtGuASrLhbuYxZW41LbXj8Auaf6Izf4HVjia6Eft9sl4QuDJ5zc
	 QWZyf9lxhSJleYkIiNUvfHciFvGgZzJYFfRU6zQvPBh+z8E+eEqZQC3Fk4lb4UpyGPekJ
	 gI+8AUb8HrpnMK5LBcqmcPlvqhYpVrpOk5LSHpCuYJdyDMsZeJm5j4495mW3iA5fGfT0B
	 wx+cZlaZqpxXAcn/W2avWD/fWOzInYZtwVBFNMmmMqL4r05o6PH3R8tvwZXJf7DmThHWG
	 wjyVGsalLa6YoQwfBM3YPkWr84Fto8f8f0Nup5F86EpSuj2dHkr1eUIbPEpm0OXW1Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wanadoo.fr;
	spf=pass smtp.mailfrom=wanadoo.fr;
	dkim=pass header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=VhqMRJ22;
	arc=none smtp.remote-ip=80.12.242.17
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FEF606A31E;
	Thu, 26 Nov 2026 17:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10FEF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=VhqMRJ22
Received: from [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
 ([IPv6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b])
	by smtp.orange.fr with ESMTPSA
	id WdIMx75EugpbqWdINxg1Nl; Thu, 26 Nov 2026 18:30:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1795714210;
	bh=z39ce5NyfJ7Th0It5od7oQpeO8yZJtWw8O5WBrYMiXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=VhqMRJ224NJnKiB2+asan9Z3TCQ8vMq09R/G+adKbRHSR18hb+p6sZCI6mPcyQcGd
	 UYeKkLIfvTB0JTjNgVqnCx4xJ5K9usNbF/myHNYVdRwoYwPvkG3rc1xlkEM/XuQT2D
	 LAUMEKTAw8AZn/bW7Gwfqo+YxZdMYAQ8QVFUcuBerpR9c73G6DBul74O3PDffwCW4f
	 NCEvyLWWwNSJBcAxJIUpaJLcDJf6aBT4aAXSRfOAtVaPetQ/zEbSIwbvxBp+TDKudY
	 cJ+BNM3SUTbG/bFcDw7ScNS07Jr4FlNu3Biqx8ZGYWL3H3eTmOVvn5zckXULaXsZSA
	 NyU/7J8IVpSiA==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 26 Nov 2026 18:30:10 +0100
X-ME-IP: 2a01:cb10:785:b00:9f13:a1ff:dc18:901b
Message-ID: <f3de129e-bbee-470d-a1df-e867269522cc@wanadoo.fr>
Date: Thu, 26 Nov 2026 18:30:06 +0100
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
Subject: Re: bcm63xx_enet: Use devm_clk_get_enabled() in two probe functions
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
 <ac10d9ef-b193-487c-b4c1-6126aa770c6f@wanadoo.fr>
 <603d7ea7-5d7d-49c4-a01b-a7805e88c361@web.de>
 <9c26b213-aa58-4c27-99c7-926c6b4d5275@wanadoo.fr>
 <d11b4708-02d9-4d53-bc5e-734fdb363d2b@web.de>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <d11b4708-02d9-4d53-bc5e-734fdb363d2b@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 26/11/2026 à 07:30, Markus Elfring a écrit :
>>>> Why changing only one devm_clk_get()?
>>> The change relevance is varying for the involved clocks of the affected Linux drivers,
>>> isn't it?
>>
>> Your patch is related to bcm_enet_probe().
>>
>> See L1754 and L1791. These 2 calls are related to 2 clk_disable_unprepare() calls in the error handling path and in the remove function.
>>
>> Why only update one place, and keep one clk_disable_unprepare()?
> 
> The ungating of the item “priv->phy_clk” depends on special condition checks.

This does not answer the question.

> https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/broadcom/bcm63xx_enet.c#L1789-L1800
> 
> Regards,
> Markus

