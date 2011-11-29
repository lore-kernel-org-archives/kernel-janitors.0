From: Marek Lindner <lindner_marek@yahoo.de>
Date: Tue, 29 Nov 2011 06:41:23 +0000
Subject: Re: [B.A.T.M.A.N.] [patch] batman-adv: remove extra negation in gw_out_of_range()
Message-Id: <201111291441.24078.lindner_marek@yahoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111129060909.GA6098@elgon.mountain>
In-Reply-To: <20111129060909.GA6098-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: b.a.t.m.a.n-ZwoEplunGu2X36UT3dwllkB+6BGkLq7r@public.gmane.org
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Wunderlich <siwu-MaAgPAbsBIVS8oHt8HbXEIQuADTiUCJX@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

On Tuesday, November 29, 2011 14:09:09 Dan Carpenter wrote:
> There is a typo here where an extra '!' made the check to the opposite
> of what was intended.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/net/batman-adv/gateway_client.c
> b/net/batman-adv/gateway_client.c index 9373a14..24403a7 100644
> --- a/net/batman-adv/gateway_client.c
> +++ b/net/batman-adv/gateway_client.c
> @@ -695,7 +695,7 @@ bool gw_out_of_range(struct bat_priv *bat_priv,
>  	}
> 
>  	neigh_old = find_router(bat_priv, orig_dst_node, NULL);
> -	if (!!neigh_old)
> +	if (!neigh_old)
>  		goto out;
> 
>  	if (curr_tq_avg - neigh_old->tq_avg > GW_THRESHOLD)


Wow - you are right! Applied in our tree.

Thanks,
Marek
