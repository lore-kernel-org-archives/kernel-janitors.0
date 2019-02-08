From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Fri, 08 Feb 2019 16:44:28 +0000
Subject: Re: [bug report] drivers: net: use flow action infrastructure
Message-Id: <20190208164428.crqg2t6mo5rr4i73@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190208083407.GA8700@kadam>
In-Reply-To: <20190208083407.GA8700@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 08, 2019 at 11:34:08AM +0300, Dan Carpenter wrote:
> Hello Pablo Neira Ayuso,
> 
> The patch 738678817573: "drivers: net: use flow action
> infrastructure" from Feb 2, 2019, leads to the following static
> checker warning:
> 
> 	drivers/net/ethernet/netronome/nfp/flower/action.c:618 nfp_fl_pedit()
> 	error: uninitialized symbol 'idx'.
> 
> drivers/net/ethernet/netronome/nfp/flower/action.c
>     587 static int
>     588 nfp_fl_pedit(const struct flow_action_entry *act,
>     589 	     struct tc_cls_flower_offload *flow,
>     590 	     char *nfp_action, int *a_len, u32 *csum_updated)
>     591 {
>     592 	struct flow_rule *rule = tc_cls_flower_offload_flow_rule(flow);
>     593 	struct nfp_fl_set_ipv6_addr set_ip6_dst, set_ip6_src;
>     594 	struct nfp_fl_set_ipv6_tc_hl_fl set_ip6_tc_hl_fl;
>     595 	struct nfp_fl_set_ip4_ttl_tos set_ip_ttl_tos;
>     596 	struct nfp_fl_set_ip4_addrs set_ip_addr;
>     597 	enum flow_action_mangle_base htype;
>     598 	struct nfp_fl_set_tport set_tport;
>     599 	struct nfp_fl_set_eth set_eth;
>     600 	size_t act_size = 0;
>     601 	u8 ip_proto = 0;
>     602 	int idx, err;
>                 ^^^^^^^

https://patchwork.ozlabs.org/patch/1038751/

I forgot to Cc you, sorry Dan.

Thanks for reporting.
