From: "Eilon Greenstein" <eilong@broadcom.com>
Date: Tue, 21 Dec 2010 13:48:36 +0000
Subject: Re: [patch -next] bnx2x: remove bogus check
Message-Id: <1292939316.21210.7084.camel@lb-tlvb-eilong.il.broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101221070401.GF1936@bicker>
In-Reply-To: <20101221070401.GF1936@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, 2010-12-20 at 23:04 -0800, Dan Carpenter wrote:
> We dereferenced params on the line before so it's too late to check if
> params is NULL.  In fact, params can never be NULL and strict_cos is
> either 0 or 1 so that part of the check is bogus too.  Let's remove it.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thanks Dan!

Acked-by: Eilon Greenstein <eilong@broadcom.com>

> 
> diff --git a/drivers/net/bnx2x/bnx2x_link.c b/drivers/net/bnx2x/bnx2x_link.c
> index 97cbee2..43b0de2 100644
> --- a/drivers/net/bnx2x/bnx2x_link.c
> +++ b/drivers/net/bnx2x/bnx2x_link.c
> @@ -354,9 +354,6 @@ u8 bnx2x_ets_strict(const struct link_params *params, const u8 strict_cos)
>  	struct bnx2x *bp = params->bp;
>  	u32 val	= 0;
>  
> -	if ((1 < strict_cos) && (NULL = params))
> -		return -EINVAL;
> -
>  	DP(NETIF_MSG_LINK, "ETS enabled strict configuration\n");
>  	/**
>  	 * Bitmap of 5bits length. Each bit specifies whether the entry behaves
> 




