From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Apr 2017 13:55:01 +0000
Subject: [bug report] ipv6: implement dataplane support for rthdr type 4 (Segment Routing Header)
Message-Id: <20170419135500.ntv67xcc3wnkkzr6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello David Lebrun,

The patch 1ababeba4a21: "ipv6: implement dataplane support for rthdr
type 4 (Segment Routing Header)" from Nov 8, 2016, leads to the
following static checker warning:

	net/ipv6/exthdrs.c:391 ipv6_srh_rcv()
	error: double free of 'skb'

net/ipv6/exthdrs.c
   384  
   385          if (hdr->segments_left >= (hdr->hdrlen >> 1)) {
   386                  __IP6_INC_STATS(net, ip6_dst_idev(skb_dst(skb)),
   387                                  IPSTATS_MIB_INHDRERRORS);
   388                  icmpv6_param_prob(skb, ICMPV6_HDR_FIELD,
                                          ^^^
Freed here.

   389                                    ((&hdr->segments_left) -
   390                                     skb_network_header(skb)));
   391                  kfree_skb(skb);
                                  ^^^
And again here.

   392                  return -1;
   393          }
   394  

regards,
dan carpenter
