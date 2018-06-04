From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 04 Jun 2018 13:25:14 +0000
Subject: Re: [PATCH] fsl/qe: ucc: copy and paste bug in ucc_get_tdm_sync_shift()
Message-Id: <alpine.DEB.2.20.1806042223580.3542@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180604115842.7c4vzge3igjbnblt@kili.mountain>
In-Reply-To: <20180604115842.7c4vzge3igjbnblt@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Mon, 4 Jun 2018, Dan Carpenter wrote:

> There is a copy and paste bug so we accidentally use the RX_ shift when
> we're in TX_ mode.
>
> Fixes: bb8b2062aff3 ("fsl/qe: setup clock source for TDM mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis work.  Not tested.  This affects the success path, so
> we should probably test it.

Maybe this is another one?  I don't have time to look into it at the
moment...

drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c

 	/* For strict priority entries defines the number of consecutive
 	 * slots for the highest priority.
 	 */
	REG_WR(bp, (port) ? NIG_REG_P1_TX_ARB_NUM_STRICT_ARB_SLOTS :
		   NIG_REG_P1_TX_ARB_NUM_STRICT_ARB_SLOTS, 0x100);
 	/* Mapping between the CREDIT_WEIGHT registers and actual client
 	 * numbers
 	 */

I find some others that choose between constants, such as ... ? 0 : 0.

julia


>
> diff --git a/drivers/soc/fsl/qe/ucc.c b/drivers/soc/fsl/qe/ucc.c
> index c646d8713861..681f7d4b7724 100644
> --- a/drivers/soc/fsl/qe/ucc.c
> +++ b/drivers/soc/fsl/qe/ucc.c
> @@ -626,7 +626,7 @@ static u32 ucc_get_tdm_sync_shift(enum comm_dir mode, u32 tdm_num)
>  {
>  	u32 shift;
>
> -	shift = (mode = COMM_DIR_RX) ? RX_SYNC_SHIFT_BASE : RX_SYNC_SHIFT_BASE;
> +	shift = (mode = COMM_DIR_RX) ? RX_SYNC_SHIFT_BASE : TX_SYNC_SHIFT_BASE;
>  	shift -= tdm_num * 2;
>
>  	return shift;
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
