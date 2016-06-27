From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jun 2016 19:42:10 +0000
Subject: re: qede: Add support for coalescing config read/update.
Message-Id: <20160627194210.GA30526@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sudarsana Reddy Kalluru,

The patch d552fa84cb35: "qede: Add support for coalescing config
read/update." from Jun 21, 2016, leads to the following static
checker warning:

	drivers/net/ethernet/qlogic/qede/qede_ethtool.c:435 qede_get_coalesce()
	warn: passing casted pointer '&coal->rx_coalesce_usecs' to 'edev->ops->common->get_coalesce()' 32 vs 16.

drivers/net/ethernet/qlogic/qede/qede_ethtool.c
   429  static int qede_get_coalesce(struct net_device *dev,
   430                               struct ethtool_coalesce *coal)
   431  {
   432          struct qede_dev *edev = netdev_priv(dev);
   433  
   434          memset(coal, 0, sizeof(struct ethtool_coalesce));
   435          edev->ops->common->get_coalesce(edev->cdev,
   436                                          (u16 *)&coal->rx_coalesce_usecs,
   437                                          (u16 *)&coal->tx_coalesce_usecs);

This won't work on big endian systems.  Fix it so the function takes a
u32 or make ->rx_coalesce_usecs a u16.

   438  
   439          return 0;
   440  }

regards,
dan carpenter
