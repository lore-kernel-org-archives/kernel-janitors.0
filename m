From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Apr 2019 09:53:24 +0000
Subject: [bug report] dpaa2-eth: Add flow steering support without masking
Message-Id: <20190424095324.GA16664@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ioana Ciocoi Radulescu,

The patch 2d6802374c69: "dpaa2-eth: Add flow steering support without
masking" from Apr 16, 2019, leads to the following static checker
warning:

	drivers/net/ethernet/freescale/dpaa2/dpaa2-ethtool.c:503 do_cls_rule()
	warn: was expecting a 64 bit value instead of '0'

drivers/net/ethernet/freescale/dpaa2/dpaa2-ethtool.c
   486  static int do_cls_rule(struct net_device *net_dev,
   487                         struct ethtool_rx_flow_spec *fs,
   488                         bool add)
   489  {
   490          struct dpaa2_eth_priv *priv = netdev_priv(net_dev);
   491          struct device *dev = net_dev->dev.parent;
   492          struct dpni_rule_cfg rule_cfg = { 0 };
   493          struct dpni_fs_action_cfg fs_act = { 0 };
   494          dma_addr_t key_iova;
   495          u64 fields = 0;
   496          void *key_buf;
   497          int err;
   498  
   499          if (fs->ring_cookie != RX_CLS_FLOW_DISC &&
   500              fs->ring_cookie >= dpaa2_eth_queue_count(priv))
   501                  return -EINVAL;
   502  
   503          rule_cfg.key_size = dpaa2_eth_cls_key_size(DPAA2_ETH_DIST_ALL);
                                                           ^^^^^^^^^^^^^^^^^^
This is UINT_MAX but we probably wanted to pass U64_MAX.

   504  
   505          /* allocate twice the key size, for the actual key and for mask */
   506          key_buf = kzalloc(rule_cfg.key_size * 2, GFP_KERNEL);
   507          if (!key_buf)
   508                  return -ENOMEM;

See also:
drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:2870 dpaa2_eth_set_default_cls() warn: was expecting a 64 bit value instead of '0'

regards,
dan carpenter
