From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Thu, 19 Aug 2010 08:49:51 +0000
Subject: Re: [PATCH] slip: Use net_device_stats from struct net_device
Message-Id: <1282207791.2549.16.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282206313-10667-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1282206313-10667-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tobias Klauser <tklauser@distanz.ch>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Le jeudi 19 août 2010 à 10:25 +0200, Tobias Klauser a écrit :
> Use net_device->stats for stats instead of private variable copies in
> struct slip.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  drivers/net/slip.c |   64 ++++++++++++++++++++++------------------------------
>  drivers/net/slip.h |    9 -------
>  2 files changed, 27 insertions(+), 46 deletions(-)


> @@ -561,36 +562,25 @@ static int sl_change_mtu(struct net_device *dev, int new_mtu)
>  static struct net_device_stats *
>  sl_get_stats(struct net_device *dev)
>  {
> -	static struct net_device_stats stats;
> +	struct net_device_stats *stats = &dev->stats;
>  	struct slip *sl = netdev_priv(dev);
>  #ifdef SL_INCLUDE_CSLIP
>  	struct slcompress *comp;
>  #endif
>  
> -	memset(&stats, 0, sizeof(struct net_device_stats));
> -
> -	stats.rx_packets     = sl->rx_packets;
> -	stats.tx_packets     = sl->tx_packets;
> -	stats.rx_bytes	     = sl->rx_bytes;
> -	stats.tx_bytes	     = sl->tx_bytes;
> -	stats.rx_dropped     = sl->rx_dropped;
> -	stats.tx_dropped     = sl->tx_dropped;
> -	stats.tx_errors      = sl->tx_errors;
> -	stats.rx_errors      = sl->rx_errors;
> -	stats.rx_over_errors = sl->rx_over_errors;
>  #ifdef SL_INCLUDE_CSLIP
> -	stats.rx_fifo_errors = sl->rx_compressed;
> -	stats.tx_fifo_errors = sl->tx_compressed;
> -	stats.collisions     = sl->tx_misses;
> +	stats->rx_fifo_errors = sl->rx_compressed;
> +	stats->tx_fifo_errors = sl->tx_compressed;
> +	stats->collisions     = sl->tx_misses;
>  	comp = sl->slcomp;
>  	if (comp) {
> -		stats.rx_fifo_errors += comp->sls_i_compressed;
> -		stats.rx_dropped     += comp->sls_i_tossed;
> -		stats.tx_fifo_errors += comp->sls_o_compressed;
> -		stats.collisions     += comp->sls_o_misses;
> +		stats->rx_fifo_errors += comp->sls_i_compressed;
> +		stats->rx_dropped     += comp->sls_i_tossed;
> +		stats->tx_fifo_errors += comp->sls_o_compressed;
> +		stats->collisions     += comp->sls_o_misses;
>  	}
> -#endif /* CONFIG_INET */
> -	return (&stats);
> +#endif
> +	return stats;
>  }
>  

Hmm, this is wrong.

Each time sl_get_stats() is called, you are adding stuff to dev->stats

Quite frankly I dont think its a kernel-janitors@vger.kernel.org patch,
its pretty normal netdev stuff.

Please take a look at prior patch posted yesterday.

http://marc.info/?l=linux-netdev&m8213719605250&w=2

Because either you should build your patch on top of it, or ask David to
revert mine before ;)

I advise using a ndo_get_stats64() so that you can perform the adds on a
private destination buffer.

Thanks


