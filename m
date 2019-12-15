From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 15 Dec 2019 14:27:31 +0000
Subject: Re: [PATCH] net: gemini: Fix memory leak in gmac_setup_txqs
Message-Id: <403e8b6d-57df-e8d1-316c-150f833de842@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191215011045.15453-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191215011045.15453-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, Navid Emamdoost <emamd001@umn.edu>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, "David S. Miller" <davem@davemloft.net>

> +++ b/drivers/net/ethernet/cortina/gemini.c
> @@ -576,6 +576,8 @@ static int gmac_setup_txqs(struct net_device *netdev)
>
>  	if (port->txq_dma_base & ~DMA_Q_BASE_MASK) {
>  		dev_warn(geth->dev, "TX queue base is not aligned\n");
> +		dma_free_coherent(geth->dev, len * sizeof(*desc_ring),
> +				  desc_ring, port->txq_dma_base);
>  		kfree(skb_tab);
>  		return -ENOMEM;
>  	}

The added function call seems to be fine.
Would you like to avoid a bit of duplicate code for the exception handling?

Regards,
Markus
