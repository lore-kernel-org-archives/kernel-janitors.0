From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 09 May 2020 06:15:18 +0000
Subject: Re: [PATCH] net/sonic: Fix some resource leaks in error handling paths
Message-Id: <b7651b26-ac1e-6281-efb2-7eff0018b158@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508172557.218132-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200508172557.218132-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Finn Thain <fthain@telegraphics.com.au>, Jakub Kicinski <kuba@kernel.org>

> While at it, rename a label in order to be slightly more informative and
> split some too long lines.

Would you like to add the tag “Fixes” to the change description?


…
> +++ b/drivers/net/ethernet/natsemi/macsonic.c
> @@ -506,10 +506,14 @@ static int mac_sonic_platform_probe(struct platform_device *pdev)
>
>  	err = register_netdev(dev);
>  	if (err)
> -		goto out;
> +		goto undo_probe1;
>
>  	return 0;
>
> +undo_probe1:
> +	dma_free_coherent(lp->device,
> +			  SIZEOF_SONIC_DESC * SONIC_BUS_SCALE(lp->dma_bitmode),
> +			  lp->descriptors, lp->descriptors_laddr);
>  out:
…

How do you think about the possibility to use the label “free_dma”?

Regards,
Markus
