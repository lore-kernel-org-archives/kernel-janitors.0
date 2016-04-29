From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Fri, 29 Apr 2016 09:09:59 +0000
Subject: Re: [PATCH] nf_nat_packet: Clear skb hash after modifying packet headers.
Message-Id: <20160429090959.GA7236@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1461187870-54322-1-git-send-email-jarno@ovn.org>
In-Reply-To: <1461187870-54322-1-git-send-email-jarno@ovn.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarno Rajahalme <jarno@ovn.org>
Cc: netfilter-devel@vger.kernel.org, kernel-janitors@vger.kernel.org, dev@openvswitch.org, fw@strlen.de

On Wed, Apr 20, 2016 at 02:31:10PM -0700, Jarno Rajahalme wrote:
> Clear the skb hash when it does not reflect the actual header values
> any more.
> 
> Signed-off-by: Jarno Rajahalme <jarno@ovn.org>
> ---
>  net/netfilter/nf_nat_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/net/netfilter/nf_nat_core.c b/net/netfilter/nf_nat_core.c
> index 06a9f45..3c2302f 100644
> --- a/net/netfilter/nf_nat_core.c
> +++ b/net/netfilter/nf_nat_core.c
> @@ -505,6 +505,7 @@ unsigned int nf_nat_packet(struct nf_conn *ct,
>  		if (!l3proto->manip_pkt(skb, 0, l4proto, &target, mtype))
>  			return NF_DROP;
>  	}
> +	skb_clear_hash(skb);
>  	return NF_ACCEPT;
>  }

Cc'ing Florian.

This seems to affect the new tracing infrastructure for nf_tables:

 31 static int trace_fill_id(struct sk_buff *nlskb, struct sk_buff
*skb)
 32 {
 33         __be32 id;
 34 
 35         /* using skb address as ID results in a limited number of
 36          * values (and quick reuse).
 37          *
 38          * So we attempt to use as many skb members that will not
 39          * change while skb is with netfilter.
 40          */
 41         id = (__be32)jhash_2words(hash32_ptr(skb), skb_get_hash(skb),
 42                                   skb->skb_iif);
 43 
 44         return nla_put_be32(nlskb, NFTA_TRACE_ID, id);
 45 }
