From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Jun 2019 16:06:09 +0000
Subject: Re: [PATCH] net: lio_core: fix potential sign-extension overflow on large shift
Message-Id: <20190617160609.GH28859@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190617155325.27017-1-colin.king@canonical.com>
In-Reply-To: <20190617155325.27017-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Derek Chickles <dchickles@marvell.com>, Satanand Burla <sburla@marvell.com>, Felix Manlunas <fmanlunas@marvell.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jun 17, 2019 at 04:53:25PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Left shifting the signed int value 1 by 31 bits has undefined behaviour
> and the shift amount oq_no can be as much as 63.  Fix this by widening
> the int 1 to 1ULL.
> 
> Addresses-Coverity: ("Bad shift operation")
> Fixes: f21fb3ed364b ("Add support of Cavium Liquidio ethernet adapters")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/cavium/liquidio/lio_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/cavium/liquidio/lio_core.c b/drivers/net/ethernet/cavium/liquidio/lio_core.c
> index 1c50c10b5a16..e78bdcee200f 100644
> --- a/drivers/net/ethernet/cavium/liquidio/lio_core.c
> +++ b/drivers/net/ethernet/cavium/liquidio/lio_core.c
> @@ -964,7 +964,7 @@ static void liquidio_schedule_droq_pkt_handlers(struct octeon_device *oct)
>  
>  			if (droq->ops.poll_mode) {
>  				droq->ops.napi_fn(droq);
> -				oct_priv->napi_mask |= (1 << oq_no);
> +				oct_priv->napi_mask |= (1ULL << oq_no);

The function uses BIT_ULL(oq_no) earlier, so we should probably do the
same here.

regards,
dan carpenter
