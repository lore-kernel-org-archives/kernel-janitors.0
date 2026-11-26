Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.12.242.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716791;
	b=1NNHmLp4jJD/mPY27lMDCzSyhJ5/qXGYZ9DwrNSJErCEfhCThF7ju82fjnfgxz0seEL4
	 h8fK/4u7anAPmDWXOAjoeALFZhtJAqyzvQ2vDLtFP0WRPVDELrX3aQ9ZvY9MQZUvZt+Tj
	 1B3PrTlfbyCh9SBT2SZTYQM6/dNpBjRu1FxVVtDFNLa0Dr9kxK6JcP8ZV52I8B2VHOrWY
	 mpKCw4pOOhTSNNpuqJqnOssQJ7jIPkSMlMeft1h0YFYgy5CvtV/QSC8l7Z+9l8ioFG8BJ
	 2LOEvS67og3QEKOkDcOsvMh4m0TbLJfr6K9dyh7vTC+JxBSySNbr9H6nzXBiEkvDsIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716791;
	h=DMARC-Filter:Received:DKIM-Signature:X-ME-Helo:X-ME-Auth:X-ME-Date:
	 X-ME-IP:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=b/qk5yDJ49DLmtIqdxLp9j4Cc6Uts3VlgsUbxxBQs/A=;
	b=r9/mqEr5aqgXqPdzMizn1y1gGc9AeM945/dPJE3HoYYsF680fjAJaS2Xe0aycopGCMgO
	 D9vzHgoB0ACwBt+0PeJhCSeBAqjp3AMXYBdZdErNH+lt4io0pk4H9vMNrLMTOFOufyswx
	 GYSIcidkaWQnJ6ehp53Od+cw31shDyAoBi2v+Y5PBzDmFeJOU/xz92E+qZOsTqY7uOqH6
	 TchZNQvs6lMLgcOBl+V1aBKeBQqzOKZ2kgTOevBR0TgCoN6itxedD0F6DSUvnoGz/fP2u
	 nggqcNwZXWsGvNFKU/bQj/4G0CYYIqi203BfyTbv7YM6bhwVMYUNFz40q0vf7yYkCAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wanadoo.fr;
	spf=pass smtp.mailfrom=wanadoo.fr;
	dkim=pass header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=afiUoUGZ;
	arc=none smtp.remote-ip=80.12.242.18
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF9B606A31C;
	Thu, 26 Nov 2026 18:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CF9B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=afiUoUGZ
Received: from [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
 ([IPv6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b])
	by smtp.orange.fr with ESMTPSA
	id WdxrxjwdCny6VWdxrx2iWP; Thu, 26 Nov 2026 19:13:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1795716782;
	bh=b/qk5yDJ49DLmtIqdxLp9j4Cc6Uts3VlgsUbxxBQs/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=afiUoUGZ7ZGWblj2GXXQ8XuqgoWqEegxdz/7yazsz8kY8QGrURLhC4PD9wE/WO4lJ
	 anud2ozvFViRmfRZ6UUZPASUlYeAXYbfoMIph2B2Ol/neVn4ePLGy8GJK6yQBqlHci
	 w7d9ViDKV36zayhKsxagDoOqzHnVeUqO6R+N6W63eeiHYaTMfkMemzeZ/S1yvydXun
	 rgBxGJo2CkxgxNx9GwIYY4uh//3kvSlvFeop7GIhHu8V/uZErutfv7Y3ipd6Z7+T66
	 X8qdZLzzecnV/S6Cg6k9NYJboZ5e1+x0cyaQkL5h+18YyOb6FBQq52e5DsLClFVFxC
	 I//BUk7/Afy/A==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 26 Nov 2026 19:13:02 +0100
X-ME-IP: 2a01:cb10:785:b00:9f13:a1ff:dc18:901b
Message-ID: <d9061bf1-2445-425e-a254-0b33dcf4db8f@wanadoo.fr>
Date: Thu, 26 Nov 2026 19:12:58 +0100
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
 <a526e002-c8fc-4935-95f9-5943cb557e99@web.de>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <a526e002-c8fc-4935-95f9-5943cb557e99@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 26/11/2026 à 17:15, Markus Elfring a écrit :
>> Your patch is related to bcm_enet_probe().
>>
>> See L1754 and L1791. These 2 calls are related to 2 clk_disable_unprepare() calls in the error handling path and in the remove function.
>>
>> Why only update one place, and keep one clk_disable_unprepare()?
> 
> I got also the impression finally that implementation details would need
> further clarifications and development considerations.
> 
> * Conditions are checked for the ungating of the item “priv->phy_clk”.
>    https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/broadcom/bcm63xx_enet.c#L1789-L1800
> 
> * But a clk_disable_unprepare(priv->phy_clk) call is unconditionally performed
>    in the implementation of the function “bcm_enet_remove” so far.
>    https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/broadcom/bcm63xx_enet.c#L1930
> 
>    Is there a need to adjust the control flow any further?

You kwow the answer, it used to be one of your favorite pattern, so why ask?

> 
> 
> Regards,
> Markus

