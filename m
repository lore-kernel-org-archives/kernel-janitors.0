From: Ioana Ciornei <ioana.ciornei@nxp.com>
Date: Mon, 07 Dec 2020 15:04:58 +0000
Subject: Re: [PATCH] dpaa2-mac: Add a missing of_node_put after of_device_is_available
Message-Id: <20201207150457.arjw5geu2k6h2h2u@skbuf>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201206151339.44306-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201206151339.44306-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, "davem@davemloft.net" <davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Sun, Dec 06, 2020 at 04:13:39PM +0100, Christophe JAILLET wrote:
> Add an 'of_node_put()' call when a tested device node is not available.
> 
> Fixes:94ae899b2096 ("dpaa2-mac: add PCS support through the Lynx module")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>


Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Thanks!

> ---
>  drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
> index 90cd243070d7..828c177df03d 100644
> --- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
> +++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
> @@ -269,6 +269,7 @@ static int dpaa2_pcs_create(struct dpaa2_mac *mac,
>  
>  	if (!of_device_is_available(node)) {
>  		netdev_err(mac->net_dev, "pcs-handle node not available\n");
> +		of_node_put(node);
>  		return -ENODEV;
>  	}
>  
> -- 
> 2.27.0
> 
