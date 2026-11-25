Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.12.242.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644525;
	b=K0tkWSYr10JyyiMtEpqASOfj1xt/oUMUZP4BgrCCCRYCR2OgMSMCy7vi1vozBcA4Bo1a
	 fTmdagoZXfvbS9tuo+wzt80Hfg7HAjsdnbVXyiJs4EH2fHHGsqNdF2LpKi+j81+BcRd4/
	 fUIViJUz+k3kmEtuMRjenGiy3rmxoH2hRRX8yhy+e41YsFoOmiDngXNNrpOpctF9Xe829
	 c9eU3QHROeDpQl7u4DCawPSziJBM5tedE7v0Mw2Lxf6UvVRc74LCPgBI+Ey6RZmE7ExnL
	 FVykWIZoXBuUCC7r/fGoS4RgMxzwvgMOsBMbnIb5FklFUKUVztjPwvPAV6c6KAWhVXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644525;
	h=DMARC-Filter:Received:DKIM-Signature:X-ME-Helo:X-ME-Auth:X-ME-Date:
	 X-ME-IP:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YC2VK93HkvqMATxvGGmq5SS6Vul75+B1jHNnpTCePKU=;
	b=xHUQn8EuPhibXmw3fEbBbY87I52VDMHOAu2wWuxkrjlcACsX4aoNWnrmgddh0ib6u/LL
	 VsOYX/XIMTqS/SuKPoXG/+dCTz/vkWYC3rLRoEfeViRoWYJNluJOqE/z5RMc56LEFtd0I
	 oyIRECOWyODwdw6xs4sa3kI3ySNBqHCsQBnF7aYB+XU0EAa0T0ChpvkPenL1x0lFs1+tH
	 EwPcMO5M6i5KP9NoLrWu7Q5lB2W1I2iKc8g3FwvQQW26xljjiotQBzd/74APMXuQ3cRCV
	 g14k9wvPMsTQVI6lC9kQOhvw69icL5PzKgTS9BAfzG8BJG/MFDglDOvMvYltZgeNEEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wanadoo.fr;
	spf=pass smtp.mailfrom=wanadoo.fr;
	dkim=pass header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=C0Z4QEfh;
	arc=none smtp.remote-ip=80.12.242.78
Received: from smtp.smtpout.orange.fr (smtp-78.smtpout.orange.fr [80.12.242.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96737606A321;
	Wed, 25 Nov 2026 22:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96737606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=C0Z4QEfh
Received: from [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
 ([IPv6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b])
	by smtp.orange.fr with ESMTPSA
	id WLAGxbx73qZBYWLAHxXej8; Wed, 25 Nov 2026 23:08:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1795644517;
	bh=YC2VK93HkvqMATxvGGmq5SS6Vul75+B1jHNnpTCePKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=C0Z4QEfhJGa1UxoE+RYk06DuFaVwb6AfeMBe6psWBbwOWxy+tXi9apwxBsJFn2FzU
	 jesEWH94S7sjXxvBFpGjoNLYMJn+gvRvFh06a+DDz4N++1ppxT3gTcE/cLdg3FicyZ
	 zc6KnH4082wk0IgcE5/KgxwxZbzmYw8p/p3X3XFNxfSOcWjE8Cjl9ndXTz/Ly5m2M2
	 oyogI0F44mEEPOqJYb58s3v2yVT3HSQmzqSaWmcC9RUeV6pQwySkuhCDMhAu0IiGu6
	 IxXCkNoLOihWpxGRl0/DmSszvQXNpj+Lda8bREEjnuf4iYYdyQf8VfpR8lYkOBVeue
	 IyhRN7rZB1WZw==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:9f13:a1ff:dc18:901b]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 25 Nov 2026 23:08:37 +0100
X-ME-IP: 2a01:cb10:785:b00:9f13:a1ff:dc18:901b
Message-ID: <9c26b213-aa58-4c27-99c7-926c6b4d5275@wanadoo.fr>
Date: Wed, 25 Nov 2026 23:08:31 +0100
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
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <603d7ea7-5d7d-49c4-a01b-a7805e88c361@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 25/11/2026 à 19:42, Markus Elfring a écrit :
>> Why changing only one devm_clk_get()?
> The change relevance is varying for the involved clocks of the affected Linux drivers,
> isn't it?

Your patch is related to bcm_enet_probe().

See L1754 and L1791. These 2 calls are related to 2 
clk_disable_unprepare() calls in the error handling path and in the 
remove function.

Why only update one place, and keep one clk_disable_unprepare()?

> 
> * bcm_enet_probe()
>    https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/broadcom/bcm63xx_enet.c#L1711-L1898
> 
> * bcm_enetsw_probe()
>    https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/broadcom/bcm63xx_enet.c#L2641-L2735
> 
> 
> Regards,
> Markus

