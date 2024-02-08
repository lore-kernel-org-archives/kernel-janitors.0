Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F9F85645
	for <kernel-janitors@vger.kernel.org>; Thu,  8 Feb 2024 17:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.254.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707415062; cv=none; b=DrEHnEn3q4whVS7GE/YL2Au/Z6UduN0u5oNMlkOsgWwCKueRmEs9/r+Ly8Qezle6OxH+WGNnFpyyPHrETP1Xxd2LU+ALUEsJElnCNCB2Mj+KotDHOmoaBiW48u2gvmqwlVtnDsDOU+4D0ePdys9+6dqYXAHep+v0XwW/LHOmY7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707415062; c=relaxed/simple;
	bh=OYQ6fSLDTbrX/LcV5tmTCwtLEwd9EfqoZckoJw1jeJI=;
	h=To:From:Subject:Date:Message-ID:References:Mime-Version:
	 Content-Type:In-Reply-To:Cc; b=Ew7glmtfCxh6LZLBlZEcTM6k3rbb8eMD3K6YM6aJn65n7xoVRHv26MkRekkrJ7Joi5op1jhiGMGNpQOvV1CS4GuOaVFXB10sLUmidjRnNUUnMwBWtP9e9B8xfE2bPNyZnb26wlcp9Ec0dnIxKHtGTWiOMo0vkeqJIR9bGNyjKOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=m.gmane-mx.org; arc=none smtp.client-ip=116.202.254.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.gmane-mx.org
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
	id 1rY8eS-0005BT-7w
	for kernel-janitors@vger.kernel.org; Thu, 08 Feb 2024 18:57:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: kernel-janitors@vger.kernel.org
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] mux: Remove usage of the deprecated ida_simple_xx() API
Date: Thu, 8 Feb 2024 18:57:25 +0100
Message-ID: <9edc26e9-4f31-496a-969d-0edc33ef6f01@wanadoo.fr>
References: <727714bdfcd69d21e7f2a0c5c7426fcb70439b91.1702228605.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla Thunderbird
Content-Language: en-MW
In-Reply-To: <727714bdfcd69d21e7f2a0c5c7426fcb70439b91.1702228605.git.christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org
Message-ID: <20240208175725.BcFDIs8_geliRAZbA0eBgmJA4VeTv5NKpfIAGCIqFdU@z>

Le 10/12/2023 à 18:17, Christophe JAILLET a écrit :
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> This is less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/mux/core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mux/core.c b/drivers/mux/core.c
> index 775816112932..78c0022697ec 100644
> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -64,7 +64,7 @@ static void mux_chip_release(struct device *dev)
>   {
>   	struct mux_chip *mux_chip = to_mux_chip(dev);
>   
> -	ida_simple_remove(&mux_ida, mux_chip->id);
> +	ida_free(&mux_ida, mux_chip->id);
>   	kfree(mux_chip);
>   }
>   
> @@ -111,7 +111,7 @@ struct mux_chip *mux_chip_alloc(struct device *dev,
>   	mux_chip->dev.of_node = dev->of_node;
>   	dev_set_drvdata(&mux_chip->dev, mux_chip);
>   
> -	mux_chip->id = ida_simple_get(&mux_ida, 0, 0, GFP_KERNEL);
> +	mux_chip->id = ida_alloc(&mux_ida, GFP_KERNEL);
>   	if (mux_chip->id < 0) {
>   		int err = mux_chip->id;
>   

Hi,

gentle reminder.

All patches to remove the ida_simple API have been sent.
And Matthew Wilcox seems happy with the on going work. (see [1])

Based on next-20240207
$git grep ida_simple_get | wc -l
38

https://elixir.bootlin.com/linux/v6.8-rc3/A/ident/ida_simple_get
50

https://elixir.bootlin.com/linux/v6.7.4/A/ident/ida_simple_get
81

Thanks
CJ

[1]: https://lore.kernel.org/all/ZaqruGVz734zjxrZ@casper.infradead.org/

