From: Felix Manlunas <felix.manlunas@cavium.com>
Date: Mon, 03 Apr 2017 18:40:20 +0000
Subject: Re: [PATCH -next] liquidio: clear the correct memory
Message-Id: <20170403184020.GA1018@felix-thinkpad.cavium.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170403181827.GA6505@mwanda>
In-Reply-To: <20170403181827.GA6505@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Derek Chickles <derek.chickles@caviumnetworks.com>, Prasad Kanneganti <prasad.kanneganti@cavium.com>, Satanand Burla <satananda.burla@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 2017-Apr-03 21:18:27 +0300

> There is a cut and paste bug here so we accidentally clear the first
> few bytes of "resp" a second time instead clearing "ctx".
> 
> Fixes: 50c0add534d2 ("liquidio: refactor interrupt moderation code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c b/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c
> index fac02ed2c449..dab10c7e4443 100644
> --- a/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c
> +++ b/drivers/net/ethernet/cavium/liquidio/lio_ethtool.c
> @@ -1359,7 +1359,7 @@ static int octnet_get_intrmod_cfg(struct lio *lio,
>  	memset(resp, 0, sizeof(struct oct_intrmod_resp));
>  
>  	ctx = (struct oct_intrmod_context *)sc->ctxptr;
> -	memset(resp, 0, sizeof(struct oct_intrmod_context));
> +	memset(ctx, 0, sizeof(struct oct_intrmod_context));
>  	WRITE_ONCE(ctx->cond, 0);
>  	ctx->octeon_id = lio_get_device_id(oct_dev);
>  	init_waitqueue_head(&ctx->wc);

Good catch, Dan.  Thanks.

Acked-by: Felix Manlunas <felix.manlunas@cavium.com>
