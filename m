From: <dan.carpenter@oracle.com>
Date: Mon, 20 Jul 2020 12:53:05 +0000
Subject: [bug report] Add support for the latest 1G/10G Chelsio adapter, T3.
Message-Id: <20200720125305.GA59894@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Vishal,

This is ancient code, but apparently you worked on it recently and no
good deed goes unpunished.  ;)

The patch 4d22de3e6cc4: "Add support for the latest 1G/10G Chelsio
adapter, T3." from Jan 18, 2007, leads to the following static
checker warning:

	drivers/net/ethernet/chelsio/cxgb3/sge.c:2086 rx_eth()
	error: buffer overflow 'adap->port' 2 <= 15 user_rl='0-15' uncapped

drivers/net/ethernet/chelsio/cxgb3/sge.c
  2078  static void rx_eth(struct adapter *adap, struct sge_rspq *rq,
  2079                     struct sk_buff *skb, int pad, int lro)
  2080  {
  2081          struct cpl_rx_pkt *p = (struct cpl_rx_pkt *)(skb->data + pad);
                                                             ^^^^^^^^^
Smatch distrusts skb->data.

  2082          struct sge_qset *qs = rspq_to_qset(rq);
  2083          struct port_info *pi;
  2084  
  2085          skb_pull(skb, sizeof(*p) + pad);
  2086          skb->protocol = eth_type_trans(skb, adap->port[p->iff]);
                                                               ^^^^^^
So it says that this can crash.  The ->port array only has two elements
and p->iff can go up to 16.  This seems like a valid bug.  I'm not
really sure how to address it..

  2087          pi = netdev_priv(skb->dev);
  2088          if ((skb->dev->features & NETIF_F_RXCSUM) && p->csum_valid &&
  2089              p->csum = htons(0xffff) && !p->fragment) {
  2090                  qs->port_stats[SGE_PSTAT_RX_CSUM_GOOD]++;
  2091                  skb->ip_summed = CHECKSUM_UNNECESSARY;
  2092          } else
  2093                  skb_checksum_none_assert(skb);
  2094          skb_record_rx_queue(skb, qs - &adap->sge.qs[pi->first_qset]);
  2095  
  2096          if (p->vlan_valid) {
  2097                  qs->port_stats[SGE_PSTAT_VLANEX]++;
  2098                  __vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), ntohs(p->vlan));
  2099          }
  2100          if (rq->polling) {
  2101                  if (lro)

regards,
dan carpenter
