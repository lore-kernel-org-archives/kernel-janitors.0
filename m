From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Thu, 01 Mar 2012 10:23:41 +0000
Subject: Re: [PATCH 3/3] netfilter: Remove redundant code.
Message-Id: <20120301102341.GC6488@1984>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330593466-19317-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1330593466-19317-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh nayak <santoshprasadnayak@gmail.com>
Cc: bart.de.schuymer@pandora.be, kaber@trash.net, shemminger@vyatta.com, davem@davemloft.net, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, bridge@lists.linux-foundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Mar 01, 2012 at 02:47:46PM +0530, santosh nayak wrote:
> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> Remove the redundant code.
> 
> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
> ---
>  net/bridge/netfilter/ebtables.c |   18 ++++++------------
>  1 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/net/bridge/netfilter/ebtables.c b/net/bridge/netfilter/ebtables.c
> index 9c0f177..1efc234 100644
> --- a/net/bridge/netfilter/ebtables.c
> +++ b/net/bridge/netfilter/ebtables.c
> @@ -226,10 +226,8 @@ unsigned int ebt_do_table (unsigned int hook, struct sk_buff *skb,
>  
>  		if (EBT_MATCH_ITERATE(point, ebt_do_match, skb, &acpar) != 0)
>  			goto letscontinue;
> -		if (acpar.hotdrop) {
> -			read_unlock_bh(&table->lock);
> -			return NF_DROP;
> -		}
> +		if (acpar.hotdrop)
> +			goto out;

This is really broken! there's no "out" label in ebt_do_table as in
the previous patch!
