From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Jan 2018 09:50:47 +0000
Subject: [bug report] Add support for the latest 1G/10G Chelsio adapter, T3.
Message-Id: <20180123095047.GA23041@mwanda>
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
  2068  /**
  2069   *      rx_eth - process an ingress ethernet packet
  2070   *      @adap: the adapter
  2071   *      @rq: the response queue that received the packet
  2072   *      @skb: the packet
  2073   *      @pad: amount of padding at the start of the buffer
  2074   *
  2075   *      Process an ingress ethernet pakcet and deliver it to the stack.
  2076   *      The padding is 2 if the packet was delivered in an Rx buffer and 0
  2077   *      if it was immediate data in a response.
  2078   */
  2079  static void rx_eth(struct adapter *adap, struct sge_rspq *rq,
  2080                     struct sk_buff *skb, int pad, int lro)
  2081  {
  2082          struct cpl_rx_pkt *p = (struct cpl_rx_pkt *)(skb->data + pad);
                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Smatch marks the p as untrusted data because it seems to come from the
network

  2083          struct sge_qset *qs = rspq_to_qset(rq);
  2084          struct port_info *pi;
  2085  
  2086          skb_pull(skb, sizeof(*p) + pad);
  2087          skb->protocol = eth_type_trans(skb, adap->port[p->iff]);
                                                               ^^^^^^
so how do we know that it's in the 0-3 range?  Smatch thinks it could
go as high as 15.

  2088          pi = netdev_priv(skb->dev);
  2089          if ((skb->dev->features & NETIF_F_RXCSUM) && p->csum_valid &&
  2090              p->csum = htons(0xffff) && !p->fragment) {
  2091                  qs->port_stats[SGE_PSTAT_RX_CSUM_GOOD]++;
  2092                  skb->ip_summed = CHECKSUM_UNNECESSARY;
  2093          } else
  2094                  skb_checksum_none_assert(skb);
  2095          skb_record_rx_queue(skb, qs - &adap->sge.qs[pi->first_qset]);
  2096  

regards,
dan carpenter
