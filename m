From: Zhu Yi <yi.zhu@intel.com>
Date: Mon, 04 Aug 2008 02:41:18 +0000
Subject: Re: [PATCH 4/7] drivers/net/wireless/ipw2100.c: Release mutex in
Message-Id: <1217817678.3107.11.camel@debian.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807210957490.24625@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807210957490.24625@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: jketreno@linux.intel.com, reinette.chatre@intel.com, linux-wireless@vger.kernel.org, ipw2100-devel@lists.sourceforge.net, jgarzik@pobox.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2008-07-21 at 09:58 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The mutex is released on a successful return, so it would seem that it
> should be released on an error return as well.

Acked-by: Zhu Yi <yi.zhu@intel.com>

Thanks,
-yi

> The semantic patch finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> expression l;
> @@
> 
> mutex_lock(l);
> ... when != mutex_unlock(l)
>     when any
>     when strict
> (
> if (...) { ... when != mutex_unlock(l)
> +   mutex_unlock(l);
>     return ...;
> }
> |
> mutex_unlock(l);
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
> diff -u -p a/drivers/net/wireless/ipw2100.c b/drivers/net/wireless/ipw2100.c
> --- a/drivers/net/wireless/ipw2100.c
> +++ b/drivers/net/wireless/ipw2100.c
> @@ -6442,6 +6442,7 @@ static int ipw2100_resume(struct pci_dev
>  	if (err) {
>  		printk(KERN_ERR "%s: pci_enable_device failed on resume\n",
>  		       dev->name);
> +		mutex_unlock(&priv->action_mutex);
>  		return err;
>  	}
>  	pci_restore_state(pci_dev);
> @@ -7146,7 +7147,7 @@ static int ipw2100_wx_get_rate(struct ne
>  	err = ipw2100_get_ordinal(priv, IPW_ORD_CURRENT_TX_RATE, &val, &len);
>  	if (err) {
>  		IPW_DEBUG_WX("failed querying ordinals.\n");
> -		return err;
> +		goto done;
>  	}
>  
>  	switch (val & TX_RATE_MASK) {

