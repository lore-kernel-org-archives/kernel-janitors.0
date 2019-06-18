From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 18 Jun 2019 14:15:03 +0000
Subject: Re: [PATCH][next] netfilter: synproxy: ensure zero is returned on non-error return path
Message-Id: <19114a71-d0e7-b1bb-3aae-9bb6c5a819e5@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190618141319.14961-1-colin.king@canonical.com>
In-Reply-To: <20190618141319.14961-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 18/06/2019 15:13, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently function nf_synproxy_ipv6_init returns an uninitialized
> garbage value in variable ret on a successful return.  Fix this by
> returning zero on success.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: d7f9b2f18eae ("netfilter: synproxy: extract SYNPROXY infrastructure from {ipt, ip6t}_SYNPROXY")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/netfilter/nf_synproxy_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/netfilter/nf_synproxy_core.c b/net/netfilter/nf_synproxy_core.c
> index 50677285f82e..701f880d01e6 100644
> --- a/net/netfilter/nf_synproxy_core.c
> +++ b/net/netfilter/nf_synproxy_core.c
> @@ -1223,7 +1223,7 @@ nf_synproxy_ipv6_init(struct synproxy_net *snet, struct net *net)
>  	}
>  
>  	snet->hook_ref6++;
> -	return err;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(nf_synproxy_ipv6_init);
>  
> 
Scratch that, I've noticed the same issue in the ipv4 code too. I'll
send a V2.
