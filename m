From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Aug 2017 08:58:32 +0000
Subject: [bug report] net: hns3: Add support of HNS3 Ethernet Driver for hip08 SoC
Message-Id: <20170810085832.qdje3ixuabavumao@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Salil,

The patch 76ad4f0ee747: "net: hns3: Add support of HNS3 Ethernet
Driver for hip08 SoC" from Aug 2, 2017, leads to the following static
checker warning:

	drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_enet.c:1059 hns3_nic_get_stats64()
	error: uninitialized symbol 'start'.

drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_enet.c
  1040  static void
  1041  hns3_nic_get_stats64(struct net_device *netdev, struct rtnl_link_stats64 *stats)
  1042  {
  1043          struct hns3_nic_priv *priv = netdev_priv(netdev);
  1044          int queue_num = priv->ae_handle->kinfo.num_tqps;
  1045          struct hns3_enet_ring *ring;
  1046          unsigned int start;
                ^^^^^^^^^^^^^^^^^^
  1047          unsigned int idx;
  1048          u64 tx_bytes = 0;
  1049          u64 rx_bytes = 0;
  1050          u64 tx_pkts = 0;
  1051          u64 rx_pkts = 0;
  1052  
  1053          for (idx = 0; idx < queue_num; idx++) {
  1054                  /* fetch the tx stats */
  1055                  ring = priv->ring_data[idx].ring;
  1056                  do {
  1057                          tx_bytes += ring->stats.tx_bytes;
  1058                          tx_pkts += ring->stats.tx_pkts;
  1059                  } while (u64_stats_fetch_retry_irq(&ring->syncp, start));
                                                                         ^^^^^
  1060  
  1061                  /* fetch the rx stats */
  1062                  ring = priv->ring_data[idx + queue_num].ring;
  1063                  do {
  1064                          rx_bytes += ring->stats.rx_bytes;
  1065                          rx_pkts += ring->stats.rx_pkts;
  1066                  } while (u64_stats_fetch_retry_irq(&ring->syncp, start));
                                                                         ^^^^^
It's not clear what is intended here.

  1067          }
  1068  

regards,
dan carpenter
