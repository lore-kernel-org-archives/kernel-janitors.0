From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Aug 2017 09:00:45 +0000
Subject: [bug report] net: hns3: Add support of HNS3 Ethernet Driver for hip08 SoC
Message-Id: <20170810090045.afop4mdjsjnhc6tw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170810085832.qdje3ixuabavumao@mwanda>
In-Reply-To: <20170810085832.qdje3ixuabavumao@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[ More warnings.  -dan ]

Hello Salil,

The patch 76ad4f0ee747: "net: hns3: Add support of HNS3 Ethernet
Driver for hip08 SoC" from Aug 2, 2017, leads to the following static
checker warning:

	drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_enet.c:466 hns3_get_l4_protocol()
	error: uninitialized symbol 'l4_proto_tmp'.

drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_enet.c
   439  static void hns3_get_l4_protocol(struct sk_buff *skb, u8 *ol4_proto,
   440                                   u8 *il4_proto)
   441  {
   442          union {
   443                  struct iphdr *v4;
   444                  struct ipv6hdr *v6;
   445                  unsigned char *hdr;
   446          } l3;
   447          unsigned char *l4_hdr;
   448          unsigned char *exthdr;
   449          u8 l4_proto_tmp;
   450          __be16 frag_off;
   451  
   452          /* find outer header point */
   453          l3.hdr = skb_network_header(skb);
   454          l4_hdr = skb_inner_transport_header(skb);
   455  
   456          if (skb->protocol = htons(ETH_P_IPV6)) {
   457                  exthdr = l3.hdr + sizeof(*l3.v6);
   458                  l4_proto_tmp = l3.v6->nexthdr;
   459                  if (l4_hdr != exthdr)
   460                          ipv6_skip_exthdr(skb, exthdr - skb->data,
   461                                           &l4_proto_tmp, &frag_off);
   462          } else if (skb->protocol = htons(ETH_P_IP)) {
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is always true right?  Because otherwise we're in trouble.

   463                  l4_proto_tmp = l3.v4->protocol;
   464          }
   465  
   466          *ol4_proto = l4_proto_tmp;
   467  

regards,
dan carpenter
