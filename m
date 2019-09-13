From: walter harms <wharms@bfs.de>
Date: Fri, 13 Sep 2019 07:14:58 +0000
Subject: Re: [PATCH] media: v4l: cadence: Fix how unsued lanes are handled in 'csi2rx_start()'
Message-Id: <5D7B41F2.2080607@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190912204450.17625-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190912204450.17625-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: mripard@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 12.09.2019 22:44, schrieb Christophe JAILLET:
> The 2nd parameter of 'find_first_zero_bit()' is a number of bits, not of
> bytes. So use 'BITS_PER_LONG' instead of 'sizeof(lanes_used)'.
> 
> Fixes: 1fc3b37f34f6 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is purely speculative. Using BITS_PER_LONG looks logical to me,
> but I'm not 100% sure that it is what is expected here. 'csi2rx->max_lanes'
> could also be a good candidate.
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 31ace114eda1..28765ccb1b12 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -129,7 +129,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  	 */
>  	for (i = csi2rx->num_lanes; i < csi2rx->max_lanes; i++) {
>  		unsigned int idx = find_first_zero_bit(&lanes_used,
> -						       sizeof(lanes_used));
> +						       BITS_PER_LONG);

why not CHAR_BIT*sizeof(lanes_used) ?
 this would have the advantage that it is independent of future changes of lanes_used.

re,
 wh

>  		set_bit(idx, &lanes_used);
>  		reg |= CSI2RX_STATIC_CFG_DLANE_MAP(i, i + 1);
>  	}
