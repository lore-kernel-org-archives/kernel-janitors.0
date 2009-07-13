From: Zhu Yi <yi.zhu@intel.com>
Date: Mon, 13 Jul 2009 00:56:01 +0000
Subject: Re: [PATCH 4/5] drivers/net: Drop unnecessary NULL test
Message-Id: <1247446561.26347.10.camel@debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907122205060.22658@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907122205060.22658@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "jketreno@linux.intel.com" <jketreno@linux.intel.com>, "Chatre, Reinette" <reinette.chatre@intel.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ipw2100-devel@lists.sourceforge.net" <ipw2100-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, 2009-07-13 at 04:05 +0800, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The result of container_of should not be NULL.  In particular, in this case
> the argument to the enclosing function has passed though INIT_WORK, which
> dereferences it, implying that its container cannot be NULL.
> 
> A simplified version of the semantic patch that makes this change is as
> follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> identifier fn,work,x,fld;
> type T;
> expression E1,E2;
> statement S;
> @@
> 
> static fn(struct work_struct *work) {
>   ... when != work = E1
>   x = container_of(work,T,fld)
>   ... when != x = E2
> - if (x = NULL) S
>   ...
> }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Zhu Yi <yi.zhu@intel.com>

Thanks,
-yi
> ---
>  drivers/net/wireless/ipw2x00/ipw2200.c         |    3 ---
>  1 files changed, 0 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ipw2x00/ipw2200.c b/drivers/net/wireless/ipw2x00/ipw2200.c
> index d726b3c..2dc1cdb 100644
> --- a/drivers/net/wireless/ipw2x00/ipw2200.c
> +++ b/drivers/net/wireless/ipw2x00/ipw2200.c
> @@ -7250,9 +7250,6 @@ static void ipw_bg_qos_activate(struct work_struct *work)
>  	struct ipw_priv *priv >  		container_of(work, struct ipw_priv, qos_activate);
>  
> -	if (priv = NULL)
> -		return;
> -
>  	mutex_lock(&priv->mutex);
>  
>  	if (priv->status & STATUS_ASSOCIATED)

