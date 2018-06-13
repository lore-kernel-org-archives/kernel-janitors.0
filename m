From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jun 2018 09:22:18 +0000
Subject: Re: [PATCH 2/2] WAN: LMC: ensure lmc_trace is reporting return from lmc_proto_type
Message-Id: <20180613092218.cy3r4ugr2logvs3h@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180613060410.735-1-colin.king@canonical.com>
 <20180613060410.735-2-colin.king@canonical.com>
In-Reply-To: <20180613060410.735-2-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 13, 2018 at 07:04:10AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the lmc tracing is not reporting the return from function
> lmc_proto_type and this tracing statement is never executed. Fix
> this by returning through the end of the function.  Also fix a typo
> in the function name lmc_proto_type in the trace message.
> 
> Detected by CoverityScan, CID#710539 ("Structurally dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/wan/lmc/lmc_proto.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wan/lmc/lmc_proto.c b/drivers/net/wan/lmc/lmc_proto.c
> index 5a6c87bce1bf..b98c1ee860de 100644
> --- a/drivers/net/wan/lmc/lmc_proto.c
> +++ b/drivers/net/wan/lmc/lmc_proto.c
> @@ -99,23 +99,27 @@ void lmc_proto_close(lmc_softc_t *sc)
>  
>  __be16 lmc_proto_type(lmc_softc_t *sc, struct sk_buff *skb) /*FOLD00*/
>  {
> +	__be16 ret;
> +
>  	lmc_trace(sc->lmc_device, "lmc_proto_type in");

Did you take a look at lmc_trace()?  It's total garbage.  It's better
to just delete it.

regards,
dan carpenter

