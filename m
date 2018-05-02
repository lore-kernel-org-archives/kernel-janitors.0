From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 May 2018 12:41:39 +0000
Subject: [bug report] [ETH]: Make eth_type_trans set skb->dev like the other *_type_trans
Message-Id: <20180502124139.GA24433@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Santosh.  This one is very old...

The patch 4c13eb6657fe: "[ETH]: Make eth_type_trans set skb->dev like
the other *_type_trans" from Apr 25, 2007, leads to the following
static checker warning:

	drivers/net/ethernet/chelsio/cxgb3/sge.c:2087 rx_eth()
	error: buffer overflow 'adap->port' 2 <= 15 user_rl='0-15'

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
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Smatch always distruts skb->data.

  2083          struct sge_qset *qs = rspq_to_qset(rq);
  2084          struct port_info *pi;
  2085  
  2086          skb_pull(skb, sizeof(*p) + pad);
  2087          skb->protocol = eth_type_trans(skb, adap->port[p->iff]);
                                                               ^^^^^^
How do we know this doesn't is within bounds?

  2088          pi = netdev_priv(skb->dev);
  2089          if ((skb->dev->features & NETIF_F_RXCSUM) && p->csum_valid &&
  2090              p->csum = htons(0xffff) && !p->fragment) {
  2091                  qs->port_stats[SGE_PSTAT_RX_CSUM_GOOD]++;
  2092                  skb->ip_summed = CHECKSUM_UNNECESSARY;
  2093          } else
  2094                  skb_checksum_none_assert(skb);
  2095          skb_record_rx_queue(skb, qs - &adap->sge.qs[pi->first_qset]);
  2096  
  2097          if (p->vlan_valid) {
  2098                  qs->port_stats[SGE_PSTAT_VLANEX]++;
  2099                  __vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), ntohs(p->vlan));
  2100          }


regards,
dan carpenter
