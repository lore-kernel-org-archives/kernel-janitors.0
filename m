From: John Crispin <blogic@openwrt.org>
Date: Tue, 15 Mar 2016 07:27:48 +0000
Subject: Re: [patch 2/2 net-next] mediatek: unlock on error in mtk_tx_map()
Message-Id: <56E7B974.6050109@openwrt.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160315071904.GI13560@mwanda>
In-Reply-To: <20160315071904.GI13560@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Felix Fietkau <nbd@openwrt.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-mediatek@lists.infradead.org



On 15/03/2016 08:19, Dan Carpenter wrote:
> There was a missing unlock on the error path.
> 
> Fixes: 656e705243fd ('net-next: mediatek: add support for MT7623 ethernet')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Acked-by: John Crispin <blogic@openwrt.org>

Thanks !

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 9759fe5..c2c2e206 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -661,6 +661,8 @@ err_dma:
>  		itxd = mtk_qdma_phys_to_virt(ring, itxd->txd2);
>  	} while (itxd != txd);
>  
> +	spin_unlock_irqrestore(&eth->page_lock, flags);
> +
>  	return -ENOMEM;
>  }
>  
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
