From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Nov 2017 11:49:03 +0000
Subject: [bug report] Add support for the latest 1G/10G Chelsio adapter, T3.
Message-Id: <20171129114903.y2yahvxklher5nwu@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Divy Le Ray,

The patch 4d22de3e6cc4: "Add support for the latest 1G/10G Chelsio
adapter, T3." from Jan 18, 2007, leads to the following static
checker warning:

	drivers/net/ethernet/chelsio/cxgb3/sge.c:2087 rx_eth()
	error: buffer overflow 'adap->port' 2 <= 15

drivers/net/ethernet/chelsio/cxgb3/sge.c
  2079  static void rx_eth(struct adapter *adap, struct sge_rspq *rq,
  2080                     struct sk_buff *skb, int pad, int lro)
  2081  {
  2082          struct cpl_rx_pkt *p = (struct cpl_rx_pkt *)(skb->data + pad);
                                                             ^^^^^^^^^^^^^^^
Smatch marks all data stored in skb->data as untrusted.

  2083          struct sge_qset *qs = rspq_to_qset(rq);
  2084          struct port_info *pi;
  2085  
  2086          skb_pull(skb, sizeof(*p) + pad);
  2087          skb->protocol = eth_type_trans(skb, adap->port[p->iff]);
                                                               ^^^^^^^
But we're using it in as an array offset without doing a bounds check.
Does skb->data come from the firmware?  Perhaps this code is fine as-is.

  2088          pi = netdev_priv(skb->dev);
  2089          if ((skb->dev->features & NETIF_F_RXCSUM) && p->csum_valid &&
  2090              p->csum = htons(0xffff) && !p->fragment) {
  2091                  qs->port_stats[SGE_PSTAT_RX_CSUM_GOOD]++;
  2092                  skb->ip_summed = CHECKSUM_UNNECESSARY;
  2093          } else
  2094                  skb_checksum_none_assert(skb);

regards,
dan carpenter
