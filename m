From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 11 May 2020 07:54:56 +0000
Subject: Re: [PATCH v2] net/sonic: Fix some resource leaks in error handling paths
Message-Id: <f9a2c71b-e001-d546-64cd-8a904ae881ca@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3eaa58c16dcf313ff7cb873dcff21659b0ea037d.1589158098.git.fthain@telegraphics.com.au>
In-Reply-To: <3eaa58c16dcf313ff7cb873dcff21659b0ea037d.1589158098.git.fthain@telegraphics.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Finn Thain <fthain@telegraphics.com.au>, "David S. Miller" <davem@davemloft.net>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, netdev@vger.kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>, =?UTF-8?Q?Thomas_Bogend=c3=b6rfer?= <tsbogend@alpha.franken.de>, Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Changed since v1:
>  - Improved commit log slightly.
>  - Changed 'undo_probe1' to 'undo_probe' where appropriate.

I find this response interesting.


> ---

I suggest to replace these triple dashes by a blank line.


>  drivers/net/ethernet/natsemi/macsonic.c | 17 +++++++++++++----
>  drivers/net/ethernet/natsemi/xtsonic.c  |  7 +++++--

I imagine that this change combination will need further clarification
because David Miller provided the information “Applied, thanks.” on 2020-04-27.

net/sonic: Fix a resource leak in an error handling path in 'jazz_sonic_probe()'
https://lore.kernel.org/patchwork/comment/1426045/
https://lkml.org/lkml/2020/4/27/1014


…
> +++ b/drivers/net/ethernet/natsemi/xtsonic.c
> @@ -229,11 +229,14 @@ int xtsonic_probe(struct platform_device *pdev)
>  	sonic_msg_init(dev);
>
>  	if ((err = register_netdev(dev)))
> -		goto out1;
> +		goto undo_probe1;
>
>  	return 0;
>
> -out1:
> +undo_probe1:
> +	dma_free_coherent(lp->device,
> +			  SIZEOF_SONIC_DESC * SONIC_BUS_SCALE(lp->dma_bitmode),
> +			  lp->descriptors, lp->descriptors_laddr);
>  	release_region(dev->base_addr, SONIC_MEM_SIZE);
>  out:
…

Can it be nicer to use the label “free_dma”?

Regards,
Markus
