From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Feb 2019 08:34:08 +0000
Subject: [bug report] drivers: net: use flow action infrastructure
Message-Id: <20190208083407.GA8700@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Pablo Neira Ayuso,

The patch 738678817573: "drivers: net: use flow action
infrastructure" from Feb 2, 2019, leads to the following static
checker warning:

	drivers/net/ethernet/netronome/nfp/flower/action.c:618 nfp_fl_pedit()
	error: uninitialized symbol 'idx'.

drivers/net/ethernet/netronome/nfp/flower/action.c
    587 static int
    588 nfp_fl_pedit(const struct flow_action_entry *act,
    589 	     struct tc_cls_flower_offload *flow,
    590 	     char *nfp_action, int *a_len, u32 *csum_updated)
    591 {
    592 	struct flow_rule *rule = tc_cls_flower_offload_flow_rule(flow);
    593 	struct nfp_fl_set_ipv6_addr set_ip6_dst, set_ip6_src;
    594 	struct nfp_fl_set_ipv6_tc_hl_fl set_ip6_tc_hl_fl;
    595 	struct nfp_fl_set_ip4_ttl_tos set_ip_ttl_tos;
    596 	struct nfp_fl_set_ip4_addrs set_ip_addr;
    597 	enum flow_action_mangle_base htype;
    598 	struct nfp_fl_set_tport set_tport;
    599 	struct nfp_fl_set_eth set_eth;
    600 	size_t act_size = 0;
    601 	u8 ip_proto = 0;
    602 	int idx, err;
                ^^^^^^^

    603 	u32 offset;
    604 
    605 	memset(&set_ip6_tc_hl_fl, 0, sizeof(set_ip6_tc_hl_fl));
    606 	memset(&set_ip_ttl_tos, 0, sizeof(set_ip_ttl_tos));
    607 	memset(&set_ip6_dst, 0, sizeof(set_ip6_dst));
    608 	memset(&set_ip6_src, 0, sizeof(set_ip6_src));
    609 	memset(&set_ip_addr, 0, sizeof(set_ip_addr));
    610 	memset(&set_tport, 0, sizeof(set_tport));
    611 	memset(&set_eth, 0, sizeof(set_eth));
    612 
    613 	htype = act->mangle.htype;
    614 	offset = act->mangle.offset;
    615 
    616 	switch (htype) {
    617 	case TCA_PEDIT_KEY_EX_HDR_TYPE_ETH:
--> 618 		err = nfp_fl_set_eth(act, idx, offset, &set_eth);
                                                  ^^^
Uninitialized.

    619 		break;
    620 	case TCA_PEDIT_KEY_EX_HDR_TYPE_IP4:
    621 		err = nfp_fl_set_ip4(act, idx, offset, &set_ip_addr,
    622 				     &set_ip_ttl_tos);

regards,
dan carpenter
