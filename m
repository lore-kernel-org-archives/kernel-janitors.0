From: Simon Horman <horms@verge.net.au>
Date: Mon, 07 Feb 2011 09:09:37 +0000
Subject: Re: [patch] IPVS: precedence bug in ip_vs_sync_switch_mode()
Message-Id: <20110207090936.GC12367@verge.net.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110207083855.GD4384@bicker>
In-Reply-To: <20110207083855.GD4384@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Wensong Zhang <wensong@linux-vs.org>, Julian Anastasov <ja@ssi.bg>, hans.schillstrom@ericsson.com, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Feb 07, 2011 at 11:38:55AM +0300, Dan Carpenter wrote:
> '!' has higher precedence than '&'.  IP_VS_STATE_MASTER is 0x1 so
> the original code is equivelent to if (!ipvs->sync_state) ...

Thanks Dan, I'll push this to Patrick ASAP.

For the record, this seems to have been added as part of the
new synchronisation code and as such is only present in
development trees at this time. i.e. its not in .37 nor scheduled for .38.

> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/net/netfilter/ipvs/ip_vs_sync.c b/net/netfilter/ipvs/ip_vs_sync.c
> index 2a2a836..d1b7298 100644
> --- a/net/netfilter/ipvs/ip_vs_sync.c
> +++ b/net/netfilter/ipvs/ip_vs_sync.c
> @@ -392,7 +392,7 @@ void ip_vs_sync_switch_mode(struct net *net, int mode)
>  {
>  	struct netns_ipvs *ipvs = net_ipvs(net);
>  
> -	if (!ipvs->sync_state & IP_VS_STATE_MASTER)
> +	if (!(ipvs->sync_state & IP_VS_STATE_MASTER))
>  		return;
>  	if (mode = ipvs->sysctl_sync_ver || !ipvs->sync_buff)
>  		return;
> --
> To unsubscribe from this list: send the line "unsubscribe lvs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
