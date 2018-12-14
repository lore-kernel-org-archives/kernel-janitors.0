From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Dec 2018 09:55:29 +0000
Subject: [bug report] mpls: allow TTL propagation from IP packets to be configured
Message-Id: <20181214095529.GA13992@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Robert Shearman,

This is a semi-automatic email about new static checker warnings.

The patch a59166e47086: "mpls: allow TTL propagation from IP packets 
to be configured" from Mar 10, 2017, leads to the following Smatch 
complaint:

    net/mpls/mpls_iptunnel.c:153 mpls_xmit()
    warn: variable dereferenced before check 'out_dev' (see line 61)

net/mpls/mpls_iptunnel.c
    60		out_dev = dst->dev;
    61		net = dev_net(out_dev);
                              ^^^^^^^
Dereferenced.

    62	
    63		skb_orphan(skb);
    64	
    65		if (!mpls_output_possible(out_dev) ||
    66		    !dst->lwtstate || skb_warn_if_lro(skb))
    67			goto drop;
    68	
    69		skb_forward_csum(skb);
    70	
    71		tun_encap_info = mpls_lwtunnel_encap(dst->lwtstate);
    72	
    73		/* Obtain the ttl using the following set of rules.
    74		 *
    75		 * LWT ttl propagation setting:
    76		 *  - disabled => use default TTL value from LWT
    77		 *  - enabled  => use TTL value from IPv4/IPv6 header
    78		 *  - default  =>
    79		 *   Global ttl propagation setting:
    80		 *    - disabled => use default TTL value from global setting
    81		 *    - enabled => use TTL value from IPv4/IPv6 header
    82		 */
    83		if (dst->ops->family = AF_INET) {
    84			if (tun_encap_info->ttl_propagate = MPLS_TTL_PROP_DISABLED)
    85				ttl = tun_encap_info->default_ttl;
    86			else if (tun_encap_info->ttl_propagate = MPLS_TTL_PROP_DEFAULT &&
    87				 !net->mpls.ip_ttl_propagate)
    88				ttl = net->mpls.default_ttl;
    89			else
    90				ttl = ip_hdr(skb)->ttl;
    91			rt = (struct rtable *)dst;
    92		} else if (dst->ops->family = AF_INET6) {
    93			if (tun_encap_info->ttl_propagate = MPLS_TTL_PROP_DISABLED)
    94				ttl = tun_encap_info->default_ttl;
    95			else if (tun_encap_info->ttl_propagate = MPLS_TTL_PROP_DEFAULT &&
    96				 !net->mpls.ip_ttl_propagate)
    97				ttl = net->mpls.default_ttl;
    98			else
    99				ttl = ipv6_hdr(skb)->hop_limit;
   100			rt6 = (struct rt6_info *)dst;
   101		} else {
   102			goto drop;
   103		}
   104	
   105		/* Verify the destination can hold the packet */
   106		new_header_size = mpls_encap_size(tun_encap_info);
   107		mtu = mpls_dev_mtu(out_dev);
   108		if (mpls_pkt_too_big(skb, mtu - new_header_size))
   109			goto drop;
   110	
   111		hh_len = LL_RESERVED_SPACE(out_dev);
   112		if (!out_dev->header_ops)
   113			hh_len = 0;
   114	
   115		/* Ensure there is enough space for the headers in the skb */
   116		if (skb_cow(skb, hh_len + new_header_size))
   117			goto drop;
   118	
   119		skb_set_inner_protocol(skb, skb->protocol);
   120		skb_reset_inner_network_header(skb);
   121	
   122		skb_push(skb, new_header_size);
   123	
   124		skb_reset_network_header(skb);
   125	
   126		skb->dev = out_dev;
   127		skb->protocol = htons(ETH_P_MPLS_UC);
   128	
   129		/* Push the new labels */
   130		hdr = mpls_hdr(skb);
   131		bos = true;
   132		for (i = tun_encap_info->labels - 1; i >= 0; i--) {
   133			hdr[i] = mpls_entry_encode(tun_encap_info->label[i],
   134						   ttl, 0, bos);
   135			bos = false;
   136		}
   137	
   138		mpls_stats_inc_outucastpkts(out_dev, skb);
   139	
   140		if (rt)
   141			err = neigh_xmit(NEIGH_ARP_TABLE, out_dev, &rt->rt_gateway,
   142					 skb);
   143		else if (rt6)
   144			err = neigh_xmit(NEIGH_ND_TABLE, out_dev, &rt6->rt6i_gateway,
   145					 skb);
   146		if (err)
   147			net_dbg_ratelimited("%s: packet transmission failed: %d\n",
   148					    __func__, err);
   149	
   150		return LWTUNNEL_XMIT_DONE;
   151	
   152	drop:
   153		out_mdev = out_dev ? mpls_dev_get(out_dev) : NULL;
                           ^^^^^^^
Checked too late.

   154		if (out_mdev)
   155			MPLS_INC_STATS(out_mdev, tx_errors);

regards,
dan carpenter
