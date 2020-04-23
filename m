From: Joe Perches <joe@perches.com>
Date: Thu, 23 Apr 2020 08:12:24 +0000
Subject: Re: [PATCH] ipw2x00: Remove a memory allocation failure log message
Message-Id: <39759644335be80aa259f20f7cfc6108bd9de363.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200423075825.18206-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200423075825.18206-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, stas.yakovlev@gmail.com, kvalo@codeaurora.org, davem@davemloft.net
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2020-04-23 at 09:58 +0200, Christophe JAILLET wrote:
> Axe a memory allocation failure log message. This message is useless and
> incorrect (vmalloc is not used here for the memory allocation)
> 
> This has been like that since the very beginning of this driver in
> commit 43f66a6ce8da ("Add ipw2200 wireless driver.")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/net/wireless/intel/ipw2x00/ipw2200.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2200.c b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
> index 60b5e08dd6df..30c4f041f565 100644
> --- a/drivers/net/wireless/intel/ipw2x00/ipw2200.c
> +++ b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
> @@ -3770,10 +3770,9 @@ static int ipw_queue_tx_init(struct ipw_priv *priv,
>  	struct pci_dev *dev = priv->pci_dev;
>  
>  	q->txb = kmalloc_array(count, sizeof(q->txb[0]), GFP_KERNEL);
> -	if (!q->txb) {
> -		IPW_ERROR("vmalloc for auxiliary BD structures failed\n");
> +	if (!q->txb)
>  		return -ENOMEM;
> -	}
> +

This might avoid possible defects by using kcalloc instead too
